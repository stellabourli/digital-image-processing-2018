pkg load image
%diavazw thn eikona
I = imread('DarkLena.jpg');
%upologizw to mege8os ths eikonas
[m,n] = size(I);
%emfanizw to istogramma ths eikonas
%imhist(I);
%efarmozw isostathmish istogrammatos
J = histeq(I);
%emfanizw to neo istogramma
%imhist(J)
%efarmozw grammiko metasxhmatismo
ImageNewD = zeros(m,n);
for i = 1:1:m
 for j = 1:1:n
 ImageNewD(i,j) = I(i,j)*4+5;
 end
end
ImageNewD = uint8(ImageNewD);
%isostathmizw kai emfanizw to neo istogramma
imhist(histeq(ImageNewD));
%emfanizw th nea eikona
figure; imshow(ImageNewD);