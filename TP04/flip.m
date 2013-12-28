function [ y ] = flip( x )

if isrow(x)
    y = fliplr(x);
else
    y = flipud(x);
end

end

