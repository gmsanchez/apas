%% Guia 1 - Ejercicio de laboratorio 7
%
%% Enunciado y resultados
% Defina tres señales cualquiera y muestre numéricamente las propiedades
% conmutativa, asociativa y distributiva de la convolución.

clear all;
close all;

fm = 50;
t = 0:1/fm:1-1/fm;

x = sin(2*pi*10*t);
y = exp(-t);
w = cos(2*pi*t);

figure(1);
subplot(3,1,1),stem(t,x); title('sin(2*pi*10*t)'); xlabel('t');
subplot(3,1,2),stem(t,y); title('exp(-t)'); xlabel('t');
subplot(3,1,3),stem(t,w); title('cos(2*pi*t)'); xlabel('t');

%hFig = figure(2);
%set(hFig, 'Position', [0 0 740 580])
%% Inciso 1: Conmutativa
figure(2)
plot(conv(x,y),'r+'); hold on;
plot(conv(y,x),'bo'); hold off;
legend('conv(x,y)','conv(y,x)');
grid on;

%% Inciso 2: Asociativa
figure(3)
plot(conv(x,conv(y,w)),'r+'); hold on;
plot(conv(conv(x,y),w),'bo'); hold off;
legend('conv(x,conv(y,w))','conv(conv(x,y),w)');
grid on;


%% Inciso 3: Distributiva
figure(4)
plot(conv(x,(y+w)),'r+'); hold on;
plot(conv(x,y)+conv(x,w),'bo'); hold off;
legend('conv(x,(y+w))','conv(x,y)+conv(x,w)');
grid on;

%% Conclusiones
% Como puede verse a partir de las figuras, la convolución cumple con las
% propiedades conmutativa, asociativa y distributiva.