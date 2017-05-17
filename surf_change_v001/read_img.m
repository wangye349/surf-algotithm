function [r,g,b] = read_img(filename)
    img_matrix = imread(filename);
    r_temp = img_matrix(:,:,1);
    g_temp = img_matrix(:,:,2);
    b_temp = img_matrix(:,:,3);
    r = double(r_temp);
    g = double(g_temp);
    b = double(b_temp);
    
end