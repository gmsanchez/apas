function [ a_hat, r ] = my_mp( x, phi, tau )
%MY_MP Algoritmo Matching Pursuit
%   Detailed explanation goes here

if nargin<3
    tau = 1e-6;
end

r = x;
n = 1;
a_hat = zeros(size(phi,2),1);

while norm(r)>tau
    scalarproducts = phi'*r;
    [~, m_idx] = max(abs(scalarproducts));
    a_hat(m_idx) = a_hat(m_idx) + scalarproducts(m_idx);
    r = r - scalarproducts(m_idx)*phi(:,m_idx);
    n = n+1;
end

end

