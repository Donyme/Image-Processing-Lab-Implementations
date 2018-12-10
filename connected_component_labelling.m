I=imread('X.png');
I1=rgb2gray(I);


I1(I1~=195)=0;

bw=1-imbinarize(I1);
label=zeros(size(bw));


count1=1;
for i=1:size(bw,1)
    for j=1:size(bw,2)
        if(bw(i,j)==1)
            if(bw(i-1,j)==0 && bw(i,j-1)==0)
                label(i,j)=count1;
                count1=count1+1;
            elseif(bw(i-1,j)==1 && bw(i,j-1)==1)
               if(label(i-1,j)==label(i,j-1))
                   label(i,j)=label(i-1,j);
               else
                   p1=min(label(i-1,j),label(i,j-1));
                   p2=max(label(i-1,j),label(i,j-1));
                   label(i,j)=p1;
                   label(label==p2)=p1;
               end
            elseif(bw(i-1,j)==1)
                label(i,j)=label(i-1,j);
            elseif(bw(i,j-1)==1)
                label(i,j)=label(i,j-1);
                
            end
        end
            
    
    end
    
end

vec=unique(label);

p=0;
for i=1:size(vec,1)
    label(label==vec(i))=p;
    p=p+1;
end
    

%imshow(label);
subplot(1,2,1); imshow(I,[]); title('Input image');
subplot(1,2,2); imshow(label2rgb(label),[]); title('Output Image');




        

