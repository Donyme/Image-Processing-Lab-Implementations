I1=im2double(imread('pout','tif'));
I2=im2double(imread('tire','tif'));

I1n=1-I1;
I2n=1-I2;
subplot(3,2,1);imshow((I1n));title("negative pout");
subplot(3,2,2);imshow((I2n));title("negative tire");

c=input('Enter constant value for log tranformation: ');

I1log=c*log10(I1);
I2log=c*log10(I2);

subplot(3,2,3);imshow(I1log,[]);title("logarithm pout");
subplot(3,2,4);imshow(I2log,[]);title("logarithm tire");

c=input('Enter constant value for power law transform :');
y=input('Enter gamma value: ');

I1power=c*(1+power(I1,y));
I2power=c*(1+power(I2,y));

subplot(3,2,5);imshow(I1power,[]);title("power law pout");
subplot(3,2,6);imshow(I2power,[]);title("power law tire");






