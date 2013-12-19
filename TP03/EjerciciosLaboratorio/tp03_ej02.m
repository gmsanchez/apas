%% Guia 3 - Ejercicio 2
%

%% Enunciado
% Utilice la función wavefun para explorar las formas de las funciones 
% ondita y de escala para la familia Daubechies 6. Utilize 2, 3 y 4 
% iteraciones. Para cada funció (de escala y ondita) y para cada numero 
% de iteraciones, grafique tambien la magnitud de la transformada de 
% Fourier de las mismas.

clear all;
close all;


% Nombre de la ondita y cantidad de iteraciones
wav = 'db6';
iter = [2 3 4];
N = length(iter);

for i = 1:N
    [phi,psi,xval] = wavefun(wav,iter(i));
    xvalf = linspace(-pi,pi,length(xval));
    figure(i)
    
    % Ondita
    subplot(2,2,1), plot(xval,psi);
    title(sprintf('Ondita %s - Iter %d',wav,iter(i)));
    axis('tight')
    subplot(2,2,3), plot(xvalf,fftshift(abs(fft(psi))));
    title(sprintf('Espectro Mag. Ondita %s - Iter %d',...
        wav,iter(i)));
    axis('tight')
    
    % Scaling
    subplot(2,2,2), plot(xval,phi);
    title(sprintf('Scaling %s - Iter %d',wav,iter(i)));
    axis('tight')
    subplot(2,2,4), plot(xvalf,fftshift(abs(fft(phi))));
    title(sprintf('Espectro Mag. Scaling %s - Iter %d',...
        wav,iter(i)));
    axis('tight')
end

