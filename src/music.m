function [power, thetas]= music(R, dist, src_num, lambda)

theta_scan_deg = -90:0.05:90; 
theta_scan = theta_scan_deg*pi/180;
num_angles = length(theta_scan);

[V, D] = eig(R);

[~,indices] = sort(diag(D), 'descend');

V_sorted = V(:,indices);

En = V_sorted(:, src_num+1:end);

N = length(R);

power = zeros(num_angles, 1);
for k = 1 : num_angles
    a = zeros(N, 1);
    for n = 1 : N
        a(n, 1) = exp(1i*(-2*pi)*(dist/lambda)*(n-1)*sin(theta_scan(k)));
    end
    power(k, 1) = 1 / norm(En'*a);
end

[~, index] = findpeaks(power,"SortStr",'descend');
temp = theta_scan_deg(index)';
thetas = temp(1:src_num);

end

