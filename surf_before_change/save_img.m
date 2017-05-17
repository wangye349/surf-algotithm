function [file] = save_img(filename,input_matrix1,input_matrix2,input_matrix3)
    output_matrix(:,:,1) = uint8(input_matrix1);
    output_matrix(:,:,2) = uint8(input_matrix2);
    output_matrix(:,:,3) = uint8(input_matrix3);
    imwrite(output_matrix,filename);
end