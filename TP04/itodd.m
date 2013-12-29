function [ x ] = itodd( c,l,h,g,lvl )

NMAX = length(l)-2;
if nargin<5
    N = NMAX;
else
    if lvl<NMAX
        N = lvl;
    else
        N = NMAX;
    end
end
    

a = c(1:l(1));
for k=2:N+1
    p1 = sum(l(1:k-1))+1;
    p2 = sum(l(1:k));
    d = c(p1:p2);
    a = my_rstep(a,d,h,g);
    % size(a)
end

x = a;

end

