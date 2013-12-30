%% Guia 4 - Ejercicio 2
%

%% Código fuente y resultados

clear all
close all

%% Inciso a) y b)
% Función que genera la convolución circular discreta entre dos señales
% x[n] y h[n], utilizando ciclos for. Se considera a x[n] periódica y a
% h[n] nula fuera de su rango de definición. Asimismo, esta función permite
% el agregado de un retardo por parámetro.
%
% En las figuras podemos observar las señales x[n] y h[n]. Al convolucionar
% dichas señales entre ellas aplicando diferentes retardos, podemos ver que
% el resultado de la sumatoria de convolución se ve desplazada tantas
% posiciones como indica el retardo, en caso de ser negativo la señal se
% "adelanta" y en caso de ser positivo, se "atrasa".

x = zeros(30,1);
x(1:5) = 1;
h = [1; 0; 0; 0];

subplot(2,1,1); stem(x);
title('x[n]'); xlabel('Muestras');
subplot(2,1,2); stem(h);
title('h[n]'); xlabel('Muestras');
set(gca,'xtick',0:1:5)
axis([0.5 4.5 0 1])
figure()
for k=-2:1:2
    xh = my_cconv(x,h,2*k);
    subplot(5,1,k+3); stem(xh);
    title(sprintf('x[n]*h[n] con retardo de %d',2*k));
    xlabel('Muestras');
end

%%
% Código fuente de la función que realiza la convolución circular
dbtype my_cconv.m


%% Inciso c)
% Genere una función para implementar los filtros de promedio móvil y 
% diferencia móvil (que dan lugar a la ondita de Haar si se los normaliza)
% La función debe permitir elegir si se normalizarán o no los coeficientes. 
% Observe que el filtro de promedio móvil actúa como pasa-bajos. Para 
% comprobarlo aplique h a las señales generadas por low y high, 
% respectivamente (para L = 25). Repita el mismo procedimiento con g para 
% ver que el filtro de diferencia móvil actúa como pasa-altos.

L = 2^5;

xl = low(L);
xh = high(L);
h = ma_filter(0);
g = md_filter(0);

figure()
subplot(3,1,1),stem(xl);
title('Señal low'); xlabel('Muestras');
subplot(3,1,2),stem(my_cconv(xl,h));
title('low*h'); xlabel('Muestras');
subplot(3,1,3),stem(my_cconv(xl,g));
title('low*g'); xlabel('Muestras');

figure()
subplot(3,1,1),stem(xh);
title('Señal high'); xlabel('Muestras');
subplot(3,1,2),stem(my_cconv(xh,h));
title('high*h'); xlabel('Muestras');
subplot(3,1,3),stem(my_cconv(xh,g));
title('high*g'); xlabel('Muestras');

%%
% En las figuras podemos observar que el filtro de promedio
% móvil actúa como un pasa-bajos ya que la señal low no se ve afectada, 
% mientras que la señal high se ve filtrada completamente.
%
% En el otro caso, vemos que el filtro de diferencia móvil actúa como 
% pasa-altos, ya que la señal low se ve filtrada completamente mientras que
% la señal high no se ve afectada.

%%
% Código fuente de la función ma_filter
dbtype ma_filter.m

%%
% Código fuente de la función md_filter
dbtype md_filter.m

%%
% Se realizo una funcion que devuelve ambos filtros, la que se denominó haar
dbtype haar.m

%% Inciso d)
% Escriba una función para generar los filtros que tras su normalización 
% conducen a la famosa ondita Daubechies 4.

dbtype db4.m

%% Inciso e)
% Verifique numericamente que los filtros Haar y Daubechies 4 normalizados
% cumplen con la ecuación
%
% $$|\hat{h}(\omega)|^2 + |\hat{g}(\omega)|^2 = 2 $$

clear h g;
%% Haar
h{1} = ma_filter(1);
g{1} = md_filter(1);
ftitle{1} = 'Haar';

%% DB4
[h{2}, g{2}] = db4(1);
ftitle{2} = 'DB4';

%% Verificación de la ecuación

w = 0:2*pi/200:2*pi;
for n=1:length(h)
	%Respuesta en frecuencia
    Hw = 0.*w;
    for k=1:length(h{n})
        Hw = Hw + h{n}(k)*exp(-1i*w*(k-1));
    end

    Gw = 0.*w;
    for k=1:length(g{n})
        Gw = Gw + g{n}(k)*exp(-1i*w*(k-1));
    end
    
    % Verifico ecuacion 7e
    eq7e = abs(Hw).^2+abs(Gw).^2;
    figure()
    xaxis = (0:pi:2*pi);
    xaxisl = {'0' , 'pi' '2*pi'};
    plot(w,abs(Hw),'r',w,abs(Gw),'b-.',w,eq7e,'k--');
    title(sprintf('Verificacion con %s normalizado',ftitle{n}))
    legend('H(\omega)','G(\omega)');
    set(gca,'xtick',xaxis)
    set(gca,'xticklabel',xaxisl); %,'fontname', 'symbol');
    axis([0 2*pi 0 2.5])
end