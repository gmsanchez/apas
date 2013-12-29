%% Guia 4, Ejercicio 5
clear all;
close all;

get_senoidal;
[h,g] = db4(1);

[a,d] = todd(y,h,g,5);

%%
N = 5;
subplot(N,1,1),plot(a{N})
title('a[5]');

for k=2:N
    subplot(N,1,k),plot(d{k});
    title(sprintf('d[%d]',k));
end

%%
dwt(y,h,g)
[a1,d1] = dwt(y,h,g,'mode','per');
[a2,d2] = dwt(a1,h,g,'mode','per');
[a3,d3] = dwt(a2,h,g,'mode','per');
[a4,d4] = dwt(a3,h,g,'mode','per');
[a5,d5] = dwt(a4,h,g,'mode','per');
norm(a5-a{5}')
norm(d5-d{5}')
norm(d4-d{4}')
norm(d3-d{3}')
norm(d2-d{2}')
norm(d1-d{1}')