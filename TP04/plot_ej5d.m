% Descomposicion
figure()

for k=1:N
    subplot(N+1,1,k),plot(d{k});
    title(sprintf('Coef. detalle d[%d]',k));
end
subplot(N+1,1,N+1),plot(a{N})
title(sprintf('Coef. aprox. a[%d]',N));

fprintf('Error en a[%d] con dwt: %.6f\n',N,norm(a5-a{5}'))
fprintf('Error en d[5] con dwt: %.6f\n',norm(d5-d{5}'))
fprintf('Error en d[4] con dwt: %.6f\n',norm(d4-d{4}'))
fprintf('Error en d[3] con dwt: %.6f\n',norm(d3-d{3}'))
fprintf('Error en d[2] con dwt: %.6f\n',norm(d2-d{2}'))
fprintf('Error en d[1] con dwt: %.6f\n',norm(d1-d{1}'))

% Reconstruccion
figure()
subplot(2,1,1),
plot(y,'ro'); hold on;
plot(yr,'b+'); hold off
legend('Original','Reconstruida');
subplot(2,1,2), plot(y(:)-yr(:));
title('Error de reconstruccion');

fprintf('Error se~nal original y reconstruida: %.6f\n',...
    norm(y(:)-yr(:)))