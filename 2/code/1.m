%diavazw thn eikona
Image = imread('BIRD_CAGE.jpg');
%pairnw ton 2d dft ths eikonas
F = fft2(Image);
%pairnw to metro tou dft
FA=abs(F);
%to emfanizw
figure
imagesc(FA); colormap(gray)
%pairnw to logarithmo tou metrou
L = log(FA+eps);
%to emfanizw
figure
imagesc(L); colormap(gray);
%kentrarw ton dft
F2=fftshift(F);
%pairnw to metro tou kentrarismenou dft
FA=abs(F2);
%to emfanizw
figure
imagesc(FA); colormap(gray)
%pairnw to logarithmo tou metrou
L = log(FA+eps);
%to emfanizw
figure
imagesc(L); colormap(gray);