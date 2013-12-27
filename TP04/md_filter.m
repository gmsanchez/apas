function [ g ] = md_filter(nrm)

g = 0.5*ones(2,1);
g(2) = -1*g(2);

if nrm
    g = g./norm(g);
end

end
