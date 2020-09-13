pkg load image
%diavazw thn eikona
Image = imread('square-circle-binary.bmp');
figure;
imagesc(Image);colormap(gray);
title('Image');
%i)tetragwno domiko stoixeio
S1 = strel('square', 24);
%sustolh
Image2 = imdilate(Image,S1);
figure;
imagesc(Image2);colormap(gray);
title('Square structuring element');
%ii) diskos domiko stoixeio
S2 = strel('disk',24,0);
%sustolh
Image2 = imdilate(Image,S2);
figure;
imagesc(Image2);colormap(gray);
title('Disk structuring element');