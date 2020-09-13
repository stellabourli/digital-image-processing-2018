function ImageOut = ImageLaplacian(ImageIn)
 %diavazw thn eikona
 ImageArray = imread(ImageIn);
 ImageArray = double(ImageArray);
 %upologizw to mege8os ths eikonas
 [m,n] = size(ImageArray);
 %dhmiourgw th laplacian eikona
 ImageLapl = zeros(m,n);
 for i = 2:1:m-1
 for j = 2:1:n-1
 %upologizw th deuterh paragwgo gia ton aksona x
 xgrad2 = ImageArray(i+1,j) + ImageArray(i-1,j) - 2*ImageArray(i,j);
 %upologizw th deuterh paragwgo gia ton aksona y
 ygrad2 = ImageArray(i,j+1) + ImageArray(i,j-1) - 2*ImageArray(i,j);
 %upologizw to athroisma tous
 ans = xgrad2 + ygrad2;
 %to apo8hkeuw sto antistoixo pixel ths telikhs eikonas
 ImageLapl(i-1,j-1) = ans;
 end
 end
 %sumplhrwnw thn teleutaia grammh
 for i = 1:1:n
 ImageLast(m,i) = ImageArray(m,i);
 end
 %sumplhrwnw thn teleutaia sthlh
 for i = 1:1:m
 ImageLast(i,n) = ImageArray(i,n);
 end
 %emfanizw th laplacian eikona
 colormap(gray);
 imagesc(ImageLapl);
 %afairw th laplacian eikona apo thn arxikh gia na prokupsei h telikh
 ImageLast = ImageArray - ImageLapl;
 %epistrefw to apotelesma
 ImageOut = ImageLast;
endfunction