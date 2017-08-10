function [Abar,Bbar,Cbar,Fbar,Q1bar,Q1fbar]=sysbar(A,B1,B2,F,Q1,Q1f,R,S2)
nA = size(A);
nB1 = size(B1);
nF = size(F);
nQ1 = size(Q1);
Abar = [ A-B2*(B2.')*S2        zeros(nA)     -B2*(B2.');
            zeros(nA)               A         zeros(nA)     ;
            zeros(nA)          zeros(nA)     -(A-S2*B2*(B2.'))];
        
Bbar = [    zeros(nB1)    ;          B1  ;      zeros(nB1) ];

Cbar = [    B1        ;    -B1    ;    S2*B1];

Fbar = [    zeros(nF)   ;           F    ;      zeros(nF)];

Q1bar= [ Q1-S2*B2*R*(B2.')*S2 zeros(nQ1)    -S2*B2*R*(B2.');
        zeros(nQ1)            Q1              zeros(nQ1)  ;
         B2*R*(B2.')*S2       zeros(nQ1)       B2*R*(B2.')];
     
Q1fbar= [      Q1f     zeros(nQ1)           zeros(nQ1);
          zeros(nQ1)   Q1f                 zeros(nQ1);
          zeros(nQ1)   zeros(nQ1)          zeros(nQ1)];
      
end