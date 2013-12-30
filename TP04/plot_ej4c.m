for k=1:length(ca)
    yr = my_rstep(ca{k},cd{k},Lo_R{k},Hi_R{k},1);
    figure()
    plot(t,y,'ro');
    hold on;
    title(sprintf('Reconstruccion con %s',Title{k}));
    plot(t,yr,'b+');
    hold off;
    fprintf('Error reconstruccion con %s: %.16f\n',...
        Title{k},norm(yr(:)-y(:)))
end