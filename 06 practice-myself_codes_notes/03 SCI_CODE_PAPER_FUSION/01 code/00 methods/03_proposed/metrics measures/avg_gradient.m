function outval = avg_gradient(img) 
% ƽ���ݶȣ�Ҳ��Ϊ�����ȣ���ӳ��ͼ���е�΢Сϸ�ڷ���������仯������ͬʱҲ��ӳ��ͼ��������ȣ�Խ��Խ����
 
if nargin == 1 
    img = double(img); 
    % Get the size of img 
    [r,c,b] = size(img); 
     
    dx = 1; 
    dy = 1; 
    for k = 1 : b 
        band = img(:,:,k); 
        [dzdx,dzdy] = gradient(band,dx,dy); 
        s = sqrt((dzdx .^ 2 + dzdy .^2) ./ 2); 
        g(k) = sum(sum(s)) / ((r - 1) * (c - 1)); 
    end 
    outval = mean(g); 
else 
    error('Wrong number of input!'); 
end
