function thetas = ESPRIT(R, dist, src_num, lambda)

N = length(R);
[V, D] = eig(R);

[~,indices] = sort(diag(D), 'descend');

V_sorted = V(:,indices);
V1 = V_sorted(:, 1:src_num);

W1 = V1(1:N-1, :);
W2 = V1(2:end, :);

psi = (W1'*W1) \ W1' * W2;
[~, D_psi] = eig(psi);


angles = angle(diag(D_psi));
sines = angles / (-2*pi*(dist/lambda));
thetas = asin(sines) * (180/pi);

end

