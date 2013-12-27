function [ y ] = my_cconv( x,h,delay )
% Se utilizó la ecuacion que está en
% http://en.wikipedia.org/wiki/Convolution#equation_Eq.1
    if nargin<3
        delay=0;
    end
    h = circshift(h,delay);
    
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
