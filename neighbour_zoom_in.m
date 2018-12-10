I=imread('cameraman','tif');
n=input('Enter magnification');
A=zeros(256*n,256*n);
j=1;
i=1;
while(i<=256*n)
    for k=i:i+n 
        A(k,1:256)=I(j,:);
    end
    i=i+n;
    j=j+1;  
end

i=1;    
j=1;
B=A;
while(j<=256*n)
    for l=j:j+n
        A(:,l)=B(:,i);
    end    
    j=j+n;
    i=i+1;
end    

imshow(uint8(A));