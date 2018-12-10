A=imread('tire','tif');
B=A;
C=histeq(A,256);
hash=zeros(1,255);
p=size(A,1)*size(A,2);

for i=1:size(A,1)
    for j=1:size(A,2)
         hash(A(i,j)+1)=hash(A(i,j)+1)+1;
    end
end

sum1=zeros(1,255);
sum2=zeros(1,255);
sum3=zeros(1,255);

sum1(1)=hash(1);

for i=2:255
    sum1(i)=sum1(i-1)+hash(i);    
end
max1=max(max(A));
for i=1:255
    sum2(i)=double(sum1(i)/p); 
    sum3(i)=floor(sum2(i)*max1);
end

for i=1:size(B,1)
    for j=1:size(B,2)
        B(i,j)=sum3(A(i,j)+1);
    end
end

subplot(3,2,1); imshow(A); title('Original');
subplot(3,2,2); imhist(A); title('Original');
subplot(3,2,3); imshow(C); title('histeq');
subplot(3,2,4); imhist(C); title('histeq');
subplot(3,2,5); imshow(B); title('Histogram equalized');
subplot(3,2,6); imhist(B); title('Histogram equalized');




