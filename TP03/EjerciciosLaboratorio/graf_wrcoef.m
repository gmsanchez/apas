function graf_wrcoef( x, coef, largo, wav , aod)

NMAX = length(largo)-2;
figure()
plot(x);
title('Señal');
for n=1:1:NMAX
    if n==1
        figure()
        plot(wrcoef('a',coef,largo,wav,NMAX-(n-1)));
        title(sprintf('Reconst. con aproximación nivel %d', ...
            NMAX-(n-1)));
        figure()
        plot(wrcoef('d',coef,largo,wav,NMAX-(n-1)));
        title(sprintf('Reconst. con detalle nivel %d', ... 
            NMAX-(n-1)));
    else
        figure()
        if strcmp(aod,'a')
            tit = 'aproximacion';
        else
            tit = 'detalle';
        end
        
        plot(wrcoef(aod,coef,largo,wav,NMAX-(n-1)));
        title(sprintf('Reconst. con %s nivel %d', ... 
           tit, NMAX-(n-1)));
    end

end

