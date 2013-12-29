function [ a, d ] = todd( x, h, g, N )

%lx = length(x);
mlvl = maxlevel(x);

if mlvl<N
    sprintf('Numero de niveles incorrecto, se procede con %d niveles',...
        mlvl)
    N = mlvl;
end

a = cell(1,N);
d = cell(1,N);

[a{1}, d{1}] = my_dstep(x,h,g);
for i=2:N
    [a{i}, d{i}] = my_dstep(a{i-1},h,g);
end

end

