sz=input('Enter size: ');
A=ones(sz,sz);

for i=2:size(A,1)
    for j=2:size(A,2)
        A(i,j)=complex(cos((2*pi*(i-1)*(j-1))/sz),cos((2*pi*(i-1)*(j-1))/sz));
    end
end
B=zeros(sz,sz);
s=1;
for i=1:sz
    for j=1:sz
        B(:,:,s)=A(:,i)*A(:,j)';
        s=s+1;
    end
end


Br=real(B);
Bi=imag(B);


        

 




