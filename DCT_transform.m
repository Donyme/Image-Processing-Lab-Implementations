A=double(imread('cameraman.tif'));
A=imresize(A,[100,100]);
m=size(A,1);
n=size(A,2);
B=zeros(m,n);


for i=1:m
    for j=1:n
        if(i==1)
           ap=1/sqrt(m);
        else
            ap=sqrt(2/m);
        end
        if(j==1)
            bp=1/sqrt(n);
        else
            bp=sqrt(2/n);
        end 
        sum=0;
        for k=1:m
            for l=1:n
                sum=sum+A(k,l)*cos((pi)*(2*(k-1)+1)*(i-1)/(2*m))*cos((pi)*(2*(l-1)+1)*(j-1)/(2*n));
            end
        end
        B(i,j)=ap*bp*sum;
    end
end

ip=input('Enter the number of coeffs');
final=zeros(m,n);

for h=1:ip
    [Y,I1]=max(max(abs(B)));
    [J,I2]=max(abs(B(:,I1)));
    final(I2,I1)=abs(B(I2,I1));
    B(I2,I1)=0;
end

C=zeros(m,n);

for i=1:m
    for j=1:n
        sum=0;
        for k=1:m
            for l=1:n
                if(k==1)
                   ap=1/sqrt(m);
                else
                    ap=sqrt(2/m);
                end
                if(l==1)
                    bp=1/sqrt(n);
                else
                    bp=sqrt(2/n);
                end 
                sum=sum+ap*bp*final(k,l)*cos((pi)*(2*(i-1)+1)*(k-1)/(2*m))*cos((pi)*(2*(j-1)+1)*(l-1)/(2*n));
            end
        end
        C(i,j)=sum;
    end
end


subplot(1,2,1); imshow(A,[]); title('Input image');
subplot(1,2,2); imshow(C,[]); title('Reconstructed image');

