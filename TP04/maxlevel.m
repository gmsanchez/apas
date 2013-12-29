function [ N ] = maxlevel( x )

lx = length(x);
N = floor(log(lx)/log(2));

end

