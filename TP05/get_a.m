function [ a ] = get_a( N, l0, f )

a = zeros(1,N);
a(1:l0) = 1;

% Genero valores en el intervalo [1,2]
r0 = 1 + rand(1,N);

% Genero -1 o 1 aleatorio para lograr [-2,-1]U[2,1]
r1 = 2*randi([0 1],1,N) - 1;

% Ahora r esta en [-2,-1]U[2,1]
r = r0.*r1;

a = a(randperm(N)).*r;

if strcmp(f,'col')
    a = a(:);
end

end

