%% Guia 3 - Ejercicio 3
%

%% Enunciado
% Utilice una señal real (por ejemplo, una señ̃al de audio) y analicela 
% mediante la transformada ondita semicontinua (función cwt de matlab) 
% utilizando diferentes onditas madre (explore las opciones con el comando
% waveinfo).

%% Código fuente y resultados
% Para este ejercicio utilizamos una señal de:
%
% Internet traffic data (in bits) from a private ISP with centres in 11 
% European cities. The data corresponds to a transatlantic link and was 
% collected from 06:57 hours on 7 June to 11:17 hours on 31 July 2005. 
% Data collected at five minute intervals.
% http://datamarket.com/data/set/232n/internet-traffic-data-in-bits-from-a-private-isp-with-centres-in-11-european-cities-the-data-corresponds-to-a-transatlantic-link-and-was-collected-from-0657-hours-on-7-june-to-1117-hours-on-31-july-2005-data-collected-at-five-minute-intervals#!ds=232n&display=line
%
% Utilizaremos varias onditas en un intervalo de la señal para intentar
% capturar los picos de tráfico.

clear all;
close all;

numericaltour;

load internet-traffic-data-in-bits-fr1

x = internet_traffic_data_in_bits_ft_quantity(1000:14000);

figure()
plot(x)
title('Señal de trafico en bytes medido cada 5 minutos');
xlabel('Muestras');
ylabel('Bytes');

wav = {'mexh','db6','meyr', 'sym2','gaus8'};

for k=1:length(wav)
    figure()
    cw1 = cwt(x,1:32,wav{k},'plot'); 
    title(sprintf('Transformada Wavelet Continua. Valor absoluto de los coeficientes utlizando %s.',wav{k}))
    ylabel('Escala')
    xlabel('Tiempo')
end

%% Conclusiones
% Se puede ver en las gráficas que en todos los casos se logra detectar los
% momentos del día en que hay picos de tráfico. Asimismo, se nota que la
% ondita Mexican Hat exhibe peor resolución temporal que las demás.
%
% La transformada ondita parece lograr captar con facilidad los cambios
% abruptos en la señal.
