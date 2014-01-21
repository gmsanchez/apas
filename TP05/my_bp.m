function [ a_hat ] = my_bp( x, phi )
%MY_BP Summary of this function goes here
%   Detailed explanation goes here
    a0 = phi'*x;
    [a_hat,fval,exitflag] = fmincon(@my_norm1,a0,[],[],phi,x);
end
