function [ a, d, c, l ] = todd( x, h, g, N )

if isrow(x)
    x = x(:);
end

lx = length(x);
mlvl = maxlevel(x);

if mlvl<N
    sprintf('Numero de niveles incorrecto, se procede con %d niveles',...
        mlvl)
    N = mlvl;
end

a = cell(1,N);
d = cell(1,N);

[a{1}, d{1}] = my_dstep(x,h,g);
c = [d{1}];
l = [length(d{1}), lx];
for i=2:N-1
    [a{i}, d{i}] = my_dstep(a{i-1},h,g);
    c = [d{i}; c];
    l = [length(d{i}), l];
end
[a{N}, d{N}] = my_dstep(a{N-1},h,g);
c = [a{N}; d{N}; c];
l = [length(a{N}), length(d{N}), l];
    
end

