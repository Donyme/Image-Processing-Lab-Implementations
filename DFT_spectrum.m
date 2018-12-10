I=double(imread('cameraman.tif'));
%I=imresize(I,[100,100]);
m=size(I,1);
n=size(I,2);

A=ones(m,n);

for i=1:size(A,1)
    for j=1:size(A,2)
        A(i,j)=complex(cos((2*pi*(i-1)*(j-1))/n),sin((2*pi*(i-1)*(j-1))/n));
    end
end


DFT=A*I*A';
DFT1=(fftshift(log(1+abs(DFT))));
DFT2=fftshift(angle(DFT));

B=inv(A);
U=B*DFT*B';


subplot(2,2,1); imshow(DFT1,[]); title('Value');
subplot(2,2,2); imshow(DFT2,[]); title('Angle');
subplot(2,2,3); imshow(I,[]); title('Original image');
subplot(2,2,4); imshow(U,[]); title('Reconstructed image');


