I1=imread('cameraman','tif');
T1=fft2(I1);
T1=fftshift(T1);

[a,b]=size(I1);

D0=input('threshold D0 value');
H=zeros(a,b);

for i=1:a
    for j=1:b
         T1(i,j)=T1(i,j)*(1-exp((-1)*((a/2-i)*(a/2-i)+(b/2-j)*(b/2-j))/(2*D0*D0)));
         H(i,j)=(1-exp((-1)*((a/2-i)*(a/2-i)+(b/2-j)*(b/2-j))/(2*D0*D0)));
    end
end

subplot(2,2,1); imshow(I1,[]); title('Original image');
subplot(2,2,2); imshow(log(1+T1),[]); title('Transformed image');
subplot(2,2,3); imshow(abs(ifft2(T1)),[]); title('Blurred image');
subplot(2,2,4); imshow(H,[]); title('Mask image');