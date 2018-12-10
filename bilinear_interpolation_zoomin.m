I=imread('cameraman','tif');
n=input('Enter magnification');
A=zeros(256*n,256*n);
j=1;
i=1;
while(i<=255*n)
    for k=i:i+n-1 
          A(k,1:256)=I(j,:)+(((I(j+1,:)-I(j,:))/n)*(k-i));
    end    
    i=i+n;
    j=j+1;  
end


i=1;    
j=1;
B=A;
while(j<=255*n)
    for l=j:j+n-1
        A(:,l)=B(:,i)+(((B(:,i+1)-B(:,i))/n)*(l-j));    
    end    
    j=j+n;
    i=i+1;
end    
imshow(uint8(A));
