clear all
clf
ele_raw = csvread('WHE.csv');
water_raw = csvread('WHW.csv');
gas_raw = csvread('WHG.csv');
% the unit is unix timestamp
% the difference between two units is one minute
one_day_unit = 1440;
ele_day_unit = zeros(1440,500);
water_day_unit = zeros(1440,500);
gas_day_unit = zeros(1440,500);
time_scale = 0:1/60:24-1/60;
for i = 1:500
    ele_day_unit(:,i) = ele_raw((i-1)*1440+1:i*1440,:);
    water_day_unit(:,i) = water_raw((i-1)*1440+1:i*1440,:);
    gas_day_unit(:,i) = gas_raw((i-1)*1440+1:i*1440,:);
end
%every column is the data of one day

[belong,cluster] = kmeans(ele_day_unit,water_day_unit,gas_day_unit);
ele_cluster = cluster(:,[1:1440])*mean(ele_day_unit(:));
water_cluster = cluster(:,[1441:2880])*mean(water_day_unit(:));
gas_cluster = cluster(:,[2881:4320])*mean(gas_day_unit(:));
figure(1)
grade = zeros(1,10);
subplot(311);
plot(time_scale,ele_cluster(1,:),'r');
hold off;
subplot(312);
plot(time_scale,water_cluster(1,:),'b');
hold off;
subplot(313);
plot(time_scale,gas_cluster(1,:),'g');
hold off;
figure(2)
subplot(311);
plot(time_scale,ele_cluster(2,:),'r');
hold off;
subplot(312);
plot(time_scale,water_cluster(2,:),'b');
hold off;
subplot(313);
plot(time_scale,gas_cluster(2,:),'g');
hold off;
figure(3)
subplot(311);
plot(time_scale,ele_cluster(3,:),'r');
hold off;
subplot(312);
plot(time_scale,water_cluster(3,:),'b');
hold off;
subplot(313);
plot(time_scale,gas_cluster(3,:),'g');
hold off;
figure(4)
subplot(311);
plot(time_scale,ele_cluster(4,:),'r');
hold off;
subplot(312);
plot(time_scale,water_cluster(4,:),'b');
hold off;
subplot(313);
plot(time_scale,gas_cluster(4,:),'g');
hold off;
figure(5)
subplot(311);
plot(time_scale,ele_cluster(5,:),'r');
hold off;
subplot(312);
plot(time_scale,water_cluster(5,:),'b');
hold off;
subplot(313);
plot(time_scale,gas_cluster(5,:),'g');
hold off;
figure(6)
subplot(311);
plot(time_scale,ele_cluster(6,:),'r');
hold off;
subplot(312);
plot(time_scale,water_cluster(6,:),'b');
hold off;
subplot(313);
plot(time_scale,gas_cluster(6,:),'g');
hold off;
figure(7)
subplot(311);
plot(time_scale,ele_cluster(7,:),'r');
hold off;
subplot(312);
plot(time_scale,water_cluster(7,:),'b');
hold off;
subplot(313);
plot(time_scale,gas_cluster(7,:),'g');
hold off;
figure(8)
subplot(311);
plot(time_scale,ele_cluster(8,:),'r');
hold off;
subplot(312);
plot(time_scale,water_cluster(8,:),'b');
hold off;
subplot(313);
plot(time_scale,gas_cluster(8,:),'g');
hold off;
figure(9)
subplot(311);
plot(time_scale,ele_cluster(9,:),'r');
hold off;
subplot(312);
plot(time_scale,water_cluster(9,:),'b');
hold off;
subplot(313);
plot(time_scale,gas_cluster(9,:),'g');
hold off;
figure(10)
subplot(311);
plot(time_scale,ele_cluster(10,:),'r');
hold off;
subplot(312);
plot(time_scale,water_cluster(10,:),'b');
hold off;
subplot(313);
plot(time_scale,gas_cluster(10,:),'g');
hold off;
%for i = 1:10
%    grade(i) = input('please input the grade:')
%end
%csvwrite('classify_result.csv',belong);
%csvwrite('grade.csv',grade);