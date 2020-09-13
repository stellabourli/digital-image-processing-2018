%arxikos pinakas f
f = [1 -1 1 0 1;
 2 1 0 -1 3;
 2 4 4 0 0;
 1 0 -1 1 1;
 1 -1 -1 -1 1];
%arxikos pinakas h
h = [0 1 0;
 1 -4 1;
 0 1 0];

%dhmiourgw pinaka h 4x4 kai ton sumplhrwnw katallhla
new_h = zeros(4,4);
new_h(1:3,1:3) = h(1:3,1:3);
new_h(4,1) = new_h(1,mod((4-1),4)+1);
new_h(4,2) = new_h(1,mod((4-2),4)+1);
new_h(4,3) = new_h(1,mod((4-3),4)+1);
new_h(4,4) = new_h(1,mod((4-4),4)+1);
new_h(1,4) = new_h(1,mod((1-4),4)+1);
new_h(2,4) = new_h(1,mod((2-4),4)+1);
new_h(3,4) = new_h(1,mod((3-4),4)+1);
%krataw to 3x3 kommati autou
last_h(1:3,1:3) = new_h(2:4,2:4)
%grammikh suneliksh
%efarmozw padding ston f kai ston h
%gia na exoun idio mege8os me to apotelesma
zpf = zeros(7,7);
zpf(1:5,1:5) = f(1:5,1:5);
zph = zeros(7,7);
zph(1:3,1:3) = last_h(1:3,1:3);
%kai ektelw grammikh suneliksh
f1 = fft2(zph);
f2 = fft2(zpf);
res = int8(ifft2(f1 .* f2))
%kuklikh suneliksh
%efarmozw padding fia na ginei idio mege8os me ton f
zero_padded_h = zeros(5,5);
zero_padded_h(1:3,1:3) = last_h(1:3,1:3);
%kai ektelw grammikh suneliksh
fft_f = fft2(f);
fft_h = fft2(zero_padded_h);
r = fft_h .* fft_f;
result = int8(ifft2(r))