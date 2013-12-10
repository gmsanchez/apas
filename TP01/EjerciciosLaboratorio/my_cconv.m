function [ y ] = my_cconv( x,h )
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

