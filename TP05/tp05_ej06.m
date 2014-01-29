%% Guia 5, Ejercicio 6
% Utilice el algoritmo MOD desarrollado en el ejercicio anterior para 
% estimar los diccionarios utilizados a partir de los datos artificiales 
% generados en el Ejercicio N� 4. Grafique el error cuadr�tico medio en la 
% estimaci�n de  ??, utilizando BP y MP para el c�lculo de los 
% coeficientes, en funci�n de l0(a).

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

% break
% 
% for l=1:K
%     figure(1);
%     subplot(K/2,2,l);
%     plot(rms_phi_mp{l});
%     title(sprintf('RMS Phi con MP y l0(a)=%d',l));
%     figure(2);
%     subplot(K/2,2,l);
%     plot(rms_phi_mp{l});
%     title(sprintf('RMS Phi con LBP y l0(a)=%d',l));
% end
% 
% figure(1); suptitle('RMS con MP');
% figure(2); suptitle('RMS con LBP');
%%
% [phi_hat,a_hat] = my_mod(x,M,l0);

% norm(x-phi_hat*a,'fro')

%%
% k = 1;
% close all
% plot(x(:,k),'r-o'); hold on; plot(phi_hat*a_hat(:,k),'b-+');
