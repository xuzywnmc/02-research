function [OUTPUT,FORRI,AA,BB]=RGB2IHS(input)
[M,N,Q]=size(input);
OUTPUT=zeros(M,N,Q);
FORRI=zeros(M,N,Q);
v11=zeros(3,1);
% AA=[1/3,1/3,1/3;       
%     -sqrt(2)/6,-sqrt(2)/6,-2*(sqrt(2)/6);                    %RGB��>IHS���任����
%     1/sqrt(2),-1/sqrt(2),0];
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BB=[1,-1/sqrt(2),1/sqrt(2);
%     1,-1/sqrt(2),-1/sqrt(2);                    %IHS->RGB��任����
%     1,sqrt(2),0];
AA=[1/sqrt(3),1/sqrt(3),1/sqrt(3);       
    1/sqrt(6),1/sqrt(6),-2/sqrt(6);                    %RGB��>IHS���任����
    1/sqrt(2),-1/sqrt(2),0];
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
BB=[1/sqrt(3),1/sqrt(6),1/sqrt(2);
    1/sqrt(3),1/sqrt(6),-1/sqrt(2);                    %IHS->RGB��任����
    1/sqrt(3),-2/sqrt(6),0];
    for i=1:M
        for j=1:N
            v11(1)=double(input(i,j,1));
            v11(2)=double(input(i,j,2));
            v11(3)=double(input(i,j,3));
            u1=AA*v11; 
            
%             OUTPUT(i,j,1)=u1(1);
%             OUTPUT(i,j,2)=1/(tan(u1(3)/u1(2)));
%             OUTPUT(i,j,3)=sqrt(u1(2)^2+u1(3)^2);
            OUTPUT(i,j,1)=u1(1);
            OUTPUT(i,j,2)=u1(2);
            OUTPUT(i,j,3)=u1(3);
            u2=BB*u1;
            FORRI(i,j,1)=u2(1);
            FORRI(i,j,2)=u2(2);
            FORRI(i,j,3)=u2(3);
        end
    end
end