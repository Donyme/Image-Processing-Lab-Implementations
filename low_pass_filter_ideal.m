I1=imread('cameraman','tif');
T1=fft2(I1);
T1=fftshift(T1);

[a,b]=size(I1);

D0=input('threshold D0 value');
H=zeros(a,b);

for i=1:a
    for j=1:b
        (a/2-i)*(a/2-i)+(b/2-i)*(b/2-i);
        if(((a/2-i)*(a/2-i)+(b/2-j)*(b/2-j))>D0*D0)
            T1(i,j)=0;
        end
    end
end

subplot(1,3,1); imshow(I1,[]); title('Original image');
subplot(1,3,2); imshow(log(1+T1),[]); title('Transformed image');
subplot(1,3,3); imshow(abs(ifft2(T1)),[]); title('Blurred image');