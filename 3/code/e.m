pkg load image
%diavazw thn eikona
Image = imread('circles.jpg');
figure;
imagesc(Image);colormap(gray);
title('Image')
%diastaseis eikonas
[m,n] = size(Image);
imhist(Image)
%katwfli
k = 115;
%binary image
for i=1:1:m
 for j=1:1:n
 if Image(i,j) < k
 Image(i,j) = 0;
 else
 Image(i,j) = 1;
 end
 end
end
figure;
imagesc(Image);colormap(gray);
title('Binary Image');
%domiko stoixeio
S2 = strel('disk',8,0);
%sustolh
Image2 = imdilate(Image,S2);
figure;
imagesc(Image2);colormap(gray);
title('Disk structuring element');