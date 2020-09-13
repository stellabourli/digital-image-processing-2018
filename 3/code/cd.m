pkg load image
%diavazw thn eikona
Image = imread('cameraman-noise.jpg');
figure;
imagesc(Image);colormap(gray);
title('Image')
%diastaseis eikonas
[m,n] = size(Image);
imhist(Image)
%katwfli
k = 90;
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
S1 = strel('line',3,0);
%sustolh
Image2 = imdilate(Image,S1);
figure;
imagesc(Image2);colormap(gray);
title('Line structuring element');
%domiko stoixeio
S2 = strel('line',3,0);
%diastolh
Image2 = imerode(Image,S2);
figure;
imagesc(Image2);colormap(gray);
title('Line structuring element');