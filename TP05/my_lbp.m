function [ a_hat ] = my_lbp( x,phi )
%MY_LBP Summary of this function goes here
%   Detailed explanation goes here
    Al = [phi -phi];
    a0 = Al'*x;
    lb = 0.*a0;
    ub = [];
    options = optimset('Display','none');
    
    c = ones(size(a0));
    al_hat = linprog(c,[],[],Al,x,lb,ub,[],options);
    
    luv = size(phi,2);
    u = al_hat(1:luv);
    v = al_hat(luv+1:end);
    a_hat = u-v;
    
end

