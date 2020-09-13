function ImageOut = AverageFilter(ImageIn, N)
 %diavazw thn eikona
 imageArray = imread(ImageIn);
 %upologizw to mege8os ths eikonas
 [m,n] = size(imageArray);
 %kanw zero padding sthn eikona
 newExtraSize = (N-1)/2;
 paddingImageArray = zeros(m+(2*newExtraSize), n+(2*newExtraSize));
 for i = 1:1:m
 for j = 1:1:n
 paddingImageArray(i+(newExtraSize),j+(newExtraSize)) = imageArray(i,j);
 end
 end
 %dhmiourgw to filtro
 filter(1:N,1:N) = 1/N;
 %dhmiourgw thn telikh eikona
 ImageLast = zeros(m,n);
 %efarmozw to filtro sthn eikona
 for i = 1:1:m
 for j = 1:1:n
 block(1:N,1:N) = paddingImageArray(i:i+N-1,j:j+N-1);
 sum = 0;
 for k = 1:1:N
 for l = 1:1:N
 sum+= block(k,l)*filter(k,l);
 end
 end
 ImageLast(i,j) = round(sum);
 end
 end
 %epistrefw to apotelesma
 ImageOut = ImageLast;
endfunction
