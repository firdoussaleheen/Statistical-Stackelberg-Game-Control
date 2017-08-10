% ODEs for MCV
function dydt = BVP_ode_mcv(t,y,Aaugc)

% [Abar,Bbar,Cbar,Fbar,Q1bar,Q1fbar]=sysbar(A,B1,B2,F,Q1,Q1f,R,SSS2);
% Aaug = mcv_ol_matrix_var(t,Abar,Bbar,Cbar,Q1bar,R,mu,Thetagamma,Theta);
%run simplemodel2.m
% B = B1;
% Q = Q1;
% C = eye(2,2);
% Thetagamma = 0.1;
% Theta = 0.1;
% mu = 1;
% 
% Aaug = mcv_ol_matrix(A,B1,C,Q1,R,mu,Thetagamma,Theta);

% nA = size(A);
% Aaug = [ A          (-1/mu)*B*(1/R)*(B.')      zeros(nA)      zeros(nA);
%         -2*mu*Q            -A.'               -8*Q            zeros(nA);
%          zeros(nA)       zeros(nA)             zeros(nA)      C*Thetagamma*(C.')+Theta;
%         -Q               zeros(nA)             zeros(nA)      -A.'];

% Aaug =[
% 
%          0    1.0000         0         0         0         0         0         0
%    -1.0000         0         0   -1.0000         0         0         0         0
%    -2.0000         0         0    1.0000   -8.0000         0         0         0
%          0   -2.0000   -1.0000         0         0   -8.0000         0         0
%          0         0         0         0         0         0    0.2000    0.1000
%          0         0         0         0         0         0    0.1000    0.2000
%    -1.0000         0         0         0         0         0         0    1.0000
%          0   -1.0000         0         0         0         0   -1.0000         0];
%%
% write the matrix differential equation
%global Aaug;
%global Tfollower;
%Aaugvar = cellfun(@(first,second,third)interp1(Tfollower,Aaugc,t),'UniformOutput', false);
for kk = 1:numel(t)
dydt = Aaugc{kk}*y;
dydt = dydt(:);
end
end
