%% Guia 4, Ejercicio 6
%
close all;
clear all;

% Obtenemos nuestra senoidal
get_senoidal

%% Inciso a
[Lo_D,Hi_D,Lo_R,Hi_R] = db4(1);
lvl = 4;

subplot(lvl+1,1,1)
plot(y);
title('Se~nal original.');

for k=1:lvl
c = dpoc(y,Lo_D,Hi_D,k);
subplot(lvl+1,1,k+1)
plot(c);
if k==1
    title(sprintf('DPOC %d nivel.',k));
else
    title(sprintf('DPOC %d niveles.',k));
end
end
