%Filter in the DFT domain by zeroing a
% portion out of the spectrum of the image
close all
A1=imread('BIRD_CAGE.jpg');
A1=im2double(A1);
[M,N]=size(A1);
% Show image
figure
imagesc(A1);colormap(gray)
title('Noisy Image')
% Compute 2-D FFT and shift to center the 2D FFT of the image
fA1=fftshift(fft2(A1));
aA1=abs(fA1);
% Plot magnitude of the FFT
figure
imagesc(aA1);colormap(gray)
title('MAGNITUDE of the 2-D FFT')
% Plot the logarithm of the magnitude
LA1=log10(aA1+1);
figure
imagesc(LA1);colormap(gray)
title('LOG OF MAGNITUDE of the 2-D FFT SIGNAL')
%
% Select the area that we keep from the spectrum of the noisy image
% High_pass
%n1=180;
%n2=220;
%m1=180;
%m2=220;
%
%MM=ones(M,N);
%MM(m1:m2,n1:n2)=0;
%%%%%%%%%%%%%%%%%%%%%%%%
%Low_pass
n1=180;
n2=220;
m1=1;
m2=400;
%
MM=zeros(M,N);
MM(m1:m2,n1:n2)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%
C=MM.*fA1;
cc=log(abs(C)+1);
figure
imagesc(cc); colormap(gray)
title('Fourier Transform of Filtred Image')
%Reconstruct the image by first shifting back (fftshift) and then taking the real part of the %inverse
2-D FFT
C=fftshift(C);
IC=real(ifft2(C));
%If C contains the image
figure
imagesc(IC);colormap(gray)