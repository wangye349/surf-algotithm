function [img_integral] = cal_integral(img_matrix_input)
    [m,n] = size(img_matrix_input);
    img_integral = zeros(m+1,n+1);
    for i = 2:m+1
        for j = 2:n+1
            img_integral(i,j) = img_integral(i-1,j)+img_integral(i,j-1)-img_integral(i-1,j-1)+img_matrix_input(i-1,j-1);
        end
    end
    img_integral = img_integral(2:end,2:end);
end