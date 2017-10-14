function belong = find_closest(total_day_unit,cluster)
    K = size(cluster,1);
    belong = zeros(size(total_day_unit,1),1);
    [m,n] = size(total_day_unit);
    for i = 1:m
        curr_example = total_day_unit(i,:);
        temp = zeros(K,1);
        for j = 1:K
            temp1 = (curr_example-cluster(j,:)).*(curr_example-cluster(j,:));
            temp2 = sum(temp1);
            temp(j) = temp2;
        end
        [~,ind] = min(temp);
        belong(i) = ind;
    end

end