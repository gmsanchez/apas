function [ x ] = my_rstep( a, d, h, g )

aup = my_upsample(a);
dup = my_upsample(d);

h = flip(h);
g = flip(g);

lf = length(h);
delay = floor(lf*0.5);

% Realizo convolución con delay
xa = my_cconv(aup,h,-delay);
xd = my_cconv(dup,g,-delay);

x = xa+xd;

end

