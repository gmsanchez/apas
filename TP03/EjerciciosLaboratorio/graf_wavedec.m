function graf_wavedec( x, coef, largo )

NMAX = length(largo)-2;
figure()
plot(x);
title('Señal');
for n=1:1:NMAX+1
    if n==1
        figure()
        plot(coef(1:largo(1)));
        title(sprintf('Aproximación nivel %d',NMAX-(n-1)));
    else
        figure()
        p1 = sum(largo(1:n-1))+1;
        p2 = sum(largo(1:n));
        plot(coef(p1:p2));
        title(sprintf('Detalle nivel %d',NMAX-(n-2)));
    end

end

