%% Guia 5, Ejercicio 6
% Utilice el algoritmo MOD desarrollado en el ejercicio anterior para 
% estimar los diccionarios utilizados a partir de los datos artificiales 
% generados en el Ejercicio Nº 4. Grafique el error cuadrático medio en la 
% estimación de  $\hat{\Phi}$, utilizando BP y MP para el cálculo de los 
% coeficientes, en función de l0(a).

% clear all
close all force

phi_hat_mp = cell(1,K);
phi_hat_bp = cell(1,K);
rms_phi_mp = zeros(1,K);
rms_phi_bp = zeros(1,K);

for l=1:K
    fprintf('========= l0(a) = %d =========\n',l);
    [phi_hat_mp{l},~] = my_mod(x{l},M,l0(l),'mp');
    [phi_hat_bp{l},~] = my_mod(x{l},M,l0(l),'bp');
    rms_phi_mp(l) = rms(rms(phi-phi_hat_mp{l}));
    rms_phi_bp(l) = rms(rms(phi-phi_hat_bp{l}));
end

figure()
plot(rms_phi_bp,'r-sq');
hold on;
plot(rms_phi_mp,'g-*');
hold off;
legend('BP','MP');
xlabel('l0(a)');
ylabel('RMS');
title('RMS de $\hat{\Phi}$','Interpreter','latex');
