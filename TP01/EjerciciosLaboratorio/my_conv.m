function [ y ] = my_conv( x,h )
    nx = length(x);
    nh = length(h);
    ny = nx+nh-1;
    y = zeros(1,ny);
    for n=1:ny
        for i = max(1,n+1-nh): min(n,nx)
            y(n) = y(n) + x(i)*h(n-i+1);
        end
    end
end

