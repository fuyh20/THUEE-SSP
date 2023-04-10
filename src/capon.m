function [power, thetas] = capon(R, d, src_num, lambda)

theta_scan_deg = -90:0.05:90;
a = exp(-1i*2*pi*d.'*sin(theta_scan_deg*pi/180)/lambda);
power = zeros(length(theta_scan_deg), 1);
for i=1:length(theta_scan_deg)
    power(i) = 1 ./ abs(a(:,i)' *pinv(R)* a(:,i));
end
power = abs(power);
[~, index] = findpeaks(power,"SortStr",'descend');
temp = theta_scan_deg(index)';
thetas = temp(1:src_num);

end

