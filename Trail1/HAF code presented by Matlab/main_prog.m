clear all
clf
ele_raw = csvread('WHE.csv');
water_raw = csvread('WHW.csv');
gas_raw = csvread('WHG.csv');
classify_result = csvread('classify_result.csv');
grade = csvread('grade.csv');
% the unit is unix timestamp
% the difference between two units is one minute
one_day_unit = 1440;
ele_day_unit = zeros(1440,500);
water_day_unit = zeros(1440,500);
gas_day_unit = zeros(1440,500);
time_scale = 0:1/60:24-1/60;
labels = zeros(500,1);
for i = 1:500
    ele_day_unit(:,i) = ele_raw((i-1)*1440+1:i*1440,:);
    water_day_unit(:,i) = water_raw((i-1)*1440+1:i*1440,:);
    gas_day_unit(:,i) = gas_raw((i-1)*1440+1:i*1440,:);
end
total_day_unit = zeros(4320,500);
total_day_unit([1:1440],:) = ele_day_unit;
total_day_unit([1441:2880],:) = water_day_unit;
total_day_unit([2881:4320],:) = gas_day_unit;
for i = 1:500
    temp1 = classify_result(i,1);
    temp2 = grade(temp1);
    labels(i) = temp2;
end
coeff = learning(total_day_unit,labels);
csvwrite('coeff.csv',coeff)