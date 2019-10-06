function U = PCNN(IMA,IMB)
% IMA=double(imread('1.png'));
% IMB=double(imread('2.png'));
 
[ROW,COL]=size(IMA);
[ROW1,COL1]=size(IMB);
 
if(ROW~=ROW1|COL~=COL1)
    error('input images should be the same size!');
end 
 
%%%% SET THE mPCNN PARAMEERS [7 IN TOTAL]
%%%% W=M; BETA1=BETA2; DELTA; ALPHAT; VT;
BETA=0.5;     %%% note BETA1=BETA2; SO WE USE BETA FOR CONVENIENCE
M=[0.707,1,0.707;1,0,1;0.707,1,0.707];
DELTA=1;
ALPHAT=0.012;
VT=4000;          %%% MAKE SURE WHETHER THIS IS RIGHT.
%%%%%
 
IMAWT=conv2(IMA,M,'same'); %%% ����󱣳�Դͼ���С��
IMBWT=conv2(IMB,M,'same');
SUMPIXEL=ROW*COL; %%% PIXELS NUMBER OF FUSED IMAGE
JUDFIR=zeros(ROW,COL); %%% JUDFIR IS USED TO JUDGE WHETHER THE NEURON(I,J) IS FIRED
                  %%%JUDFIR�����ж���Ԫ��i��j���Ƿ񼤷���ÿ����Ԫ�����еĵ�����ֻ����һ�Ρ�
THR=500*ones(ROW,COL);     %%% ��֪����ֵ�Ƿ����
U=zeros(ROW,COL);
%%% ITERATION
ITETIME=10;      %%% SET ITERATION TIME
for(itime=1:10)
for(i=1:ROW)
   for(j=1:COL)
       if(JUDFIR(i,j)~=1)   %%% THE NEURON SHOULD NOT BE FIRED YET.
       %%% �Ե�����е�������
       HA=IMAWT(i,j)+IMA(i,j);
       HB=IMBWT(i,j)+IMB(i,j);
       U(i,j)=(1+BETA*HA)*(1+BETA*HB)+DELTA;
       %%%�ж��Ƿ񼤷�
       if (U(i,j)>THR(i,j)) %% ���������򼤷�
           JUDFIR(i,j)=1;
       else             %% ������������ֵ����˥��
           THR(i,j)=THR(i,j)*exp(-ALPHAT);
       end
       end   %%% end of JUDFIR
 
   end %%% end j
end     %%% end i
       if(sum(sum(JUDFIR))==SUMPIXEL)
           fprintf(1,'fused successfully');
           break 
       end     
end    %%% end itime
 
U=U/max(max(U))*255;

% figure;imshow(uint8(U));
% imwrite(uint8(U),'U.gif');
%end %%% end of function