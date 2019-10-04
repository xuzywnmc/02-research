function [fr,fc]=getf2d(sca)

%%%get filter fr=H0*H0'*H1*H1'*....*Grm%%%%%%%%%
%%%get filter fc=H0*H0'*H1*H1'*....*Gcm%%%%%%%%%

%sca----scale number
%fr-----fr(i,:,:) is the row filter of scale i, i=1,2,...,sca
%fc-----fc(i,:,:) is the colum filter of scale i, i=1,2,...,sca

h=zeros(1,256);
h(128)=1;
h=conv2(h,h');

for i=0:sca-1
   tfr=conv2(h,getg(i));
   tfr=tfr(:,128:127+256);
   fr(i+1,:,:)=tfr;
   tfc=conv2(h,getg(i)');
   tfc=tfc(128:127+256,:);
   fc(i+1,:,:)=tfc;

   h=conv2(h,geth(i));
   h=h(:,128:127+256);
   h=conv2(h,geth(i)');
   h=h(128:127+256,:);
end
