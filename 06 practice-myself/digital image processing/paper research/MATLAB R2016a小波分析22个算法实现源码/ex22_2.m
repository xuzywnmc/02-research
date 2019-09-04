clear;
%װ��ԭͼ��1
load woman;
I=X;

%С������
type = 'db1';

% 2ά��ɢDaubechiesС���任
[CA1, CH1, CV1, CD1] = dwt2(I,type);
C1 = [CH1 CV1 CD1];

%ϵ�������С
[length1, width1] = size(CA1);
[M1, N1] = size(C1);

% ������ֵT1 
T1 =50;
alpha = 0.2;

%��ͼ���м���ˮӡ
for counter2 = 1: 1: N1
   for counter1 = 1: 1: M1
      if( C1(counter1, counter2) > T1 )   
         marked1(counter1,counter2) = randn(1,1);
         NEWC1(counter1, counter2) = double( C1(counter1, counter2) ) +alpha * abs( double( C1(counter1, counter2) ) ) * marked1(counter1,counter2) ;      
      else
         marked1(counter1, counter2) = 0;
         NEWC1(counter1, counter2) = double( C1(counter1, counter2) );
      end; 
   end;
end;

%�ع�ͼ��
NEWCH1 = NEWC1(1:length1, 1:width1);
NEWCV1 = NEWC1(1:length1, width1+1:2*width1);
NEWCD1 = NEWC1(1:length1, 2*width1+1:3*width1);

R1 = double( idwt2(CA1, NEWCH1, NEWCV1, NEWCD1, type) );

%����ˮӡ
watermark1 = double(R1) - double(I);

figure(1);
subplot(1,2,1);
image(I);
axis('square');
title('ԭʼͼ��');
subplot(1,2,2);
imshow(R1/250);
axis('square');
title('DaubechiesС���任��ͼ��');

figure(2);
imshow(watermark1*10^16);
axis('square');
title('ˮӡͼ��');

% ˮӡ���
newmarked1 = reshape(marked1, M1*N1, 1);
% �����ֵ
T2 = 60;
 for counter2 = 1: 1: N1
   		for counter1 = 1: 1: M1
            if( NEWC1(counter1, counter2) >T2 )
               NEWC1X(counter1, counter2) = NEWC1(counter1, counter2);
            else
               NEWC1X(counter1, counter2) = 0;
            end;
        end;
      end;

NEWC1X = reshape(NEWC1X, M1*N1, 1);

correlation1 = zeros(1000,1);
for corrcounter = 1: 1: 1000
      if( corrcounter == 500)
       correlation1(corrcounter,1) = NEWC1X'*newmarked1 / (M1*N1);
      else
       rnmark = randn(M1*N1,1);
       correlation1(corrcounter,1) = NEWC1X'*rnmark / (M1*N1);
      end;      
end;  

% ������ֵ
originalthreshold = 0;
for counter2 = 1: 1: N1
   		for counter1 = 1: 1: M1
             if( NEWC1(counter1, counter2) > T2 )
               originalthreshold = originalthreshold + abs( NEWC1(counter1, counter2) );
             end;
         end;
  end;
originalthreshold = originalthreshold * alpha / (2*M1*N1);   

corrcounter = 1000;
originalthresholdvector = ones(corrcounter,1) * originalthreshold;

figure(3);
plot(correlation1, '-');
hold on;
plot(originalthresholdvector, '--');
title('ԭʼ�ļ�ˮӡͼ��');
xlabel('ˮӡ');
ylabel('�����Ӧ');
