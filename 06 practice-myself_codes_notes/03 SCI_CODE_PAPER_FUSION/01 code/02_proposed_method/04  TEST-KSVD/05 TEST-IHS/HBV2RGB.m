function img=HBV2RGB(H,S,V)
%注意：show的话就是imshow(img);而不是imshow(uint8(img),[]);
[m,n]=size(H);
img=zeros(m,n,3);
for i=1:m
    for j=1:n
        h=floor(H(i,j)/60);
%         h=floor(80/60);h=1;
        %下取整是直接取按照数轴上最接近要求值的左边值
        f=H(i,j)/60-h;
        v=V(i,j);
        s=S(i,j);
        p=v*(1-s);
        q=v*(1-f*s);
        t=v*(1-(1-f)*s);

        if h==0
            R(i,j)=v;G(i,j)=t;B(i,j)=p;
        elseif h==1
            R(i,j)=q;G(i,j)=v;B(i,j)=p;            
        elseif h==2
            R(i,j)=p;G(i,j)=v;B(i,j)=t;            
        elseif h==3
            R(i,j)=p;G(i,j)=q;B(i,j)=v;            
        elseif h==4
            R(i,j)=t;G(i,j)=p;B(i,j)=v;            
        elseif h==5
            R(i,j)=v;G(i,j)=p;B(i,j)=q;            
        end
    end
end

%%如果正反变换都没错的话，那么图像是不变的
img(:,:,1)=R;
img(:,:,2)=G;
img(:,:,3)=B;
end