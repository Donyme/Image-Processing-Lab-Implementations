I=imread('cameraman','tif');
m=size(I,1);
n=size(I,2);

N_v=0.001;
N=zeros(m,n);
N=imnoise(N,'gaussian',0,N_v);
I_v=(std2(I)^2);


k=N_v/I_v;
N_fft=fft2(N);

A=ones(m,n);
DFT=fft2(I);

H=ones(m,n);

for i=1:m
    for j=1:n
        H(i,j)=sin(pi*((i)*0.001+(j)*0.1))*(exp((-1i)*(0.001*i+j*0.1)))/(pi*((i)*0.001+(j)*0.1));
    end
end

G1=zeros(m,n);
G1=(DFT.*H)+N_fft;

deth=det(H);
img_blur=ifft2(G1);
F=zeros(m,n);
for i=1:n
    for j=1:n
        F(i,j)=(H(i,j)*H(i,j))/((H(i,j)*H(i,j))+k);
    end
end

F=G1./H;
F=F.*(((H).^2)./((H).^2 +k));

subplot(2,2,1); imshow(I,[]); title('Original image');
subplot(2,2,2); imshow(img_blur,[]); title('Blurred image');
subplot(2,2,3); imshow(ifft2(F),[]); title('Restored image');
