clear all;
close all;

t=0:0.001:2;                    % 2 secs @ 1kHz sample rate
y=chirp(t,100,1,200,'q');       % Start @ 100Hz, cross 200Hz at t=1sec 
figure(1)
spectrogram(y,128,120,128,1E3); % Display the spectrogram
figure(2)
my_spectrogram(y,0,128,4);