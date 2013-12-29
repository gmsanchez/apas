function [ a, d ] = my_dstep( x, h, g )

x = x(:);

lf = length(h);
delay = floor(lf*0.5);

% Realizo convolución con delay
a = my_downsample(my_cconv(x,h,-delay));
d = my_downsample(my_cconv(x,g,-delay));

% Para el 3.c
do_plot = 1;
if do_plot
    a_plot = my_cconv(x,h,-delay);
    d_plot = my_cconv(x,g,-delay);
    
    figure()
    subplot(2,2,1); stem(abs(fft(a_plot)));
    title('Espectro de magnitud de a_{j+1} luego del filtrado');
    xlabel('Muestras'); axis tight;
    subplot(2,2,2); stem(abs(fft(my_downsample(a_plot))));
    title('Espectro de magnitud de a_{j+1} luego del submuestreo');
    xlabel('Muestras'); axis tight
    subplot(2,2,3); stem(abs(fft(d_plot)));
    title('Espectro de magnitud de d_{j+1} luego del filtrado');
    xlabel('Muestras'); axis tight
    subplot(2,2,4); stem(abs(fft(my_downsample(d_plot))));
    title('Espectro de magnitud de d_{j+1} luego del submuestreo');
    xlabel('Muestras'); axis tight
end

end

