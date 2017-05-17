[matrix3,matrix2,matrix1] = read_img('kodim22_200.bmp');
matrix3c = white(matrix3);
matrix3c(200,:)
save_img('hessian.bmp',matrix3c,matrix3c,matrix3c); 
fprintf ('this');
