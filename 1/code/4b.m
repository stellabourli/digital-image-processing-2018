pkg load image
%diavazw thn eikona
I = imread('BrightLena.jpg');
%upologizw to mege8os ths eikonas
[m,n] = size(I);
%emfanizw to istogramma ths eikonas
%imhist(I);
%efarmozw isostathmish istogrammatos
J = histeq(I);
%emfanizw to neo istogramma
%imhist(J)
%efarmozw grammiko metasxhmatismo
ImageNewB = zeros(m,n);
for i = 1:1:m
 for j = 1:1:n
 ImageNewB(i,j) = I(i,j)*0.4+5;
 end
end
ImageNewB = uint8(ImageNewB);
%isostathmizw kai emfanizw to neo istogramma
imhist(histeq(ImageNewB));
%emfanizw th nea eikona
figure; imshow(ImageNewB);