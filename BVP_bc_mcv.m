% The boundary conditions:
% z(t0) = 0.0, rho(tf) = 0, v(t0)=0, phi(tf)=0;
function res = BVP_bc_mcv(ya,yb)
% res = [ ya(1)-0
%         ya(2)-0
%         ya(3)-0
%         ya(4)-0
%         ya(5)-0
%         ya(6)-0
%         yb(7)-10
%         yb(8)-10
%         yb(9)-10
%         yb(10)-10
%         yb(11)-10
%         yb(12)-10
%         ya(13)-0
%         ya(14)-0
%         ya(15)-0
%         ya(16)-0          
%         ya(17)-0
%         ya(18)-0
%         yb(19)-1
%         yb(20)-1
%         yb(21)-1
%         yb(22)-1
%         yb(23)-1
%         yb(24)-1];
    res = [ ya(1)-0
        ya(2)-0
        yb(3)-0
        ya(4)-0
        ya(5)-0
        yb(6)-0
        yb(7)-1.0
        yb(8)-1.0
        yb(9)-1.0
        yb(10)-1.0
        yb(11)-1.0
        yb(12)-1.0
        ya(13)-0
        ya(14)-0
        ya(15)-0
        ya(16)-0          
        ya(17)-0
        ya(18)-0
        yb(19)-0.1
        yb(20)-0.1
        yb(21)-0.1
        yb(22)-0.1
        yb(23)-0.1
        yb(24)-0.1];
    