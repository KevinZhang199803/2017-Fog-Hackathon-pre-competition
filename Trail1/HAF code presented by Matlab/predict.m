clear all
clf
ele_raw = csvread('WHE.csv');
water_raw = csvread('WHW.csv');
gas_raw = csvread('WHG.csv');
coeff = csvread('coeff.csv');
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
temp = zeros(1,500);
for i = 1:500
    temp_ele = ele_day_unit(:,i);
    temp_water = water_day_unit(:,i);
    temp_gas = gas_day_unit(:,i);
    temp_total = total_day_unit(:,i);
    temp(i) = my_predict(coeff,temp_total);
end
csvwrite('temp.csv',temp');
while(1)
    disp('')
    disp('Press 1 to enter the health detetion mode.');
    disp('Press 2 to enter the data require mode.')
    disp('Press 3 to exit.')
    choice1 = input('Your choice: ');
    if (choice1 == 1)
        input_year = input('Please enter the year you want to check: ');
        input_month = input('Please enter the month you want to check: ');
        input_day = input('Please enter the day you want to check: ');
        t1 = datetime(input_year,input_month,input_day);
        t2 = datetime(2012,4,1);
        tempppp = datevec(t1-t2);
        difference = tempppp(3)+1;
        for i = difference:500
            day = calculate_data(i);
            disp(day)
            today_ele = ele_day_unit(:,i);
            today_water = water_day_unit(:,i);
            today_gas = gas_day_unit(:,i);
            today_total = total_day_unit(:,i);
            heal = my_predict(coeff,today_total);
            heal_result = strcat('Your health number is: ',32,int2str(heal));
            disp(heal_result)
            print_message(heal);
            result = 0;
            result = show(today_ele,today_water,today_gas);
            while((result == 1)||(result == 2)||(result == 3))
                result = show(today_ele,today_water,today_gas);
            end
            if(result == 5)
                break
            end
        end
    elseif (choice1 == 2)
        input_year = input('Please enter the year you want to check: ');
        input_month = input('Please enter the month you want to check: ');
        input_day = input('Please enter the day you want to check: ');
        t1 = datetime(input_year,input_month,input_day);
        t2 = datetime(2012,4,1);
        tempppp = datevec(t1-t2);
        difference = tempppp(3)+1;
        clf
        time_scale = 0:24/1440:24-1/1440;
        figure(1)
        subplot(311)
        plot(time_scale,ele_day_unit(:,difference));
        axis([0 24 0 uint32(max(ele_day_unit(:,difference)))+1000])
        title('Electricity usage')
        xlabel('Time')
        ylabel('Usage')
        subplot(312)
        plot(time_scale,water_day_unit(:,difference));
        axis([0 24 0 uint32(max(water_day_unit(:,difference)))+10])
        title('Water usage')
        xlabel('Time')
        ylabel('Usage')
        subplot(313)
        plot(time_scale,gas_day_unit(:,difference));
        axis([0 24 0 uint32(max(gas_day_unit(:,difference)))+1000])
        title('Gas usage')
        xlabel('Time')
        ylabel('Usage')
        input('Press enter to continue.')
    elseif (choice1 == 3)
        break
    else
        disp('????')
    end
end
