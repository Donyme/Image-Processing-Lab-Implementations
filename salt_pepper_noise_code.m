I=imread('cameraman','tif');
A=I;
r=input('Enter percentage of pixels to be affected');
n=floor((r*size(I,1)*size(I,2))/100);
a=1; b=size(I,2); c=size(I,2);
vec= randi([0 1],1,n);
rx = floor(a + (b-a).*rand(1,n));
ry = floor(a + (c-a).*rand(1,n));


for i=1:n
       k=rx(i);
       l=ry(i);
       if (vec(i)==0)
         I(k,l)=vec(i);
       else
         I(k,l)=255;
       end
end

subplot(1,2,1); imshow(uint8(A)); title('Original image');
subplot(1,2,2); imshow(uint8(I)); title('Salt and pepper Noise image');
