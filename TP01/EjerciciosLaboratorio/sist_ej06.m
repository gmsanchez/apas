function [y] = sist_ej06(x,n0)
    if nargin<2
        n0=2;
    end
    lx = length(x);
    z = zeros(1,n0);
    y = zeros(1,n0+lx);
    x = [z x];    
    y = [z y];
    
    for n=1+n0:lx+n0
        y(n) = ( x(n) - 2*x(n-1) + x(n-2) + 4*y(n-1) - 5*y(n-2) )/6;
    end
    
    y = y(n0:lx+n0);

end
