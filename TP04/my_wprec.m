function [ y ] = my_wprec( c, Lo_R, Hi_R, t )
%MY_WPREC Summary of this function goes here
%   Detailed explanation goes here


%depth = treedpth(t);
alltreenodes = allnodes(t,'deppos');
lvl = max(alltreenodes(:,1));

N = length(c);
y = c;

for k=lvl:-1:1
    lvl_idx = find(alltreenodes(:,1)==k);
    lvl_nodes = alltreenodes(lvl_idx,2);
    lvl_iter = length(lvl_nodes);
    lvl_length = N/(2^k);
    for n=1:2:lvl_iter
        l_node_idx = 2^k-1+lvl_nodes(n);
        r_node_idx = 2^k-1+lvl_nodes(n+1);
        pl1 = lvl_length*lvl_nodes(n)+1;
        pl2 = lvl_length*(lvl_nodes(n)+1);
        pr1 = lvl_length*lvl_nodes(n+1)+1;
        pr2 = lvl_length*(lvl_nodes(n+1)+1);       
        fprintf('Reconstruyo elemento %d/[%d %d] y elemento %d/[%d %d] ',...
            l_node_idx,k,lvl_nodes(n),r_node_idx,k,lvl_nodes(n+1));
        fprintf('para generar y(%d %d)\n',pl1,pr2);
        y(pl1:pr2) = my_rstep(y(pl1:pl2),y(pr1:pr2),Lo_R,Hi_R);
    end
end

end

