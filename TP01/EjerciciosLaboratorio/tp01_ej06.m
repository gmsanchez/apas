clear all;
close all;

d = zeros(1,100); d(1) = 1;
u = ones(1,100);


h = sist_ej06(d);
y1 = sist_ej06(u);
y2 = conv(u,h);

subplot(211); stem(y1);
subplot(212); stem(y2);
