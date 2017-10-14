function [cost,grad] = cost_function(coeff, total_day_unit, labels, lambda)
    m = length(labels); %number of training examples
    cost = 0;
    grad = zeros(size(coeff));
    
    h = sigmoid(total_day_unit*coeff);
    temp = -(labels.*log(h))-(1-labels).*(log(1-h));
    cost = sum(temp);
    cost = cost/m;
    temp = coeff.*coeff;
    temp = temp*lambda/(2*m);
    cost = cost + sum(temp(2:end,:));
    
    temp = total_day_unit'*(h-labels);
    grad = temp/m;
    grad1 = grad + coeff*lambda/m;
    grad(2:end,:) = grad1(2:end,:);
    grad = grad(:);
end