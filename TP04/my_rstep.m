function [ x ] = my_rstep( a, d, h, g, do_plot )

if nargin<5
    do_plot = 0;
end

aup = my_upsample(a);
dup = my_upsample(d);

h = flip(h);
g = flip(g);

lf = length(h);
delay = floor(lf*0.5);

% Realizo convolución con delay
xa = my_cconv(aup,h,-delay);
xd = my_cconv(dup,g,-delay);

x = xa+xd;

% Para el 4.c
if do_plot
    figure()
    subplot(2,2,1); stem(abs(fft(aup)));
    title('Espectro de magnitud de a_{j} luego del sobremuestreo');
    xlabel('Muestras'); axis tight;
    subplot(2,2,2); stem(abs(fft(xa)));
    title('Espectro de magnitud de a_{j} luego del filtrado');
    xlabel('Muestras'); axis tight
    subplot(2,2,3); stem(abs(fft(dup)));
    title('Espectro de magnitud de d_{j} luego del sobremuestreo');
    xlabel('Muestras'); axis tight
    subplot(2,2,4); stem(abs(fft(xd)));
    title('Espectro de magnitud de d_{j} luego del filtrado');
    xlabel('Muestras'); axis tight
end

end

