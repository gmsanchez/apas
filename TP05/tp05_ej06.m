%% Guia 5, Ejercicio 6
% Utilice el algoritmo MOD desarrollado en el ejercicio anterior para 
% estimar los diccionarios utilizados a partir de los datos artificiales 
% generados en el Ejercicio Nº 4. Grafique el error cuadrático medio en la 
% estimación de  $\hat{\Phi}$, utilizando BP y MP para el cálculo de los 
% coeficientes, en función de l0(a).

% clear all
%close all force

phi_hat_mp = cell(1,K);
phi_hat_bp = cell(1,K);
a_hat_mp = cell(1,K);
a_hat_bp = cell(1,K);
rms_phi_mp = zeros(1,K);
rms_phi_bp = zeros(1,K);
rms_x_mp = zeros(1,K);
rms_x_bp = zeros(1,K);

for l=1:K
    % numatoms = l0(l);
    numatoms = 100;
    fprintf('========= l0(a) = %d =========\n',l);
    [phi_hat_mp{l},a_hat_mp{l}] = my_mod(x{l},M,numatoms,'mp');
    [phi_hat_bp{l},a_hat_bp{l}] = my_mod(x{l},M,numatoms,'bp');
    rms_phi_mp(l) = mean(rms(phi-phi_hat_mp{l}));
    rms_phi_bp(l) = mean(rms(phi-phi_hat_bp{l}));
    rms_x_mp(l) = mean(rms(x{l}-phi_hat_mp{l}*a_hat_mp{l}));
    rms_x_bp(l) = mean(rms(x{l}-phi_hat_bp{l}*a_hat_bp{l}));
end

figure()
plot(rms_phi_bp,'r-sq');
hold on;
plot(rms_phi_mp,'g-*');
hold off;
legend('BP','MP');
xlabel('l0(a)');
ylabel('RMS Promedio');
title('RMS Promedio de $\hat{\Phi}$','Interpreter','latex');

figure()
plot(rms_x_bp,'r-sq');
hold on;
plot(rms_x_mp,'g-*');
hold off;
legend('BP','MP');
xlabel('l0(a)');
ylabel('RMS Promedio');
title('RMS Promedio de $\hat{x}$','Interpreter','latex');

%% 
l0a_bp = zeros(1,K);
l0a_mp = zeros(1,K);
for l=1:K
    aux_bp = zeros(1,realizations);
    aux_mp = zeros(1,realizations);
    for r=1:realizations
        aux_mp(r) = sum(abs(a_hat_mp{l}(:,r))>1e-6);
        aux_bp(r) = sum(abs(a_hat_bp{l}(:,r))>1e-6);
    end
    l0a_mp(l) = mean(aux_mp);
    l0a_bp(l) = mean(aux_bp);
end

figure()
plot(l0a_bp,'r-sq');
hold on;
plot(l0a_mp,'g-*');
hold off;
legend('BP','MP');
xlabel('l0(a)');
ylabel('Promedio de l0(a)');
title('l0(a) Promedio de $\hat{a}$','Interpreter','latex');