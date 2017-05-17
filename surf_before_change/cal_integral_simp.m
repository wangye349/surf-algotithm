function [img_integral] = cal_integral_simp(img_matrix_input)
    [m,n] = size(img_matrix_input);
    int_line_by_line = img_matrix_input;
    for i = 1:m
        for j = 2:n
            int_line_by_line(i,j) = int_line_by_line(i,j-1) + img_matrix_input(i,j);
        end
    end
    img_integral = int_line_by_line;
    for i = 2:m
        for j = 1:n
            img_integral(i,j)=img_integral(i-1,j)+int_line_by_line(i,j);
        end
    end
    
end