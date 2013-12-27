function [ g ] = md_filter
%MD_FILTER Summary of this function goes here
%   Detailed explanation goes here
g = 0.5*ones(2,1);
g(2) = -1*g(2);

end

