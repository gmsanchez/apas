%% Verificacion numerica condicion de admisibilidad diadica

N = 20;
W = 10;
w = -W:0.01:W;

m = 2; % orden de la box spline
if mod(m,2)==0
    eps = 1;
else
    eps = 0;
end

sum = 0.*w;

for j=-N:1:N
   w1 = 2^j.*w./4;
   psi = -1i .* w1 .* (sin(w1)./w1).^(m+2) .* exp(-1i.*w1.*(1+eps));
   sum = sum + abs(psi).^2;
end

A = min(sum)
B = max(sum)
