function [ y ] = my_cconv( x,h )
% Se utilizó la ecuacion de http://en.wikipedia.org/wiki/Convolution#equation_Eq.1
    nx = length(x);
    nh = length(h);
    ny = max(nx,nh);
    y = zeros(1,ny);

    for n=1:ny
        for m=1:ny
            j = mod(n-m,ny);
            y(n) = y(n)+x(m)*h(j+1);
        end
    end
    
end
