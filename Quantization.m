I=double(imread('cameraman','tif'));
n=input('Enter number of levels: ');

A=floor((I/255)*n);
unique(A)


imshow(A,[]);