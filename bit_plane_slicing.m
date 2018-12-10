I=imread('pout','tif');
B=I;
I=double(I)
I1=mod(I,2);
I=floor(I/2);
I2=mod(I,2);
I=floor(I/2);
I3=mod(I,2);
I=floor(I/2);
I4=mod(I,2);
I=floor(I/2);
I5=mod(I,2);
I=floor(I/2);
I6=mod(I,2);
I=floor(I/2);
I7=mod(I,2);
I=floor(I/2);
I8=mod(I,2);

subplot(3,3,1); imshow((B),[]);title('Original Image');
subplot(3,3,2); imshow((I1),[]);title('0th bit plane');
subplot(3,3,3); imshow((I2),[]);title('1st bit plane');
subplot(3,3,4); imshow((I3),[]);title('2nd bit plane');
subplot(3,3,5); imshow((I4),[]);title('3rd bit plane');
subplot(3,3,6); imshow((I5),[]);title('4th bit plane');
subplot(3,3,7); imshow((I6),[]);title('5th bit plane');
subplot(3,3,8); imshow((I7),[]);title('6th bit plane');
subplot(3,3,9); imshow((I8),[]);title('7th bit plane');


