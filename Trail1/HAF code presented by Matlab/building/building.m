raw_image = imread('layout.JPG');
heal_value = csvread('temp.csv');
im_zero = imread('0.jpg');
im_one = imread('1.jpg');
im_two = imread('2.jpg');
im_three = imread('3.jpg');
im_four = imread('4.jpg');
im_five = imread('5.jpg');
im_six = imread('6.jpg');
im_seven = imread('7.jpg');
im_eight = imread('8.jpg');
im_nine = imread('9.jpg');
health = zeros(150,3);
health(:,1) = heal_value(1:150);
health(:,2) = heal_value(151:300);
health(:,3) = heal_value(301:450);
x1_bias = 450;
y1_bias = 130;
x2_bias = 450;
y2_bias = 400;
x3_bias = 450;
y3_bias = 670;
color = uint8(zeros(150,3));
for i = 1:100
    temp = zeros(1,3);
    num1 = 100-i;
    temp(1) = 250-2.5*i;
    temp(2) = 5*i-200;
    temp(3) = 0;
    color(i,:) = temp;
end
d = datetime('today');
gap = 617;
time = gap+-3;
date = d-time;
for i = 1:150
    time_vec = datevec(date);
    year = time_vec(1);
    month = time_vec(2);
    day = time_vec(3);
    room1_num = health(i,1);
    room2_num = health(i,2);
    room3_num = health(i,3);
    room1_im = num2im(room1_num);
    room2_im = num2im(room2_num);
    room3_im = num2im(room3_num);
    raw_image(x1_bias:x1_bias+49,y1_bias:y1_bias+89,:) = room1_im;
    raw_image(x2_bias:x2_bias+49,y2_bias:y2_bias+89,:) = room2_im;
    raw_image(x3_bias:x3_bias+49,y3_bias:y3_bias+89,:) = room3_im;
    color_block1 = uint8(zeros(296,260,3));
    color_block2 = uint8(zeros(296,260,3));
    color_block3 = uint8(zeros(296,268,3));
    room1_x = 145;
    room1_y = 47;
    room2_x = 145;
    room2_y = 313;
    room3_x = 145;
    room3_y = 580;
    color_block1(:,:,1) = color(room1_num,1);
    color_block1(:,:,2) = color(room1_num,2);
    color_block1(:,:,3) = color(room1_num,3);
    color_block2(:,:,1) = color(room2_num,1);
    color_block2(:,:,2) = color(room2_num,2);
    color_block2(:,:,3) = color(room2_num,3);
    color_block3(:,:,1) = color(room3_num,1);
    color_block3(:,:,2) = color(room3_num,2);
    color_block3(:,:,3) = color(room3_num,3);
    raw_image(room1_x:room1_x+295,room1_y:room1_y+259,:) = color_block1;
    raw_image(room2_x:room2_x+295,room2_y:room2_y+259,:) = color_block2;
    raw_image(room3_x:room3_x+295,room3_y:room3_y+267,:) = color_block3;
    year_num1 = floor(year/100);
    year_num2 = mod(year,100);
    month_num = month;
    day_num = day;
    year_image_1 = num2im(year_num1);
    year_image_2 = num2im(year_num2);
    month_image = num2im(month_num);
    day_image = num2im(day_num);
    year_1_y = 570;
    year_1_x = 240;
    year_2_y = 570;
    year_2_x = 320;
    month_y = 570;
    month_x = 440;
    day_y = 570;
    day_x = 560;
    raw_image(year_1_y:year_1_y+49,year_1_x:year_1_x+89,:) = year_image_1;
    raw_image(year_2_y:year_2_y+49,year_2_x:year_2_x+89,:) = year_image_2;
    raw_image(month_y:month_y+49,month_x:month_x+89,:) = month_image;
    raw_image(day_y:day_y+49,day_x:day_x+89,:) = day_image;
    imshow(raw_image)
    pause(1)
    date = date+1;
end
