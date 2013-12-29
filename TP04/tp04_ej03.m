%% Guia 4 - Ejercicio 3
%
clear all
close all

%% Se~nal senoidal
%
fm = 1024;
t = 0:1/fm:1-1/fm;
N = length(t);
f0 = 0;
f1 = 500;
f = linspace(f0,f1,N);
y = sin(pi.*f.*t).*(1-t);

%% Haar
h = ma_filter(1);
g = md_filter(1);

Lo_D{1} = h;
Hi_D{1} = g;
Title{1} = 'Haar';

%% DB4
[h, g] = db4(1);

Lo_D{2} = h;
Hi_D{2} = g;
Title{2} = 'DB4';

%%
%
for k = 1:1:length(Lo_D)
    [ ca{k}, cd{k} ] = my_dstep(y,Lo_D{k},Hi_D{k});
    [ ca1, cd1 ] = my_dwt(y,Lo_D{k},Hi_D{k},'mode','per');
    
    figure()
    subplot(2,1,1);
    plot(ca{k},'ro');
    hold on;
    plot(ca1,'b+');
    hold off;
    title(sprintf('Coeficientes de aproximacion %s',Title{k}));
    sprintf('Error coeficientes aproximacion con dwt %.16f\n',...
        norm(ca{k}(:)-ca1(:)))
    legend('dstep','dwt');

    subplot(2,1,2);
    plot(cd{k},'ro');
    hold on;
    plot(cd1,'b+');
    hold off;
    title(sprintf('Coeficientes de detalle %s',Title{k}));
    sprintf('Error coeficientes detalle con dwt %.16f\n',...
        norm(cd{k}(:)-cd1(:)))
    legend('dstep','dwt');
end

