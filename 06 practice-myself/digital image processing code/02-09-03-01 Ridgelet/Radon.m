    %% Radon Transform  

    
    srcImage=imread('test.png');  
    grayImage=rgb2gray(srcImage);  
    cannyImage=edge(grayImage,'canny');  
      
    theta=0:180;  
    [R,x]=radon(cannyImage,theta);  
    figure,imagesc(theta,x,R);   
    title('R_theta X');   
    xlabel('theta(degree)');   
    ylabel('X\prime');   
    colormap(hot);    
    colorbar;  
      
