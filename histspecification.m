A=imread('tire','tif');
A1=imread('cameraman','tif');

%A1=histeq(A);
%B1=histeq(B);



%subplot(1,2,1);imhist(A1);
%subplot(1,2,2);imhist(B1);

%A2=imhist(A1);
%B2=imhist(B1);

B=A;
B1=A1;
C=histeq(A,256);
C1=histeq(A,256);
hash=zeros(1,255);
hash1=zeros(1,255);
p=size(A,1)*size(A,2);
p1=size(A1,1)*size(A1,2);

for i=1:size(A,1)
    for j=1:size(A,2)
         hash(A(i,j)+1)=hash(A(i,j)+1)+1;
    end
end

for i=1:size(A1,1)
    for j=1:size(A1,2)
         hash1(A1(i,j)+1)=hash1(A1(i,j)+1)+1;
    end
end

sum1=zeros(1,255);
sum11=zeros(1,255);
sum2=zeros(1,255);
sum21=zeros(1,255);
sum3=zeros(1,255);
sum31=zeros(1,255);

sum1(1)=hash(1);
sum11(1)=hash1(1);

for i=2:255
    sum1(i)=sum1(i-1)+hash(i);    
    sum11(i)=sum11(i-1)+hash1(i);    
end

max1=max(max(A));
max11=max(max(A1));

for i=1:255
    sum2(i)=double(sum1(i)/p); 
    sum21(i)=double(sum11(i)/p1); 
    sum3(i)=floor(sum2(i)*max1);
    sum31(i)=floor(sum21(i)*max11);
end

for i=1:size(B,1)
    for j=1:size(B,2)
        B(i,j)=sum3(A(i,j)+1);
    end
end

for i=1:size(B1,1)
    for j=1:size(B1,2)
        B1(i,j)=sum31(A1(i,j)+1);
    end
end

sum4=zeros(1,255);

for i=1:255
    min1=0;
    for j=1:255
        if(sum3(i)==sum31(j))
            sum4(i)=j;
        end    
    end
end

M=A;
for i=1:size(A,1)
    for j=1:size(A,2)
        M(i,j)=sum4(A(i,j)+1);
    end
end
 

subplot(3,2,1); imhist(A); title('Input image histogram');
subplot(3,2,2); imshow(A); title('Input Image');
subplot(3,2,3); imhist(A1); title('Target Image histogram');
subplot(3,2,4); imshow(A1); title('Target Image');
subplot(3,2,5); imhist(M); title('Output Image Histogram');
subplot(3,2,6); imshow(M); title('Output Image');

