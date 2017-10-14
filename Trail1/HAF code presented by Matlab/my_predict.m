function [result] = my_predict(coeff,input);
input = input';
m = size(input , 1);
input = [ones(m,1) input];
temp = input*coeff';
[value,location] = sort(temp);
result = uint8((location(10)*0.6+location(9)*0.3+location(8)*0.1)*10);
end