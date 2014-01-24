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

%% WPDEC
terminalnodes = [7 8 4 5 13 14];
[c0,t0] =  my_wpdec(y,Lo_D,Hi_D,3,terminalnodes);

%% Reconstruccion
yr = my_wprec(c0,Lo_R,Hi_R,t0);

figure();
subplot(3,1,1),plot(y);
subplot(3,1,2),plot(yr);
subplot(3,1,3),plot(yr-y);