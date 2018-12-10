I=imread('pout','tif');
c=input('Enter the required gray Level: ');
B=I;
for i=1:size(I,1)
    for j=1:size(I,2)
        if(I(i,j)==c)
            B(i,j)=255;
        else
            B(i,j)=0;
        end
    end
end

imshow(B,[]);