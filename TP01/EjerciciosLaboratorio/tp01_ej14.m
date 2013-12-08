clear all;
close all;


T = [249e-3,498e-3,993e-3,498e-3,993e-3,124.5e-3];
fm = [512,128,128,256,128,1024];
pm = 1./fm;

f1 = [112,56,100,56,100,3872];
f2 = [200,200,50,868,78,5520];

L = length(T);
for k=1:1:L
t = 0:pm(k):T(k)-pm(k);
s = sin(2*pi*f1(k)*t)+4*sin(2*pi*f2(k)*t);
subplot(L,1,k)
stem(abs(fft(s)))
title(sprintf('sin(2*pi*%d*t)+2*sin(2*pi*%d*t)',f1(k),f2(k)));
end
