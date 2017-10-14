activities = csvread('activities.csv');
result = csvread('temp.csv');
map = imread('indiv.jpg');
total_map = uint8(zeros(1200,770,3));
total_map(:,:,:) = 255;
total_map(31:700,3:768,1:3) = map;
health = imread('health.jpg');
place1 = imread('place1.jpg');
place2 = imread('place2.jpg');
place3 = imread('place3.jpg');
alice = imread('alice.jpg');
total_map(701:760,21:235,:) = place1;
total_map(801:860,21:235,:) = place2;
total_map(901:960,21:235,:) = place3;
total_map(1001:1080,1:250,:) = health;
d = datetime('today');
gap = 617;
time = gap+-3;
date = d-time;
for i = 1:150
    time_vec = datevec(date);
    year = time_vec(1);
    month = time_vec(2);
    day = time_vec(3);
    health = result(i);
    health_pic = num2im(health);
    today_picture = total_map;
    today_act = activities(i,:);
    start_time1 = today_act(1);
    end_time1 = today_act(2);
    start_time2 = today_act(3);
    end_time2 = today_act(4);
    start_time3 = today_act(5);
    end_time3 = today_act(6);
    start_img1 = time2img(start_time1);
    end_img1 = time2img(end_time1);
    start_img2 = time2img(start_time2);
    end_img2 = time2img(end_time2);
    start_img3 = time2img(start_time3);
    end_img3 = time2img(end_time3);
    interval1 = time_interval(start_img1,end_img1);
    interval2 = time_interval(start_img2,end_img2);
    interval3 = time_interval(start_img3,end_img3);
    year_num1 = floor(year/100);
    year_num2 = mod(year,100);
    month_num = month;
    day_num = day;
    year_image_1 = num2im(year_num1);
    year_image_2 = num2im(year_num2);
    month_image = num2im(month_num);
    day_image = num2im(day_num);
    year_1_y = 1100;
    year_1_x = 200;
    year_2_y = 1100;
    year_2_x = 280;
    month_y = 1100;
    month_x = 390;
    day_y = 1100;
    day_x = 500;
    today_picture(year_1_y:year_1_y+49,year_1_x:year_1_x+89,:) = year_image_1;
    today_picture(year_2_y:year_2_y+49,year_2_x:year_2_x+89,:) = year_image_2;
    today_picture(month_y:month_y+49,month_x:month_x+89,:) = month_image;
    today_picture(day_y:day_y+49,day_x:day_x+89,:) = day_image;
    order = randperm(3);
    switch order(1)
        case 1
            today_picture(706:755,301:720,1:3) = interval1;
        case 2
            today_picture(706:755,301:720,1:3) = interval2;
        case 3
            today_picture(706:755,301:720,1:3) = interval3;
    end
        switch order(2)
        case 1
            today_picture(806:855,301:720,1:3) = interval1;
        case 2
            today_picture(806:855,301:720,1:3) = interval2;
        case 3
            today_picture(806:855,301:720,1:3) = interval3;
        end
    switch order(3)
        case 1
            today_picture(906:955,301:720,1:3) = interval1;
        case 2
            today_picture(906:955,301:720,1:3) = interval2;
        case 3
            today_picture(906:955,301:720,1:3) = interval3;
    end
    today_picture(1016:1065,451:540,:) = health_pic;
    my_move(today_picture,order(1),order(2));
    pause(0.5);
    my_move(today_picture,order(2),order(3));
    pause(2);
    date = date+1;
end