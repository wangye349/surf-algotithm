function [hessian_out_dxx,hessian_out_dyy,hessian_out_dxy] = hessian_con(img_matrix_input,hessian_matrix_size)
    [m,n] = size(img_matrix_input);
    hessian_out_dxx = img_matrix_input;
    hessian_out_dyy = img_matrix_input;
    hessian_out_dxy = img_matrix_input;
    
    convo_mask = zeros(hessian_matrix_size,hessian_matrix_size);
    
    side_cant_handle = floor(hessian_matrix_size/2);
    side_two_j = round((hessian_matrix_size-3)/6);
    side_i = round((hessian_matrix_size-3)/3);
    rec_size = round(hessian_matrix_size/3);
    side_side = round((hessian_matrix_size+3)/6);
    side_side_two = round(hessian_matrix_size/3);
    side_side_dxy = round((hessian_matrix_size-3)/6);
    
    mask_dxx = convo_mask;
    mask_dyy = convo_mask;
    mask_dxy = convo_mask;
    mask_dxx(:,side_side+1:hessian_matrix_size-side_side) = 1;
    mask_dxx(side_side_two+1:2*side_side_two,side_side+1:hessian_matrix_size-side_side) = -2;
    %mask_dxx
    mask_dyy(side_side+1:hessian_matrix_size-side_side,:) = 1;
    mask_dyy(side_side+1:hessian_matrix_size-side_side,side_side_two+1:2*side_side_two) = -2;
    %mask_dyy
    mask_dxy(side_side_dxy+1:side_side_dxy+rec_size,side_side_dxy+1:side_side_dxy+rec_size) = 1;
    mask_dxy(side_side_dxy+rec_size+2:side_side_dxy+2*rec_size+1,side_side_dxy+rec_size+2:side_side_dxy+2*rec_size+1) = 1;
    mask_dxy(side_side_dxy+1:side_side_dxy+rec_size,side_side_dxy+rec_size+2:side_side_dxy+2*rec_size+1) = -1;
    mask_dxy(side_side_dxy+rec_size+2:side_side_dxy+2*rec_size+1,side_side_dxy+1:side_side_dxy+rec_size) = -1;
    %mask_dxy
    
    for i = side_cant_handle+1:m-side_cant_handle
        for j = side_cant_handle+1:n-side_cant_handle
            %img_matrix_input(i-side_cant_handle:i+side_cant_handle,j-side_cant_handle:j+side_cant_handle)
            hessian_out_dxx(i,j) = sum(sum(img_matrix_input(i-side_cant_handle:i+side_cant_handle,j-side_cant_handle:j+side_cant_handle).*mask_dxx));
            hessian_out_dyy(i,j) = sum(sum(img_matrix_input(i-side_cant_handle:i+side_cant_handle,j-side_cant_handle:j+side_cant_handle).*mask_dyy));
            hessian_out_dxy(i,j) = sum(sum(img_matrix_input(i-side_cant_handle:i+side_cant_handle,j-side_cant_handle:j+side_cant_handle).*mask_dxy));
        end
    end
end