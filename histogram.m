I=imread('cameraman','tif');
hash=zeros(255,1);
val=zeros(255,1);
for i=1:256
    for j=1:256
         hash(I(i,j)+1)=hash(I(i,j)+1)+1;
    end
end

plot(hash);
