function [ y ] = my_upsample( x )

nx = length(x);
y = 0.*wextend('1D','zpd',x,nx,'u');

y(2:2:end) = x;

end

