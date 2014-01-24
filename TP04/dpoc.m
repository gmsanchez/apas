function [ c ] = dpoc( y,Lo_D,Hi_D,lvl )
%DPOC Descomposicion Paquete de Onditas Completa
%   Detailed explanation goes here
N = length(y);
c = y;

for k=0:lvl-1
    lvl_iter = 2^k;
    lvl_length = N/lvl_iter;
    for n=1:lvl_iter
        p1 = lvl_length*(n-1)+1;
        p2 = lvl_length*n;
        [a,d] = my_dstep(c(p1:p2),Lo_D,Hi_D);
        c(p1:p2) = [a d];
    end
end

end

