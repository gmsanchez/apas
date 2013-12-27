function h = ma_filter(nrm)

h = 0.5*ones(2,1);

if nrm
    h = h./norm(h);
end

end
