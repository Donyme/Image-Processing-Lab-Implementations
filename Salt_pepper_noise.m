A_org=imread('eight','tif');
K=A;
A = imnoise(A_org, 'salt & pepper',0.05);
%subplot(2,2,1); imshow(A); title('Input image');
A=double(A);
B=zeros(size(A_org));
C=zeros(size(A));
D=zeros(size(A));
n=input('Input size of filter');
h=(ones(n,n));
%h=h/9;
mat=zeros(n,n);

for i=floor(n/2)+1:size(A,1)-floor(n/2)
    for j=floor(n/2)+1:size(A,2)-floor(n/2)        
        B(i,j)=max(max(A(i-floor(n/2):i-floor(n/2)+n-1,j-floor(n/2):j-floor(n/2)+n-1).*h)); 
        C(i,j)=mean(mean(A(i-floor(n/2):i-floor(n/2)+n-1,j-floor(n/2):j-floor(n/2)+n-1).*h));
        R=(A(i-floor(n/2):i-floor(n/2)+n-1,j-floor(n/2):j-floor(n/2)+n-1));
        D(i,j)=median(R(:)); 
    end
end

subplot(2,2,1); imshow(uint8(A)); title('Input image');
subplot(2,2,2); imshow(uint8(B)); title('Max filtered image Image');
subplot(2,2,3); imshow(uint8(C)); title('Mean filtered image Image');
subplot(2,2,4); imshow(uint8(D)); title('Median filtered image Image');


