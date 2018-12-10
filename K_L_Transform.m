I=double(imread('cameraman.tif'));
mu=mean(I,2);

Z=zeros(size(I));
n=size(I,1);

Z=I-mu;

C=zeros(size(I,2),size(I,2));

for j=1:size(I,2)
    C=C+Z(:,j)*(Z(:,j))';
end

C=C/size(I,2);

[V,D]=eig(C);
hash=zeros(n,1);

A=(flip(V,2))';

Y=A*Z;
out=A'*Y+mu;

Y1=A(1,:)*Z;
out1=(A(1,:))'*Y1+mu;
Y10=A(1:10,:)*Z;
out2=(A(1:10,:))'*Y10+mu;
Y20=A(1:20,:)*Z;
out3=(A(1:20,:))'*Y20+mu;
Y50=A(1:50,:)*Z;
out4=(A(1:50,:))'*Y50+mu;

subplot(2,3,1); imshow(I,[]); title('Original image');
subplot(2,3,2); imshow(out,[]); title('Reconstructed full image');
subplot(2,3,3); imshow(out1,[]); title('Reconstructed 1pc image');
subplot(2,3,4); imshow(out2,[]); title('Reconstructed 10pc image');
subplot(2,3,5); imshow(out3,[]); title('Reconstructed 20pc image');   
subplot(2,3,6); imshow(out4,[]); title('Reconstructed 50pc image');