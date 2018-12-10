I=imread('cameraman','tif');
n=input('Enter magnification');
n=round(1/n);
A=ones(256,256/n);
j=1;
a=1;b=1;
for i=1:256
    for j=1:256/n
        A(i,j)=I(i,n*j);
        
    end
end   
B=ones(256/n,256/n);

for j=1:256/n
    for i=1:256/n
        B(i,j)=A(i*n,j);        
    end
end

imshow(uint8(B));