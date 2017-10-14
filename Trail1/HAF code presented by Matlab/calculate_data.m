function [ output ] = calculate_data(day_number)
    d = datetime('today');
    gap = 2023;
    time = gap-day_number+1;
    day = d-time;
    day_vec = datevec(day);
    output = strcat('The day is ',32,num2str(day_vec(2)),'/',32,num2str(day_vec(3)),'/',32,num2str(day_vec(1)));
end

