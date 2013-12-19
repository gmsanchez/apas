function [ output_args ] = graf_wavedec( x, coef, largo, wav )

NMAX = length(largo)-2
figure()
plot(x);
title('Señal');
for n=1:1:NMAX
    figure()
    if n==1
        plot(coef(1:largo(1)));
        title(sprintf('Aproximación nivel %d',NMAX-(n-1)));
    else
%         n
%         pause
%         plot(dectoef(coeficientes,largo,n))
%         title(sprintf('Detalle nivel %d',n));
    end

end

