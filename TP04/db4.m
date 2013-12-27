function [ h, g ] = db4(nrm)

h = 1/8*[1+sqrt(3);  3+sqrt(3); 3-sqrt(3);  1-sqrt(3)];
g = 1/8*[1-sqrt(3); -3+sqrt(3); 3+sqrt(3); -1-sqrt(3)];

if nrm
    h = h./norm(h);
    g = g./norm(g);
end

end
