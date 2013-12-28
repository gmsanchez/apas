function [ a, d ] = my_dstep( x, h, g )

x = x(:);

lf = length(h);
delay = floor(lf*0.5);

% Realizo convolución con delay
a = my_downsample(my_cconv(x,h,-delay));
d = my_downsample(my_cconv(x,g,-delay));

end

