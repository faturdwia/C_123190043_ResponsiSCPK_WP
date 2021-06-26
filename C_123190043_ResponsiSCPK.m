clc; %mengosongkan workspace
 
%pengambilan data
data1 = xlsread('Real estate valuation data set.xlsx','C2:E51'); %mengambil 50 baris data pertama dari kolom C = house age,
                                                                 %D = distance to the nearest MRT station, E = number of convenience stores
data2 = xlsread('Real estate valuation data set.xlsx','H2:H51'); %mengambil 50 baris data pertama dari kolom H = house price of unit area.
 
x = [data1 data2];  %menggabungkan kedua data matriks sehingga membentuk sebuah matriks sebagai data rating kecocokan
k = [1,0,1,0];      %atribut masing-masing kriteria (1 = benefit/keuntungan, 0 = cost/biaya)
w = [3,5,4,1];      %bobot nilai masing-masing kriteria (1 = sangat rendah, 2 = rendah, 3 = cukup, 4 = tinggi, 5 = sangat tinggi)
 
%tahapan pertama, perbaikan bobot
[m,n]=size (x); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot
 
%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n
    if k(j)==0, w(j)=-1*w(j);
    end
end
for i=1:m
    S(i)=prod(x(i,:).^w);
end
 
%tahapan ketiga, proses perangkingan
V = S/sum(S);
[rank,idr] = sort(V,'descend');   %pengurutan niai dari terbesar ke terkecil
[best,idb] = max(rank);     %mengambil nilai terbaik dari data yang sudah diurutkan
 
%tahapan empat, menampilkan hasil pencarian real estate yang menjadi alternatif terbaik untuk investasi jangka panjang
disp('-RANKING-')
for i = 1:50
    disp([num2str(i) , '. ' , num2str(rank(i)) , ' (nomor ' , num2str(idr(i)) , ')'])
end

disp(' ')
disp('+--------------------------------------------------------------------------------+')
disp(['| Sehingga, Real Estate terbaik yaitu nomor: ' , num2str(idb) , ', dengan total nilai yang diperoleh sebesar ' , num2str(best) , ' |'])
disp('+--------------------------------------------------------------------------------+')
