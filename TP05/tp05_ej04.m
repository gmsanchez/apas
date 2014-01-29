%% Guia 5, Ejercicio 4
% Pruebe el desempe�o de los algoritmos de MP y BP implementados en los 
% ejercicios anteriores utilizando se�ales aleatorias generadas mediante la 
% funci�n del Ejercicio N� 1. Para ello genere 1000 se�ales a partir de 
% vectores de coeficientes aleatorios con l0(a) en el rango [1, 10] y 
% ? ? R30�50 tambi�n aleatorio. Luego aplique ambos m�todos a cada se�al 
% generada y grafique el error cuadr�tico medio de la reconstrucci�n de 
% x a partir de ?�, con cada uno de los m�todos en funci�n de l0(a).

clear all
close all

realizations = 1000;
N = 30;
M = 50;

l0 = 1:1:10;
K = length(l0);
a = cell(1,K);
x = cell(1,K);

% Asigno lugar para las aproximaciones
a_hat_mp = a;
a_hat_bp = a;
x_hat_mp = x;
x_hat_bp = x;
rms_a_mp = a;
rms_a_bp = a;
rms_x_mp = x;
rms_x_bp = x;

% Phi aleatorio, mismo Phi para todos.
phi = normc(randn(N,M));

for l=1:K
    % Genero a
    a{l} = zeros(M,realizations);
    for r=1:realizations
        a{l}(:,r) = get_a(M,l0(l),'col');
    end
    % Genero el vector x
    x{l} = phi*a{l};
end

%% Aproximacion
for l=1:K
    % Aproximo a
    for r=1:realizations
        a_hat_mp{l}(:,r) = my_mp(x{l}(:,r),phi,l0(l));
        a_hat_bp{l}(:,r) = my_lbp(x{l}(:,r),phi);
    end
    % Genero el vector x aproximado
    x_hat_mp{l} = phi*a_hat_mp{l};
    x_hat_bp{l} = phi*a_hat_bp{l};
end

%% Mido los errores
for l=1:K
    rms_a_mp{l} = rms(a{l}-a_hat_mp{l});
    rms_a_bp{l} = rms(a{l}-a_hat_bp{l});
    rms_x_mp{l} = rms(x{l}-x_hat_mp{l});
    rms_x_bp{l} = rms(x{l}-x_hat_bp{l});
    figure(1);
    subplot(K/2,2,l);
    plot(rms_a_mp{l}); title(sprintf('RMS a, l0(a)=%d',l));
    figure(2)
    subplot(K/2,2,l);
    plot(rms_x_mp{l}); title(sprintf('RMS x, l0(a)=%d',l));
    
    figure(3)
    subplot(K/2,2,l);
    plot(rms_a_bp{l}); title(sprintf('RMS a, l0(a)=%d',l));
    figure(4)
    subplot(K/2,2,l);
    plot(rms_x_bp{l}); title(sprintf('RMS x, l0(a)=%d',l));

end

figure(1), suptitle('RMS a utilizando MP');
figure(2), suptitle('RMS x utilizando MP');
figure(3), suptitle('RMS a utilizando LBP');
figure(4), suptitle('RMS x utilizando LBP');

%% RMS de los RMS
for l=1:K
    rms_a_bp1(l) = rms(rms_a_bp{l});
    rms_a_mp1(l) = rms(rms_a_mp{l});
    rms_x_bp1(l) = rms(rms_x_bp{l});
    rms_x_mp1(l) = rms(rms_x_mp{l});
end
figure()
plot(rms_a_bp1,'r');
hold on;
plot(rms_a_mp1,'g');
hold off;
legend('BP','MP');

figure()
semilogy(rms_x_bp1,'r');
hold on;
semilogy(rms_x_mp1,'g');
hold off;
legend('BP','MP');