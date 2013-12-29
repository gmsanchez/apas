%% Se~nal senoidal
%
fm = 1024;
t = 0:1/fm:1-1/fm;
N = length(t);
f0 = 0;
f1 = 500;
f = linspace(f0,f1,N);
% y = chirp(t,0,1,500);
y = sin(pi.*f.*t).*(1-t);
