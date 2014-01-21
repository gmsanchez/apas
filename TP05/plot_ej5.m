%% 
for j=1:length(phi)
for k=1:nl0
    figure();
    for rep=1:3
        suptitle(sprintf('Inciso %d, l0(a)=%d',Inciso,l0(k)));
        la = size(phi{j},2);
        a = get_a(la,l0(k),'col');
        x = get_phi_a(phi{j},a);
        if Inciso==1
            fprintf('Varianza de x: %.6f con l0(a)=%d\n',var(x),l0(k));
        end
        subplot(nl0,1,rep),stem(x); axis tight
        %title(sprintf('l0(a) = %d',l0(k)));
        grid on    
    end
end
end