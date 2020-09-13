function ImageOut = ImageGradient(ImageIn)
 %diavazw thn eikona
 imageArray = imread(ImageIn);
 imageArray = double(imageArray);
 %upologizw to mege8os ths eikonas
 [m,n] = size(imageArray);
 %dhmiourgw thn telikh eikona
 ImageLast = zeros(m,n);
 %dhmiourgw thn eikona gia thn prwth paragwgo gia ton aksona x
 ImageX = zeros(m,n);
 %dhmiourgw thn eikona gia thn prwth paragwgo gia ton aksona y
 ImageY = zeros(m,n);
 for i = 1:1:m-1
 for j = 1:1:n-1
 %upologizw thn merikh paragwgo gia ton aksona x
 xgrad = imageArray(i+1,j) - imageArray(i,j);
 ImageX(i,j) = xgrad;
 %upologizw thn merikh paragwgo gia ton aksona y
 ygrad = imageArray(i,j+1) - imageArray(i,j);
 ImageY(i,j) = ygrad;
 %upologizw to metro tous
 ans = sqrt((xgrad^2)+(ygrad^2));
 %to apo8hkeuw sto antistoixo pixel ths telikhs eikonas
 ImageLast(i,j) = ans;
 end
 end
 %sumplhrwnw thn teleutaia grammh
 for i = 1:1:n
 ImageLast(m,i) = imageArray(m,i);
 ImageX(m,i) = imageArray(m,i);
 ImageY(m,i) = imageArray(m,i);
 end
 %sumplhrwnw thn teleutaia sthlh
 for i = 1:1:m
 ImageLast(i,n) = imageArray(i,n);
 ImageX(m,i) = imageArray(m,i);
 ImageY(m,i) = imageArray(m,i);
 end
 %epistrefw to apotelesma
 ImageOut = ImageLast;
%emfanizw thn eikona me xrhsh paragwgou X kai Y
 colormap(gray);imagesc(ImageX);
 colormap(gray);imagesc(ImageY);
endfunction