A=double(imread('eight','tif'));
B=A;
n=input('Input size of filter');
h=double(ones(n,n));
h=h/9;
mat=zeros(n,n);

for i=floor(n/2)+1:size(A,1)-floor(n/2)
    for j=floor(n/2)+1:size(A,2)-floor(n/2)        
        B(i,j)=sum(sum(A(i-floor(n/2):i-floor(n/2)+n-1,j-floor(n/2):j-floor(n/2)+n-1).*h)); 
    end
end

subplot(1,2,1); imshow(A,[]); title('Input image');
subplot(1,2,2); imshow(B,[]); title('Output Image');


