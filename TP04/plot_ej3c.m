for k = 1:1:length(Lo_D)
    fprintf('%% Utilizando los filtros %s normalizados\n',Title{k})
    [ ca{k}, cd{k} ] = my_dstep(y,Lo_D{k},Hi_D{k},1);
    % [ ca1, cd1 ] = dwt(y,Lo_D{k},Hi_D{k},'mode','per');
    [ ca1, cd1 ] = dwt(y,wav{k},'mode','per');
    
    figure()
    subplot(2,1,1);
    plot(ca{k},'ro');
    hold on;
    plot(ca1,'b+');
    hold off;
    title(sprintf('Coeficientes de aproximacion %s',Title{k}));
    fprintf('Error coeficientes aproximacion con dwt %.16f\n',...
        norm(ca{k}(:)-ca1(:)))
    legend('dstep','dwt');

    subplot(2,1,2);
    plot(cd{k},'ro');
    hold on;
    plot(cd1,'b+');
    hold off;
    title(sprintf('Coeficientes de detalle %s',Title{k}));
    fprintf('Error coeficientes detalle con dwt %.16f\n',...
        norm(cd{k}(:)-cd1(:)))
    legend('dstep','dwt');
end