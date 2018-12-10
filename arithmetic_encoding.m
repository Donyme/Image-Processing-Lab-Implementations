pixels={'a','b','c','d'};
probabilities=[0.4 0.2 0.1 0.3];
lo=zeros(1,size(pixels,2));
hi=ones(1,size(pixels,2));

for i=1:size(pixels,2)
    if(i~=1)
        lo(i)=lo(i-1)+probabilities(i-1);
     end
    if(i~=size(pixels,2))
        hi(i)=lo(i)+probabilities(i);
    end
end


index=[4,1,4];
val=lo(index(1));
lo_r=val;
hi_r=hi(index(1));
range=hi_r-lo_r;

for i=2:size(index,2)
    val=lo_r+range*hi(index(i));
    lo_r=lo_r+lo(index(i))*range;
    hi_r=val;
    range=hi_r-lo_r;
end

tag=(lo_r+hi_r)/2;

ntag=tag;
    
for i=1:size(index,2)
    for j=1:size(pixels,2)
        if(ntag<hi(j))
            disp(j);
            ntag=(tag-lo(j))/(hi(j)-lo(j));
            break;
        end
    end
end