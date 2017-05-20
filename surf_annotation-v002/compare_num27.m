function [keypoint_position] = compare_num27(img_matrix_input,input_floor,input_middle,input_cell)
    octave_9 = octave(img_matrix_input,input_floor);
    octave_15 = octave(img_matrix_input,input_middle);
    octave_21 = octave(img_matrix_input,input_cell);
    
    [m,n] = size(img_matrix_input);
    [dxx,dyy,dxy] = hessian_con(img_matrix_input,input_middle);
    det_img = cal_det(dxx,dyy,dxy,input_middle);
    position = select(det_img,input_middle);
    
    position_temp = position;
    keypoint_position = [];
    %%
    for i = 1:m
        for j = 1:n
            
            if(size(position_temp,2) ~= 0)
                position_temp(1:2) = [];
                size(position_temp);
                new_matrix = [];
                for x = -1:1
                    for y = -1:1
                        new_matrix = [new_matrix,octave_21(i+x,j+y)];
                        new_matrix = [new_matrix,octave_9(i+x,j+y)];
                        if [x,y] ~= [0,0]
                            new_matrix = [new_matrix,octave_15(i+x,j+y)];
                        end
                    end
                end
                if(octave_15(i,j) > max(new_matrix)) || (octave_15(i,j) < min(new_matrix))
                    keypoint_position = [keypoint_position,[i,j]];
                end
                end
            end
        end
    end
    
        
end