%% Guia 3 - Ejercicio 3 - Carga de datos
%
clear all;
close all;

% Internet traffic data (in bits) from a private ISP with centres in 11 
% European cities. The data corresponds to a transatlantic link and was 
% collected from 06:57 hours on 7 June to 11:17 hours on 31 July 2005. 
% Data collected at five minute intervals.
% http://datamarket.com/data/set/232n/internet-traffic-data-in-bits-from-a-private-isp-with-centres-in-11-european-cities-the-data-corresponds-to-a-transatlantic-link-and-was-collected-from-0657-hours-on-7-june-to-1117-hours-on-31-july-2005-data-collected-at-five-minute-intervals#!ds=232n&display=line

fileID = fopen('internet-traffic-data-in-bits-fr-daily.csv');
g = textscan(fileID,'%s','delimiter','\n','headerlines',1);
fclose(fileID);
N = 14772; % Hay algo escrito a lo ultimo
t = 1:1:N;
tticks = zeros(1,N);
b = zeros(1,N);
for k=1:N
    fhb = strsplit(g{1}{k},';');
    tticks(k) = datenum(fhb(1));
    b(k) = str2double(fhb(2));
end
save('internet-traffic-data-in-bits-fr1',internet_traffic_data_in_bits_ft_datenum,internet_traffic_data_in_bits_ft_quantity);
