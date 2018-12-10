I=imread('pout','tif');
c=input('Enter the required gray Level: ');
B=(I==c);

I(B)=255;
I(~B)=0;

imshow(I);
