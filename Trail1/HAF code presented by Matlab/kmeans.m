function [belong,cluster] = kmeans(ele_day_unit,water_day_unit,gas_day_unit)
K = 10;
sample_num = 500;
sample_dimension = 4320;
ele_day_unit = ele_day_unit/mean(ele_day_unit(:));
water_day_unit = water_day_unit/mean(water_day_unit(:));
gas_day_unit = gas_day_unit/mean(gas_day_unit(:));
total_day_unit = zeros(4320,500);
total_day_unit(1:1440,:) = ele_day_unit;
total_day_unit(1441:2880,:) = water_day_unit;
total_day_unit(2881:4320,:) = gas_day_unit;
cluster = zeros(K,sample_dimension);
rand_choice = randperm(sample_num);
cluster = total_day_unit(:,rand_choice(1:K))';
total_day_unit = total_day_unit';
%clusters_water = rand(K,sample_dimension)*mean(water_day_unit(:,1));
%clusters_gas = rand(K,sample_dimension)*mean(gas_day_unit(:,1));

belong = zeros(sample_num,1);
iter = 200;

for i = 1:iter
    belong = find_closest(total_day_unit,cluster);
    cluster = compute_means(total_day_unit,belong,K);
end