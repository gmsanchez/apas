function [ varargout ] = db4(nrm,o)

nbIn = nargin;
if nbIn<1
    error('Not enough input arguments.');
end
nbOut = nargout;
if ~any([0 1 2 4 8]==nbOut)
    error('Invalid number of output arguments.');
end

h = 1/8*[1+sqrt(3);  3+sqrt(3); 3-sqrt(3);  1-sqrt(3)];
g = 1/8*[1-sqrt(3); -3+sqrt(3); 3+sqrt(3); -1-sqrt(3)];

if nrm
    h = h./norm(h);
    g = g./norm(g);
end

% Filtro de descomposicion, invertido
Lo_D = flip(h);
Hi_D = flip(g);
% Filtro de reconstruccion
Lo_R = h;
Hi_R = g;

if nbIn==1
    varargout(1:4) = {Lo_D,Hi_D,Lo_R,Hi_R};
else
    o = lower(o(1));
    switch o
        case 'd' , varargout = {Lo_D,Hi_D};
        case 'r' , varargout = {Lo_R,Hi_R};
        otherwise
            error('Invalid argument value.');
    end
end
            
end
