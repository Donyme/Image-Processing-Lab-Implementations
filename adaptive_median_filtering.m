I = imread('cameraman.tif');
J = imnoise(I,'salt & pepper',0.05);
I_noise = J;
Smax = input('Enter the max window size');



for i=2:size(I,1)-2
    for j=2:size(I,2)-2
        temp = 1;
         l = -1;
            r = 1;
        while(temp)
           
            z = 1;
            A = zeros(1,(r-l+1)*(r-l+1));
            for x=l:r
                for y=l:r
                    A(z) = J(i+x,j+y);
                  
                    z = z + 1;               

                end
            end
            A1 = median(A) - min(A);
            A2 = median(A) - max(A);

            if(A1>0 && A2<0)
                B1 = J(i,j) - min(A);
                B2 = J(i,j) - max(A);
                if(~(B1>0 && B2<0))
                    J(i,j) = median(A);
                end
                temp = 0;                
            else
                r = r + 1;
                if((i+l) > 1 && (j+l) > 1)
                    l = l - 1;
                end
                if(2*r + 1 > Smax)
                    temp = 0;
                end                    
                    
            end
        end
        
    end
end
    





subplot(1,3,1);imshow(I,[]); title('Original Image');
subplot(1,3,2); imshow(I_noise,[]); title('Noisy Image');
subplot(1,3,3); imshow(J,[]); title('Restored image');