function [det_img] = cal_det(hessian_out_dxx,hessian_out_dyy,hessian_out_dxy,hessian_matrix_size)
    [m,n] = size(hessian_out_dxx);
    side_cant_handle = floor(hessian_matrix_size/2);
    det_img = hessian_out_dxx;
    for i = side_cant_handle+1:m-side_cant_handle
        for j = side_cant_handle+1:n-side_cant_handle
            det_img(i,j) = hessian_out_dxx(i,j)*hessian_out_dyy(i,j) - 0.81*hessian_out_dxy(i,j)*hessian_out_dxy(i,j);
        end
    end
end