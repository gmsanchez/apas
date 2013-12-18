%% Guia 3 - Ejercicio 4
%
clear all;
close all;

numericaltour;

% Larga vida al pajarito!
n = 1024*16;
options.n = n;
[x,fs] = load_sound('bird', n);