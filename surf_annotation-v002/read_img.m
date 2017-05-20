function [r,g,b] = read_img(filename)
%Just read the image data, and convert it into arrays.
    img_matrix = imread(filename);
    r_temp = img_matrix(:,:,1);
    g_temp = img_matrix(:,:,2);
    b_temp = img_matrix(:,:,3);
    r = double(r_temp);
    g = double(g_temp);
    b = double(b_temp);
    
end