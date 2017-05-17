function [position] = select(det_img,hessian_matrix_size)
    [m,n] = size(det_img);
    det_img_temp = reshape(det_img',1,[]);
    det_img_sort = sort(det_img,'descend');
    position = [];
    side_cant_handle = floor(hessian_matrix_size/2);
    for i = side_cant_handle+1:m-side_cant_handle
        for j = side_cant_handle+1:n-side_cant_handle
            if(det_img(i,j)>3*hessian_matrix_size*hessian_matrix_size*hessian_matrix_size*hessian_matrix_size*hessian_matrix_size)
                position = [position,[i,j]];
            end
        end
    end
end