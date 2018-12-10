I=im2double(imread('pout','tif'))

min1=min(min(I));
max1=max(max(I));

Io=0+(I-min1)*(1)/(max1-min1);

subplot(2,2,1); imshow(I,[]); title('original');
subplot(2,2,2); imshow(Io,[]); title('Contrast_stretched');
subplot(2,2,3); imhist(I); title('original histogram');
subplot(2,2,4); imhist(Io); title('Contrast stretched histogram');
