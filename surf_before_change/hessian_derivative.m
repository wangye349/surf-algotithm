function [outxx,outyy,outxy] = hessian_derivative(input_size)
syms x;
syms y;
if input_size == 9
    sig = 1.2;
elseif input_size == 15
    sig = 2;
elseif input_size == 21
            sig = 2.5;
elseif input_size == 27
                sig = 3;
else
    sig = 4;
end
    %sig = 1.2;
f = 1/(2 * pi * sig^2) * exp(-((x^2 + y^2)/2*sig^2));
a = inline(diff(f,x,2));
b = inline(diff(f,y,2));
c = diff(f,x);
d = inline(diff(c,y));
q = (input_size - 1)/2 + 1;
outxx_temp = zeros(input_size,input_size);
outyy_temp = zeros(input_size,input_size);
outxy_temp = zeros(input_size,input_size);
outxx = zeros(input_size,input_size);
outyy = zeros(input_size,input_size);
outxy = zeros(input_size,input_size);
for i = 1:input_size
    for j = 1:input_size
        k = i - q;
        p = j - q;
        outxx_temp(i,j) = a(k,p);
        outyy_temp(i,j) = b(k,p);
        outxy_temp(i,j) = d(k,p);
    end
end
% for i = 1:input_size
%     for j = 1:input_size
%         if abs(outxx_temp(i,j))<0.5
%             outxx(i,j) = 0;
%         elseif (0.5<=abs(abs(outxx_temp(i,j))))&&(abs(abs(outxx_temp(i,j)))<1.5)
%             if(outxx_temp(i,j)>0) 
%                 outxx(i,j) = 1;
%             else
%                 outxx(i,j) = -1;
%             end
%         elseif (1.5<=abs(abs(outxx_temp(i,j))))&&(abs(outxx_temp(i,j))<3)
%             if(outxx_temp(i,j)>0) 
%                 outxx(i,j) = 2;
%             else
%                 outxx(i,j) = -2;
%             end
%         elseif (3<=abs(outxx_temp(i,j)))&&(abs(outxx_temp(i,j))<6)
%             if(outxx_temp(i,j)>0) 
%                 outxx(i,j) = 4;
%             else
%                 outxx(i,j) = -4;
%             end
%         elseif (6<=abs(outxx_temp(i,j)))&&(abs(outxx_temp(i,j))<12)
%             if(outxx_temp(i,j)>0) 
%                 outxx(i,j) = 8;
%             else
%                 outxx(i,j) = -8;
%             end
%         elseif (12<=abs(outxx_temp(i,j)))&&(abs(outxx_temp(i,j))<24)
%             if(outxx_temp(i,j)>0) 
%                 outxx(i,j) = 16;
%             else
%                 outxx(i,j) = -16;
%             end
%         elseif (24<=abs(outxx_temp(i,j)))&&(abs(outxx_temp(i,j))<40)
%             if(outxx_temp(i,j)>0) 
%                 outxx(i,j) = 32;
%             else
%                 outxx(i,j) = -32;
%             end
%         elseif (40<=abs(outxx_temp(i,j)))&&(abs(outxx_temp(i,j))<96)
%             if(outxx_temp(i,j)>0) 
%                 outxx(i,j) = 64;
%             else
%                 outxx(i,j) = -64;
%             end
%         elseif (96<=abs(outxx_temp(i,j)))&&(abs(outxx_temp(i,j))<194)
%             if(outxx_temp(i,j)>0) 
%                 outxx(i,j) = 128;
%             else
%                 outxx(i,j) = -128;
%             end
%         elseif (194<=abs(outxx_temp(i,j)))&&(abs(outxx_temp(i,j))<384)
%             if(outxx_temp(i,j)>0) 
%                 outxx(i,j) = 256;
%             else
%                 outxx(i,j) = -256;
%             end
%         end        
%         if abs(outyy_temp(i,j))<0.5
%             outyy(i,j) = 0;
%         elseif (0.5<=abs(abs(outyy_temp(i,j))))&&(abs(abs(outyy_temp(i,j)))<1.5)
%             if(outyy_temp(i,j)>0) 
%                 outyy(i,j) = 1;
%             else
%                 outyy(i,j) = -1;
%             end
%         elseif (1.5<=abs(abs(outyy_temp(i,j))))&&(abs(outyy_temp(i,j))<3)
%             if(outyy_temp(i,j)>0) 
%                 outyy(i,j) = 2;
%             else
%                 outyy(i,j) = -2;
%             end
%         elseif (3<=abs(outyy_temp(i,j)))&&(abs(outyy_temp(i,j))<6)
%             if(outyy_temp(i,j)>0) 
%                 outyy(i,j) = 4;
%             else
%                 outyy(i,j) = -4;
%             end
%         elseif (6<=abs(outyy_temp(i,j)))&&(abs(outyy_temp(i,j))<12)
%             if(outyy_temp(i,j)>0) 
%                 outyy(i,j) = 8;
%             else
%                 outyy(i,j) = -8;
%             end
%         elseif (12<=abs(outyy_temp(i,j)))&&(abs(outyy_temp(i,j))<24)
%             if(outyy_temp(i,j)>0) 
%                 outyy(i,j) = 16;
%             else
%                 outyy(i,j) = -16;
%             end
%         elseif (24<=abs(outyy_temp(i,j)))&&(abs(outyy_temp(i,j))<40)
%             if(outyy_temp(i,j)>0) 
%                 outyy(i,j) = 32;
%             else
%                 outyy(i,j) = -32;
%             end
%         elseif (40<=abs(outyy_temp(i,j)))&&(abs(outyy_temp(i,j))<96)
%             if(outyy_temp(i,j)>0) 
%                 outyy(i,j) = 64;
%             else
%                 outyy(i,j) = -64;
%             end
%         elseif (96<=abs(outyy_temp(i,j)))&&(abs(outyy_temp(i,j))<194)
%             if(outyy_temp(i,j)>0) 
%                 outyy(i,j) = 128;
%             else
%                 outyy(i,j) = -128;
%             end
%         elseif (194<=abs(outyy_temp(i,j)))&&(abs(outyy_temp(i,j))<384)
%             if(outyy_temp(i,j)>0) 
%                 outyy(i,j) = 256;
%             else
%                 outyy(i,j) = -256;
%             end
%         end
%         if abs(outxy_temp(i,j))<0.5
%             outxy(i,j) = 0;
%         elseif (0.5<=abs(abs(outxy_temp(i,j))))&&(abs(abs(outxy_temp(i,j)))<1.5)
%             if(outxy_temp(i,j)>0) 
%                 outxy(i,j) = 1;
%             else
%                 outxy(i,j) = -1;
%             end
%         elseif (1.5<=abs(abs(outxy_temp(i,j))))&&(abs(outxy_temp(i,j))<3)
%             if(outxy_temp(i,j)>0) 
%                 outxy(i,j) = 2;
%             else
%                 outxy(i,j) = -2;
%             end
%         elseif (3<=abs(outxy_temp(i,j)))&&(abs(outxy_temp(i,j))<6)
%             if(outxy_temp(i,j)>0) 
%                 outxy(i,j) = 4;
%             else
%                 outxy(i,j) = -4;
%             end
%         elseif (6<=abs(outxy_temp(i,j)))&&(abs(outxy_temp(i,j))<12)
%             if(outxy_temp(i,j)>0) 
%                 outxy(i,j) = 8;
%             else
%                 outxy(i,j) = -8;
%             end
%         elseif (12<=abs(outxy_temp(i,j)))&&(abs(outxy_temp(i,j))<24)
%             if(outxy_temp(i,j)>0) 
%                 outxy(i,j) = 16;
%             else
%                 outxy(i,j) = -16;
%             end
%         elseif (24<=abs(outxy_temp(i,j)))&&(abs(outxy_temp(i,j))<40)
%             if(outxy_temp(i,j)>0) 
%                 outxy(i,j) = 32;
%             else
%                 outxy(i,j) = -32;
%             end
%         elseif (40<=abs(outxy_temp(i,j)))&&(abs(outxy_temp(i,j))<96)
%             if(outxy_temp(i,j)>0) 
%                 outxy(i,j) = 64;
%             else
%                 outxy(i,j) = -64;
%             end
%         elseif (96<=abs(outxy_temp(i,j)))&&(abs(outxy_temp(i,j))<194)
%             if(outxy_temp(i,j)>0) 
%                 outxy(i,j) = 128;
%             else
%                 outxy(i,j) = -128;
%             end
%         elseif (194<=abs(outxy_temp(i,j)))&&(abs(outxy_temp(i,j))<384)
%             if(outxy_temp(i,j)>0) 
%                 outxy(i,j) = 256;
%             else
%                 outxy(i,j) = -256;
%             end
%         end   
%     end
% end
% 
% for i = 1:input_size
%     for j = 1:input_size
%         outxx(i,j) = outxx(i,j) / 1000;
%         outyy(i,j) = outyy(i,j) / 1000;
%         outxy(i,j) = outxy(i,j) / 1000;
%     end
% end
repair = sum(sum(outxx_temp))/(input_size^2);
for i = 1:input_size
    for j = 1:input_size
        k = i - q;
        p = j - q;
        outxx(i,j) = (a(k,p) - repair);
        outyy(i,j) = (b(k,p) - repair);
        outxy(i,j) = (d(k,p));
    end
end


end