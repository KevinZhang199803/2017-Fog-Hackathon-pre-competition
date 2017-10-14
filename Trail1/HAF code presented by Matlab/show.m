function [reply] = show(ele,water,gas)
    time_scale = 0:24/1440:24-1/1440;
    clf
    disp(' ')
    disp(' ' )
    disp('Press 1 to get the electricity usage.')
    disp('Press 2 to get the water usage.')
    disp('Press 3 to get the gas usage.')
    disp('Press 4 to go to the next day.')
    disp('Press 5 to exit.')
    disp(' ')
    reply = input('Your choice: ');
    if (reply == 1)
        figure(1)
        plot(time_scale,ele);
        axis([0 24 0 uint32(max(ele))+1000])
        title('Electricity usage')
        xlabel('Time')
        ylabel('Usage')
        input('Press enter to continue.');
    elseif(reply == 2)
        figure(1)
        plot(time_scale,water);
        axis([0 24 0 uint32(max(water))+10])
        title('Water usage')
        xlabel('Time')
        ylabel('Usage')
        input('Press enter to continue.');
    elseif(reply == 3)
        figure(1)
        plot(time_scale,gas);
        axis([0 24 0 uint32(max(gas))+1000])
        title('Gas usage')
        xlabel('Time')
        ylabel('Usage')
        input('Press enter to continue.')
    elseif(reply == 4)
    elseif(reply == 5)
    else
        disp('????')
    end
end