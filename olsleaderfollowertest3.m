% Determine the follower's strategy
% System dynamics
clear all
run simplemodel4
%run linsatmodelwon
%run linsatmodelwonthanuja
%%
for ll=1:10
t0 = 0; % initial time
tf = 3; % final time
dt = 1e-2; % time interval
avgamma1 = 0.1; % expected value of leader's control

runs = 100; % number of runs for calculating average
%randseed = 0; % random number generator seed
randseed = round(100*sum(clock));

Thetagamma = 0.1; % covariance of expected value of 
Theta = 0.5; % covariance of Weiner process
mu(ll) = ll*0.1; % lagrange multiplier

nbar = 3;
%%
% Solve Riccati type equation using ode45 solver
n = length(A);
tspan = t0:dt:tf;        % integration time span
S2_final = zeros(n,n); % terminating conditions
opts = odeset('RelTol',1e-6,'Stats','on');
[T,S2] = ode45(@derivS2, tspan, S2_final, [], A, B2, Q2,n,opts);

% Reverse and reshape the backward solution S2 into SS2
S2flip = S2;
S2 = flipud(S2);          % flips S2

[mdimS2, ndimS2] = size(S2);
SS2 = mat2cell(S2, ones(mdimS2,1), ndimS2);
fh_reshape = @(x)reshape(x,size(A));
SS2 = cellfun(fh_reshape,SS2,'UniformOutput',false);

% SS2flip is required for kappa2 calculation 
SS2flip = mat2cell(S2flip, ones(mdimS2,1), ndimS2);
SS2flip   = cellfun(fh_reshape,SS2flip,'UniformOutput',false);
%% Solve for kappa2 using ode45 solver
kappa2_final = zeros(n,1); % terminating conditions

for ii = 1: mdimS2
SS2flipv2 = SS2flip{ii};
[T,kappa2] = ode45(@derivkappa2, tspan, kappa2_final, [], A, SS2flipv2, B1, B2, avgamma1);
end                        

% Reverse and reshape the backward solution of kappa2
kappa2 = flipud(kappa2);
[mdimkappa2, ndimkappa2] = size(kappa2);
kkappa2 = mat2cell(kappa2, ones(mdimkappa2,1), ndimkappa2);
fh_reshape = @(x)reshape(x,size(B2));
kkappa2 = cellfun(fh_reshape,kkappa2,'UniformOutput',false);
%% Calculate the average of states by running simulink model multiple times (ode45 solver)
% consider unit step input
Ahat = A;
Bhat = [B1 B2 F];
Chat = eye(n,n);
Dhat = zeros(n,length(Bhat));

stoptime=tf;
simName = {'openloopwithnoise2'};
[avgstates, simtime] = simStates(runs,simName);
%% Determine followers control
gamma2opt = zeros(mdimS2,1);
for jj = 1: mdimS2
gamma2opt(jj) = -(B2.')*(SS2{jj}*(avgstates(jj,:)).'+kkappa2{jj});
end 
gamma2follower{ll} = [T,gamma2opt];
%% Modified system for leader considering follower's optimal response

Tfollower = T;
% initialize cell
Abarc = cell(mdimS2,1);
Bbarc = cell(mdimS2,1);
Cbarc = cell(mdimS2,1);
Fbarc = cell(mdimS2,1);
Q1barc = cell(mdimS2,1);
Q1fbarc = cell(mdimS2,1);
Aaugc = cell(mdimS2,1);
% loop to calculate parameters for all the time instrances

for kk = 1: mdimS2
SSS2 =   SS2{kk};
[Abar,Bbar,Cbar,Fbar,Q1bar,Q1fbar]=sysbar(A,B1,B2,F,Q1,Q1f,R,SSS2);
Aaug = mcv_ol_matrix(Abar,Bbar,Cbar,Q1bar,R,mu(ll),Thetagamma,Theta);
Abarc{kk}=Abar;
Bbarc{kk}=Bbar;
Cbarc{kk}=Cbar;
Fbarc{kk}=Fbar;
Q1barc{kk}=Q1bar;
Q1fbarc{kk}=Q1fbar;
Aaugc{kk} = Aaug;
end

% Initial guess for the solution
yinit = [0 0 0 0 0 0 ...
 10 10 10 10 10 10 ...
 0 0 0 0 0 0 ...
 1 1 1 1 1 1];
solinit = bvpinit(linspace(t0,tf,mdimS2), yinit);
options = bvpset('Stats','on','RelTol',1e-3);

sol = bvp4c(@(t,y)BVP_ode_mcv(t,y,Aaugc), @BVP_bc_mcv, solinit,options);

Tleader = sol.x;
xbar = sol.y;

zbar   = xbar(1:n*nbar,:);
rhobar = xbar(n*nbar+1:2*n*nbar,:); rhobar = fliplr(rhobar);
nubar  = xbar(2*n*nbar+1:3*n*nbar,:);
phibar = xbar(3*n*nbar+1:end,:);phibar = fliplr(phibar);

%% Determine leader's control
%gamma1opt = zeros(mdimkappa2,1);
for kk = 1:mdimS2
gamma1opt(kk) = -(1/2*mu(ll))*(Bbarc{kk}.')*rhobar(:,kk);
end 
gamma1opt1=gamma1opt.';

gamma1leader{ll} = [T,gamma1opt1];


%% Determine state trajectory from the original system
simName = {'openloopstatetraj1'};
runs = 100;
randseed = round(100*sum(clock));
[xtraj, simtime] = simStates(runs,simName);
xtraj1{ll}=xtraj;
%% calculate leader and follower cost
for kk= 1:mdimS2
Jleader(kk) = tf*(xtraj(kk,:)*Q1*(xtraj(kk,:)).'+ ...
    gamma1opt1(kk,:)*(gamma1opt1(kk,:).')+gamma2opt(kk,:)*R*(gamma2opt(kk,:).'))/length(T);
Jfollower(kk) = tf*(xtraj(kk,:)*Q2*(xtraj(kk,:).') + ...
     + gamma2opt(kk,:)*(gamma2opt(kk,:).'))/length(T);
end

meanJ1(ll)=mean(Jleader);
varJ1(ll)=var(Jleader);
meanJ2(ll) = mean(Jfollower);
varJ2(ll) = var(Jfollower);

end
%% save the variables
% save('olsmutest10.mat','mu', 'zbar','rhobar','nubar','phibar',...
%     'gamma1leader','gamma2follower','xtraj','Jleader','Jfollower',...
%     'meanJ1','varJ1','meanJ2','varJ2'); 