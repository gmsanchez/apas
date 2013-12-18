%% Guia 3 - Ejercicio 3
%
clear all;
close all;

numericaltour;

% Larga vida al pajarito!
n = 1024*16;
options.n = n;
[x,fs] = load_sound('bird', n);

cw1 = cwt(x,1:32,'sym2','plot'); 
title('Continuous Transform, absolute coefficients.') 
ylabel('Scale')
[cw1,sc] = cwt(x,1:32,'db6','scal');
title('Scalogram') 
ylabel('Scale')
