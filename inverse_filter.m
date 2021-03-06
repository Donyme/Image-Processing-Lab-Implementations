I=imread('cameraman','tif');
m=size(I,1);
n=size(I,2);

A=ones(m,n);
DFT=fft2(I);

D=ones(m,n);
for i=1:m
    for j=1:n
        D(i,j)=(DFT(i,j)*sin(pi*((i)*0.001+(j)*0.1))*(exp((-1i)*(0.001*i+j*0.1))))/(pi*((i)*0.001+(j)*0.1));
    end
end

D1=ones(m,n);
for i=1:m
    for j=1:n
        D1(i,j)=D(i,j)*(pi*((i)*0.001+(j)*0.1))/(sin(pi*((i)*0.001+(j)*0.1))*(exp((-1i)*(0.001*i+j*0.1))));
    end
end
img_blur=ifft2(D);
res=ifft2(D1);

subplot(2,2,1); imshow(I,[]); title('Original image');
subplot(2,2,2); imshow(img_blur,[]); title('Blurred image');
subplot(2,2,3); imshow(res,[]); title('Restored image');
