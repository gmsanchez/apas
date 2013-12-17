clear all;
close all;

fm = 1000;
t = 0:1/fm:1-1/fm;
%y = sin(2*pi*4*fm*t);
y=chirp(t,100,1,200);
%figure()
%spectrogram(y,128,120,128,1E3);
figure()
my_spectrogram(y,1,65,1,1000);