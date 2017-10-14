function [time_img] = time2img(time)
    first_two = floor(time/100);
    last_two = mod(time,100);
    if last_two == 50
        last_two = 30;
    end
    first_img = num2im(first_two);
    last_img = num2im(last_two);
    colon = imread('maohao.jpg');
    time_img = uint8(zeros(50,195,3));
    time_img(:,:,:) = 255;
    time_img(1:50,1:90,1:3) = first_img;
    time_img(3:46,86:105,1:3) = colon;
    time_img(1:50,106:195,1:3) = last_img;
end