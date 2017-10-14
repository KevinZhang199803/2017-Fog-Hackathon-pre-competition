a = zeros(150,6);
start_time = zeros(150,1);
for i = 1:150
    start_time(i) = randi(10);
    start_time(i) = start_time(i)*50 + 600;
end
a(:,1) = start_time;
end_time = zeros(150,1);
for i = 1:150
    dur1 = randi(7);
    end_time(i) = start_time(i) + dur1*50;
end
a(:,2) = end_time;
a(:,3) = end_time;
for i = 1:150
    dur1 = randi(7);
    end_time(i) = a(i,3) + dur1*50;
end
a(:,4) = end_time;
a(:,5) = end_time;
for i = 1:150
    dur1 = randi(7);
    end_time(i) = a(i,5) + dur1 *50;
end
a(:,6) = end_time;
csvwrite('activities.csv',a);