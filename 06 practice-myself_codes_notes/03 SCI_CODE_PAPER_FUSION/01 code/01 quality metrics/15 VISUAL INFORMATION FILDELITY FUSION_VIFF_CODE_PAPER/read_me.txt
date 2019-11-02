1 主文件vifvec一定要使用一维图像 而且比如PET和MRI 融合之后图像 
参数选择上 一定要选择img2也是彩色的 result也是彩色的
vif(i)=vifvec(img2(:,:,i),result(:,:,i))
2 运行一定要使用哪个工具箱 工具箱下载地址
https://www.cns.nyu.edu/~lcv/software.php