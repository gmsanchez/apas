%% Guia 1 - Ejercicio de laboratorio 13
%
% Aproxime una onda cuadrada mediante series seno de diferente cantidad de
% términos y discuta la relación entre los resultados obtenidos y el
% fenómeno de Gibbs.

clear all;
close all;

f0 = 1;
fm = 100; % 1000 Hz
t = -1:1/fm:1-1/fm;
y = square(2*pi*f0*t); % Genero una cuadrada de 20 Hz
s = zeros(size(y));

L = length(t);
for N=1:2:11
%N = 10; % Cantidad de bases a utilizar
for k=1:N
    sk = sin(2*pi*k*t);
    ak = dot(y,sk)/dot(sk,sk)
    s = s + ak*sk;
    %subplot(N+1,1,k+1),plot(t,sk); title(sprintf('Base seno para k=%d',k));
end

figure(N)
plot(t,y,'r'); hold on;
plot(t,s,'b'); hold off;
xlabel('t[s]');
end