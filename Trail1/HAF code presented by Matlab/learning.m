function [coeff] = learning(total_day_unit,labels)
lambda = 0.1;

total_day_unit =  total_day_unit';
m = size(total_day_unit,1);
n = size(total_day_unit,2);
num_labels = 10;
coeff = zeros(num_labels,n+1);
initial_coeff = zeros(num_labels,n+1);
total_day_unit = [ones(m,1) total_day_unit];
options = optimset('GradObj','on','MaxIter',200);
for i = 1:num_labels
    temp_coeff = fmincg(@(t)(cost_function(t,total_day_unit, labels == i,lambda)),initial_coeff(i,:)',options);
    coeff(i,:) = temp_coeff;
end