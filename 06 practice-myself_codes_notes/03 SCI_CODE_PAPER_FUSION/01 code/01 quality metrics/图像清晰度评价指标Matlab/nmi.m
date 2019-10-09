
function nmimi 
%NMI Normalized mutual information
[name,path]=uigetfile({'*.*','请选择原图像'},'请打开原图像');
file1=strcat(path,name);
[name,path]=uigetfile({'*.*','请选择融合图像F'},'请打开融合图像F');
file2=strcat(path,name);
A=imread(file1);
F=imread(file2);
if size(A,3)==3
    A=rgb2gray(A);
end
if size(F,3)==3
    F=rgb2gray(F);
end
A = double(A);
F = double(F);

if length( A ) ~= length( F)
    error('length( A ) must == length( F)');
end
total = length(A);
A_ids = unique(A);
F_ids = unique(F);

% Mutual information
MI = 0;
m=size(A_ids);
n=size(F_ids);
for s = 1:m
    for t =1:n
         idAOccur = find( A == A_ids(s) );
         idFOccur = find( F == F_ids(t) );
         idAFOccur = intersect(idAOccur,idFOccur); 
         
         px = length(idAOccur)/total;
         py = length(idFOccur)/total;
         pxy = length(idAFOccur)/total;
         
         MI = MI + pxy*log2(pxy/(px*py)+eps); % eps : the sma

    end
end

% Normalized Mutual information
Hx = 0; % Entropies
for  s = 1:m
    idAOccurCount = length( find( A == A_ids(s) ) );
    Hx = Hx - (idAOccurCount/total) * log2(idAOccurCount/total + eps);
end
Hy = 0; % Entropies
for t =1:n
    idFOccurCount = length( find( F == F_ids(t) ) );
    Hy = Hy - (idBOccurCount/total) * log2(idBOccurCount/total + eps);
end

MIhat = 2*MI/(Hx+Hy)





