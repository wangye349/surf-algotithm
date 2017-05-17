function [keypoint_position] = compare_num27(img_matrix_input,input_floor,input_middle,input_cell)
    octave_9 = octave(img_matrix_input,input_floor);
    octave_15 = octave(img_matrix_input,input_middle);
    octave_21 = octave(img_matrix_input,input_cell);
    size(octave_9);
    size(octave_15);
    size(octave_21);
%     octave_27 = octave(img_matrix_input,27);
%     octave_39 = octave(img_matrix_input,39);
%     octave_51 = octave(img_matrix_input,51);
%     octave_75 = octave(img_matrix_input,75);
%     octave_99 = octave(img_matrix_input,99);
    [m,n] = size(img_matrix_input);
    % [r,g,b] = read_img('test.bmp');
    [dxx,dyy,dxy] = hessian_con(img_matrix_input,input_middle);
% %[dxx1,dyy1,dxy1] = hessian_conv_intg(r,9);
% %sum(sum(sum([dxx1,dyy1,dxy1]-[dxx,dyy,dxy])))
    det_img = cal_det(dxx,dyy,dxy,input_middle);
    position = select(det_img,input_middle);
% % size(position)
    %position = select(img_matrix_input,15);
    size(position);
%     size(select(img_matrix_input,9))
%     size(select(img_matrix_input,21))
    %[k,q] = size(position);
    k = 0;
    position_temp = position;
    
    keypoint_position = [];
    %%
    for i = 1:m
        for j = 1:n
            
            if(size(position_temp,2) ~= 0)
                if ([i,j] == [position_temp(1),position_temp(2)])
                k = k + 2;
                if(k == 5000)
                    k;
                end
                if(k == 100000)
                    k;
                end
                if(k == 144444)
                    k;
                end
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