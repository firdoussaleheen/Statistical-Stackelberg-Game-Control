function dS2dt = derivS2(t,S2,A,B2,Q2,n,options) 
% determine derivative for S2
S2 = reshape(S2, size(A)); %Convert from "n^2"-by-1 to "n"-by-"n"
%dS2dt = zeros(n,n); % initialize dS2dt
dS2dt = -(A.')*S2 - S2*A - Q2 + S2*B2*(B2.')*S2 ;%Determine derivative
dS2dt = dS2dt(:); %Convert from "n"-by-"n" to "n^2"-by-1
end


