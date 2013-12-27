function [ x ] = high( L )
    x = ones(L,1);
    x(1:2:L) = -x(1:2:L);
end

