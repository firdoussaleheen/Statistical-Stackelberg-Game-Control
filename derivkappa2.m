function dkappa2dt = derivkappa2(t,kappa2,A,S2,B1,B2, avgamma1) 
% determine derivative for kappa2
%kappa2 = reshape(kappa2,n,1); %Convert from "n^2"-by-1 to "n"-by-"n"
%dkappa2dt = zeros(n,1);
dkappa2dt = -(A.')*kappa2 + S2*B2*(B2.')*kappa2 - S2*B1*avgamma1; %Determine derivative
%dkappa2dt = dkappa2dt(:); %Convert from "n"-by-"n" to "n^2"-by-1 
end
