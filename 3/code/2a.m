pkg load image
%diavazw thn eikona
Image = imread('circle-square-binary.bmp');
figure;
imagesc(Image);colormap(gray);
title('Image');
%i)tetragwno domiko stoixeio
S1 = strel('square',32);
%diastolh
Image2 = imerode(Image,S1);
figure;
imagesc(Image2);colormap(gray);
title('Square structuring element');
%ii) diskos domiko stoixeio
S2 = strel('disk',32,0);
%diastolh
Image2 = imerode(Image,S2);
figure;
imagesc(Image2);colormap(gray);
title('Disk structuring element');
