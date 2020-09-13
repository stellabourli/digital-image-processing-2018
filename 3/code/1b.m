pkg load image
%diavazw thn eikona
Image = imread('lena.jpg');
Image = double(Image);
figure;
imagesc(Image);colormap(gray);
title('Image');
%efarmozw paramorfwsh
H = fspecial('motion',15,45);
[m,n] = size(Image);
%upologismos Hf
[k,l] = size(H);
%metro tou Fourier tou filtrou
figure;
imagesc(abs(fft2(H)));colormap(gray);
title('');
new_H = zeros(m,n);
new_H(1:k,1:l) = H(1:k,1:l);
Hf1 = (fft2(new_H)).*(fft2(Image));
Hf = real(ifft2(Hf1));
figure;
imagesc(Hf);colormap(gray);
title('Blurry image (Hf)');
%upologizw to s ths kanonikhs katanomhs gia SNR = 40dB
sum = 0;
mo = mean2(Image);
for i=1:1:m
 for j=1:1:n
 sum += (Image(i,j) - mo)^2;
 end
end
s = sqrt(((1/(m*n))*sum) / (10^(40/10)));
%8orubos
noise = randn(s);
%upologismos Qf
L = [-4 1 1;
 1 0 0;
 1 0 0];
%metro tou Fourier tou Laplacian filtrou
figure;
imagesc(abs(fft2(L)));colormap(gray);
title('');
new_L = zeros(m,n);
new_L(1:1:3,1:1:3) = L(1:1:3,1:1:3);
Qf1 = fft2(new_L).*fft2(Image);
Qf = real(ifft2(Qf1));
figure;
imagesc(Qf);colormap(gray);
title('Image with Laplacian filtering (Qf)');
%upologismos g
[a,b] = size(noise);
[x,y] = size(Hf);
new_noise = zeros(m,n);
pad_Hf = zeros(m,n);
new_noise(1:1:a,1:1:b) = noise(1:1:a,1:1:b);
pad_Hf(1:x,1:y) = Hf(1:x,1:y);
g = pad_Hf + new_noise;
figure;
imagesc(g);colormap(gray);
title('Image with noise (g)');
%upologismos filtrou
lamda = 1;
new_H = zeros(256,256);
new_H(1:1:21,1:1:21) = H(1:1:21,1:1:21);
F = ((conj(fft2(new_H)))./(((abs(fft2(new_H))).^2) .+ lamda.*((abs(fft2(new_L))).^2))).*fft2(g);
figure;
imagesc(real(ifft2(F)));colormap(gray);
title('Last image');