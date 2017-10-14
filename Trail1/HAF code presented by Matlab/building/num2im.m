function [num_im] = num2im(num)
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
    num_im = uint8(zeros(50,90,3));
    num_im(:,:,:) = 255;
    first_dig = floor(num/10);
    sec_dig = mod(num,10);
    first_image = zeros(50,50,3);
    sec_image = zeros(50,50,3);
    switch first_dig
        case 0
            first_image = im_zero;
        case 1
            first_image = im_one;
        case 2
            first_image = im_two;
        case 3
            first_image = im_three;
        case 4
            first_image = im_four;
        case 5
            first_image = im_five;
        case 6
            first_image = im_six;
        case 7
            first_image = im_seven;
        case 8
            first_image = im_eight;
        case 9
            first_image = im_nine;
    end
    switch sec_dig
        case 0
            sec_image = im_zero;
        case 1
            sec_image = im_one;
        case 2
            sec_image = im_two;
        case 3
            sec_image = im_three;
        case 4
            sec_image = im_four;
        case 5
            sec_image = im_five;
        case 6
            sec_image = im_six;
        case 7
            sec_image = im_seven;
        case 8
            sec_image = im_eight;
        case 9
            sec_image = im_nine;
    end
    num_im(:,1:50,1:3) = first_image;
    num_im(:,41:90,1:3) = sec_image;
end

