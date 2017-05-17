function [octave]  = octave(img_matrix_input,hessian_matrix_size)
    [hessian_matrix_1,hessian_matrix_2,hessian_matrix_3] = hessian_con(img_matrix_input,hessian_matrix_size);
   
    octave_temp = cal_det(hessian_matrix_1,hessian_matrix_2,hessian_matrix_3,hessian_matrix_size);
    octave = octave_temp;
%     [m,n] = size(octave);
%     for i = 1:m
%         for j = 1:n
%             if(octave_temp(i,j) < 200000)
%                 octave(i,j) = 0;
%             end
%         end
%     end
    
end