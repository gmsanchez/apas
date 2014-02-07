%% Guia 5, Ejercicio 4
% Pruebe el desempeño de los algoritmos de MP y BP implementados en los 
% ejercicios anteriores utilizando señales aleatorias generadas mediante la 
% función del Ejercicio Nº 1. Para ello genere 1000 señales a partir de 
% vectores de coeficientes aleatorios con l0(a) en el rango [1, 10] y 
% $\Phi $ perteneciente a R^(30x50) también aleatorio. Luego aplique ambos 
% métodos a cada señal generada y grafique el error cuadrático medio de la 
% reconstrucción de  x a partir de Phi*â, con cada uno de los 
% métodos en función de l0(a).

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
rms_a_mp = zeros(1,K);
rms_a_bp = zeros(1,K);
rms_x_mp = zeros(1,K);
rms_x_bp = zeros(1,K);

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
    rms_a_mp(l) = mean(rms(a{l}-a_hat_mp{l}));
    rms_a_bp(l) = mean(rms(a{l}-a_hat_bp{l}));
    rms_x_mp(l) = mean(rms(x{l}-x_hat_mp{l}));
    rms_x_bp(l) = mean(rms(x{l}-x_hat_bp{l}));
end

figure()
plot(rms_a_bp,'r-sq');
hold on;
plot(rms_a_mp,'g-*');
hold off;
legend('BP','MP');
xlabel('l0(a)');
ylabel('RMS Promedio');
title('RMS Promedio de $\hat{a}$','Interpreter','latex');

figure()
plot(rms_x_bp,'r-sq');
hold on;
plot(rms_x_mp,'g-*');
hold off;
legend('BP','MP');
xlabel('l0(a)');
ylabel('RMS Promedio');
title('RMS Promedio de $\hat{x}$','Interpreter','latex');

