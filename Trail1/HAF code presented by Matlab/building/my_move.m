function [ ] = my_move(map,start_point,end_point)
    old_map = map;
    place1_1 = 221;
    place1_2 = 101;
    place2_1 = 221;
    place2_2 = 601;
    place3_1 = 331;
    place3_2 = 361;
    x_length = 144;
    y_length = 79;
    alice = imread('alice.jpg');
    o2tw = zeros(11,2);
    tw2th = zeros(11,2);
    th2o = zeros(11,2);
    o2th = zeros(11,2);
    th2tw = zeros(11,2);
    tw2o = zeros(11,2);
    for i = 0:10
        o2tw(i+1,1) = uint32(221);
        o2tw(i+1,2) = uint32(101+50*i);
        tw2o(i+1,1) = uint32(221);
        tw2o(i+1,2) = uint32(601-50*i);
        tw2th(i+1,1) = uint32(221+11*i);
        tw2th(i+1,2) = uint32(601-24*i);
        th2tw(i+1,1) = uint32(331-11*i);
        th2tw(i+1,2) = uint32(361+24*i);
        th2o(i+1,1) = uint32(331-11*i);
        th2o(i+1,2) = uint32(361-26*i);
        o2th(i+1,1) = uint32(221+11*i);
        o2th(i+1,2) = uint32(101+26*i);
    end
    if start_point == 1
        if end_point == 2
            for i = 1:11
                loca_x = o2tw(i,1);
                loca_y = o2tw(i,2);
                map(loca_x:loca_x+x_length,loca_y:loca_y+y_length,1:3) = alice;
                imshow(map);
                map = old_map;
            end
        else
            for i = 1:11
                loca_x = o2th(i,1);
                loca_y = o2th(i,2);
                map(loca_x:loca_x+x_length,loca_y:loca_y+y_length,1:3) = alice;
                imshow(map);
                map = old_map;
            end
        end
    elseif start_point == 2
        if end_point == 1
            for i = 1:11
                loca_x = tw2o(i,1);
                loca_y = tw2o(i,2);
                map(loca_x:loca_x+x_length,loca_y:loca_y+y_length,1:3) = alice;
                imshow(map);
                map = old_map;
            end
        else
            for i = 1:11
                loca_x = tw2th(i,1);
                loca_y = tw2th(i,2);
                map(loca_x:loca_x+x_length,loca_y:loca_y+y_length,1:3) = alice;
                imshow(map);
                map = old_map;
            end
        end
    else
        if end_point == 1
            for i = 1:11
                loca_x = th2o(i,1);
                loca_y = th2o(i,2);
                map(loca_x:loca_x+x_length,loca_y:loca_y+y_length,1:3) = alice;
                imshow(map);
                map = old_map;
            end
        else
            for i = 1:11
                loca_x = th2tw(i,1);
                loca_y = th2tw(i,2);
                map(loca_x:loca_x+x_length,loca_y:loca_y+y_length,1:3) = alice;
                imshow(map);
                map = old_map;
            end
        end
    end
end

