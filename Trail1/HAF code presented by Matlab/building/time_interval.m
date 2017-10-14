function [interval] = time_interval(start_img,end_img)
    sim = imread('sim.jpg');
    interval = uint8(zeros(50,420,3));
    interval(:,:,:) = 255;
    interval(1:50,1:195,1:3) = start_img;
    interval(6:45,191:230,1:3) = sim;
    interval(1:50,226:420,1:3) = end_img;
end