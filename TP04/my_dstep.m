function [ a, d ] = my_dstep( x, h, g, do_plot )

if nargin<4
    do_plot = 0;
end

lf = length(h);
delay = floor(lf*0.5);

af = my_cconv(x,h,-delay);
df = my_cconv(x,g,-delay);
a = my_downsample(af);
d = my_downsample(df);

% Para el 3.c
if do_plot
    figure()
    subplot(2,2,1); stem(abs(fft(af)));
    title('Espectro de magnitud de a_{j+1} luego del filtrado');
    xlabel('Muestras'); axis tight;
    subplot(2,2,2); stem(abs(fft(a)));
    title('Espectro de magnitud de a_{j+1} luego del submuestreo');
    xlabel('Muestras'); axis tight
    subplot(2,2,3); stem(abs(fft(df)));
    title('Espectro de magnitud de d_{j+1} luego del filtrado');
    xlabel('Muestras'); axis tight
    subplot(2,2,4); stem(abs(fft(d)));
    title('Espectro de magnitud de d_{j+1} luego del submuestreo');
    xlabel('Muestras'); axis tight
end

end

