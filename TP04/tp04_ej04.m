%% Guia 4 - Ejercicio 1
%
tp04_ej03;

%%

for k=1:length(ca)
yr = my_rstep(ca{k},cd{k},Lo_D{k},Hi_D{k});

%%
figure()
plot(t,y,'ro');
hold on;
title(sprintf('Reconstruccion con %s',Title{k}));
plot(t,yr,'b+');
hold off;

end