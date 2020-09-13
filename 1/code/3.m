pkg load image signal
%diavazw thn eikona
Image = imread('Barbara_2dwn.png');
%dhmiourgw thn kainouria eikona
ImageNew = zeros(256,256);
%pros8etw ta katallhla stoixeia sth nea eikona
k=1;
l=1;
for i = 1:1:256
 for j = 1:1:256
 ImageNew(i,j) = Image(k,l);
 l += 2;
 end
 l = 1;
 k += 2;
end
%tupwnw thn eikona kai thn apo8hkeuw
colormap(gray);
imagesc(ImageNew);
imwrite (ImageNew,gray(256),'Barbara_1_2dwn.png');
%dhmiourgw thn eikona pou tha einai anakataskeuh ths prohgoumenhs
ImageNew2 = zeros(512,512);
%pros8etw osa stoixeia uparxoun stis katallhles 8eseis
k=1;
l=1;
for i = 1:2:512
 for j = 1:2:512
 if mod(i,2) == 1
 if mod(j,2) == 1
 ImageNew2(i,j) = ImageNew(k,l);
 l += 1;
 end
 end
 end
 l=1;
 k += 1;
end
%pros8etw sta stoixeia pou leipoun to geitoniko tous
for i = 1:1:512
 for j = 1:1:512
 if mod(i,2) == 1
 if mod(j,2) == 0
 ImageNew2(i,j) = ImageNew2(i,j-1);
 end
 elseif mod(i,2) == 0
 if mod(j,2) == 1
 ImageNew2(i,j) = ImageNew2(i-1,j);
 elseif mod(j,2) == 0
 ImageNew2(i,j) = ImageNew2(i-1,j-1);
 end
 end
 end
end
%tupwnw thn anakataskeuasmenh eikona kai thn apo8hkeuw
colormap(gray);
imagesc(ImageNew2);
imwrite (ImageNew2,gray(256),'Barbara_1_2dwn_up2.png');
%upologizw to mse
squaredErrorImage = (double(Image)-double(ImageNew2)).^ 2;
mse = sum(sum(squaredErrorImage)) / (512 * 512);
mse
