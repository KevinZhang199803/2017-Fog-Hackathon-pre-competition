function [] = print_message( health_value )
    value = uint32(health_value/10);
    if value == 1
        disp('Go to bed earlier and get more rest!')
    elseif value == 2
        disp('You"""d better reduce your activities at night!')
    elseif value == 3
        disp('Rest more! Otherwise you will be ill!')
    elseif value == 4
        disp('Your life today seems not so regular.')
    elseif value == 5
        disp('Please go to bed earilier.')
    elseif value == 6
        disp('Good! How about clean your hand more times?')
    elseif value == 7
        disp('Good! But you may eat too much.')
    elseif value == 8
        disp('Good! How about get up eariler?')
    elseif value == 9
        disp('Good! Keep it.')
    elseif value == 10
        disp('Excellent!!!!')
    end


end

