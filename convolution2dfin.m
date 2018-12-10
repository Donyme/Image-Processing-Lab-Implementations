x=[1 4 1;2 5 3];
h=[1 1;1 -1];

n1=size(x,1)+size(h,1)-1;
n2=size(x,2)+size(h,2)-1;

xnew=zeros(n1,n2);
xnew(1:size(x,1),1:size(x,2))=x;

hnew=zeros(n1,n2);
hnew(1:size(h,1),1:size(h,2))=h;

hdash=reshape(hnew.',1,[]);
hdash=hdash';

xt=reshape(xnew.',1,[]);
xt=xt';

bttb=zeros(n1*n2,n1*n2);
bttb(:,1)=xt;

for i=2:size(bttb,2)
    for j=1:size(bttb,1)
        if(j==1)
            bttb(j,i)=bttb(size(bttb,1),i-1);
        else
            bttb(j,i)=bttb(j-1,i-1); 
        end
    end
end

final=bttb*hdash;
result=reshape(final',[n2,n1]);
result'


