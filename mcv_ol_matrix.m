function Aaug = mcv_ol_matrix(A,B,C,Q,R,mu,Thetagamma,Theta)

nA = size(A);
Aaug = [ A          (-1/2*mu)*B*(1/R)*(B.')      zeros(nA)      zeros(nA);
        -2*mu*Q            -A.'               -8*Q            zeros(nA);
         zeros(nA)       zeros(nA)             zeros(nA)      C*Thetagamma*(C.')+Theta;
        -Q               zeros(nA)             zeros(nA)      -A.'];
end    
    