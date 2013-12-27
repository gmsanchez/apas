function [ y ] = my_cconv( x,h,delay )
% Se utilizó la ecuacion que está en
% http://en.wikipedia.org/wiki/Convolution#equation_Eq.1
    if nargin<3
        delay=0;
    end
        
    nx = length(x);
    nh = length(h);
    ny = max(nx,nh);
    
    if isrow(x)
        % Para que funcione bien el padarray
        x = x(:);
        h = h(:);
        y = zeros(1,ny);
    else
        y = zeros(ny,1);
    end
    
    h = circshift(h,delay);

    
    if nh<ny
        h = padarray(h,ny-nh,'post');
    end
    
    if nx<ny
        x = paddarray(x,ny-nx,'circular','post');
    end
    
    for n=1:ny
        for m=1:ny
            j = mod(n-m,ny);
            y(n) = y(n)+x(m)*h(j+1);
        end
    end
    
end
