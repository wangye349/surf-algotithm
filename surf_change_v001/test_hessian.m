% [r,g,b] = read_img('test.bmp');
% [dxx,dyy,dxy] = hessian_con(r,99);
% %[dxx1,dyy1,dxy1] = hessian_conv_intg(r,9);
% %sum(sum(sum([dxx1,dyy1,dxy1]-[dxx,dyy,dxy])))
% det_img = cal_det(dxx,dyy,dxy,99);
% position = select(det_img,99)
% % size(position)
%%
[r,g,b] = read_img('test_6_angle.bmp');

%keypoint1 = compare_num27(r,3,9,15);
keypoint1 = compare_num27(r,9,15,21);

keypoint2 = compare_num27(r,15,21,27);
keypoint3 = compare_num27(r,15,27,39);
% keypoint5 = compare_num27(r,27,39,51);
% keypoint6 = compare_num27(r,27,51,75);
% keypoint7 = compare_num27(r,51,75,99);
%size(keypoint0)
sum(sum(size(keypoint1)+size(keypoint2)+size(keypoint3)))
size(r,1) * size(r,2)
sum(sum((size(keypoint1)+size(keypoint2)+size(keypoint3))))/(size(r,1) * size(r,2))
% size(keypoint4)
% size(keypoint5)
% size(keypoint6)
% keypoint1 = zeros(size(keypoint,2),1);
% keypoint2 = zeros(size(keypoint,2),1);
% for k = 1:size(keypoint,2)
%     if(mod(k,2) == 1)
%         keypoint1(k,1) = keypoint(k);
%     else
%         keypoint2(k,1) = keypoint(k);
%     end
% end
% keypoint1;
% figure;
% plot(keypoint1,keypoint2);
% size(keypoint)
[m,n] = size(r);
r_change = r;

for i = 1:m
    for j = 1:n
        if(size(keypoint1,2)~=0)
            if([i,j] == [keypoint1(1),keypoint1(2)])
                keypoint1(1:2) = [];
                %if(i > 20 & i < m - 20 & j > 20 & j < n - 20)
                r_change(i,j) = 255;
                r_change(i-1,j) = 0;
                r_change(i-1,j-1) = 255;
                r_change(i-1,j+1) = 0;
                r_change(i,j-1) = 255;
                r_change(i,j+1) = 0;
                r_change(i+1,j-1) = 255;
                r_change(i+1,j) = 0;
                r_change(i+1,j+1) = 255;
                %end
            end
        end
        if(size(keypoint2,2)~=0)
            if([i,j] == [keypoint2(1),keypoint2(2)])
                keypoint2(1:2) = [];
                %if(i > 20 & i < m - 20 & j > 20 & j < n - 20)
                r_change(i,j) = 255;
                r_change(i-1,j) = 0;
                r_change(i-1,j-1) = 255;
                r_change(i-1,j+1) = 0;
                r_change(i,j-1) = 255;
                r_change(i,j+1) = 0;
                r_change(i+1,j-1) = 255;
                r_change(i+1,j) = 0;
                r_change(i+1,j+1) = 255;
                %end
            end
        end
        if(size(keypoint3,2)~=0)
            if([i,j] == [keypoint3(1),keypoint3(2)])
                keypoint3(1:2) = [];
                %if(i > 20 & i < m - 20 & j > 20 & j < n - 20)
                r_change(i,j) = 255;
                r_change(i-1,j) = 0;
                r_change(i-1,j-1) = 255;
                r_change(i-1,j+1) = 0;
                r_change(i,j-1) = 255;
                r_change(i,j+1) = 0;
                r_change(i+1,j-1) = 255;
                r_change(i+1,j) = 0;
                r_change(i+1,j+1) = 255;
                %end
            end
        end
%         if(size(keypoint4,2)~=0)
%             if([i,j] == [keypoint4(1),keypoint4(2)])
%                 keypoint4(1:2) = [];
%                 r_change(i,j) = 255;
%                 r_change(i-1,j) = 0;
%                 r_change(i-1,j-1) = 255;
%                 r_change(i-1,j+1) = 0;
%                 r_change(i,j-1) = 255;
%                 r_change(i,j+1) = 0;
%                 r_change(i+1,j-1) = 255;
%                 r_change(i+1,j) = 0;
%                 r_change(i+1,j+1) = 255;
%             end
%         end
%         if(size(keypoint5,2)~=0)
%             if([i,j] == [keypoint5(1),keypoint5(2)])
%                 keypoint5(1:2) = [];
%                 r_change(i,j) = 255;
%                 r_change(i-1,j) = 0;
%                 r_change(i-1,j-1) = 255;
%                 r_change(i-1,j+1) = 0;
%                 r_change(i,j-1) = 255;
%                 r_change(i,j+1) = 0;
%                 r_change(i+1,j-1) = 255;
%                 r_change(i+1,j) = 0;
%                 r_change(i+1,j+1) = 255;
%             end
%         end
%         if(size(keypoint6,2)~=0)
%             if([i,j] == [keypoint6(1),keypoint6(2)])
%                 keypoint6(1:2) = [];
%                 r_change(i,j) = 255;
%                 r_change(i-1,j) = 0;
%                 r_change(i-1,j-1) = 255;
%                 r_change(i-1,j+1) = 0;
%                 r_change(i,j-1) = 255;
%                 r_change(i,j+1) = 0;
%                 r_change(i+1,j-1) = 255;
%                 r_change(i+1,j) = 0;
%                 r_change(i+1,j+1) = 255;
%             end
%         end
        
        
    end
end
save_img('test6angle_change.bmp',r_change,g,b);%r_change); 