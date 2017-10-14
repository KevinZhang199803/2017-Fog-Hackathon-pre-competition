function cluster = compute_means(total_day_unit,belong,K)
[m,n] = size(total_day_unit);
cluster = zeros(K,n);
for i = 1:K
    count = 0;
    temp = zeros(1,n);
    for j = 1:length(belong)
        if belong(j) == i
            temp = temp +total_day_unit(j,:);
            count = count + 1;
        end
    end
    temp = temp/count;
    cluster(i,:) = temp';


end