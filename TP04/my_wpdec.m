function [ c,t ] = my_wpdec( y, Lo_D, Hi_D, depth, terminalnodes )

% Si no especifico nodos terminales
% Descomposicion Paquete de Onditas Completa
if nargin<5
    terminalnodes = 2^depth-1:1:2^(depth+1)-2;
end
%CREATEWPTREE Summary of this function goes here
%   Detailed explanation goes here

%totalnodes = 2^(depth+1)-1;
%allnodes = 0:1:totalnodes-1;


% Creamos el arbol binario completo y perfecto
t = ntree(2,depth);
% Quitamos los hijos de los nodos terminales
for k=1:length(terminalnodes)
    t = nodejoin(t,terminalnodes(k));
end
% Obtenemos las hojas de este nuevo arbol
leavenodes = leaves(t);
% Comparamos las hojas con el conjunto que introdujo el usuario
if ~isequal(sort(terminalnodes(:)),sort(leavenodes(:)))
    error('Invalid set of terminal nodes');
end

alltreenodes = allnodes(t,'deppos');
lvl = max(alltreenodes(:,1));

N = length(y);
c = y;

for k=0:lvl-1
    lvl_idx = find(alltreenodes(:,1)==k);
    lvl_nodes = alltreenodes(lvl_idx,2);
    lvl_iter = length(lvl_nodes);
    lvl_length = N/(2^k);
    for n=1:lvl_iter
        node_depo = [k, lvl_nodes(n)]
        node_idx = depo2ind(depth,node_depo)
        if length(nodedesc(t,node_idx))>1
            p1 = lvl_length*lvl_nodes(n)+1;
            p2 = lvl_length*(lvl_nodes(n)+1);
            %p1 = lvl_length*(n-1)+1
            %p2 = lvl_length*n
            [a,d] = my_dstep(c(p1:p2),Lo_D,Hi_D);
            c(p1:p2) = [a d];
        end
    end
end
        
end

