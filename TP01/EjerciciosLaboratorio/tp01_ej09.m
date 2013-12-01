clear all;
close all;

fm = 129;
tm = 1/fm;
f = 4000;

t = 0:tm:2-tm;
s = sin(2*pi*f*t);
stem(t,s);
