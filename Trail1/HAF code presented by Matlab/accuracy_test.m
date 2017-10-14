clear all
ele_raw = csvread('WHE.csv');
water_raw = csvread('WHW.csv');
gas_raw = csvread('WHG.csv');
classify_result = csvread('classify_result.csv');
grade = csvread('grade.csv');
outputfile = fopen('output.json','w');
% the unit is unix timestamp
% the difference between two units is one minute
one_day_unit = 1440;
ele_day_unit = zeros(1440,500);
water_day_unit = zeros(1440,500);
gas_day_unit = zeros(1440,500);
time_scale = 0:1/60:24-1/60;
labels = zeros(400,1);
for i = 1:500
    ele_day_unit(:,i) = ele_raw((i-1)*1440+1:i*1440,:);
    water_day_unit(:,i) = water_raw((i-1)*1440+1:i*1440,:);
    gas_day_unit(:,i) = gas_raw((i-1)*1440+1:i*1440,:);
end
total_day_unit = zeros(4320,500);
train_set = zeros(4320,400);
test_set = zeros(4320,100);
total_day_unit([1:1440],:) = ele_day_unit;
total_day_unit([1441:2880],:) = water_day_unit;
total_day_unit([2881:4320],:) = gas_day_unit;
train_set([1:1440],:) = ele_day_unit(:,[1:400]);
train_set([1441:2880],:) = water_day_unit(:,[1:400]);
train_set([2881:4320],:) = gas_day_unit(:,[1:400]);
test_set([1:1440],:) = ele_day_unit(:,[1:100]);
test_set([1441:2880],:) = water_day_unit(:,[1:100]);
test_set([2881:4320],:) = gas_day_unit(:,[1:100]);
for i = 1:400
    temp1 = classify_result(i,1);
    temp2 = grade(temp1);
    labels(i) = temp2;
end
coeff = learning(train_set,labels);

pre_result = zeros(1,100);
for i = 1:100
    pre_result(i) = my_predict(coeff,test_set(:,i)');
    json_result = jsonencode([pre_result(i),-1]);
    fwrite(outputfile,json_result);
end
real_result = zeros(1,100);
for i = 1:100
    temp1 = classify_result(i+400,1);
    temp2 = grade(temp1);
    real_result(i) = temp2;
end
count = 0;
for i = 1:100
    if real_result(i) ~= pre_result(i)
        count = count + abs(real_result(i) - pre_result(i));
    end
end
fclose(outputfile);
count 