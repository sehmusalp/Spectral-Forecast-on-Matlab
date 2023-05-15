clc
clear 
clear all

... Spectral Forecast Şehmus ALP (ERASMUS)

Array1 = "10.3,23.4,44.8,63.2,44.1,35.1,46.5,62.6,50.4,28.9,24.7";
Array2 = "18.8,43.1,52.2,45.5,46.8,46.6,67.9,66.3,70.4,62,39.7";

M = []; ... made as not a string

tA = str2double(strsplit(Array1, ',')); ... split with "," according to github examples.
tB = str2double(strsplit(Array2, ','));

MaxtA = tA(1);   ... defined a number randomly. Could've been used 'Max function' as well.
MaxtB = tB(1);
MaxAB = 0;

d = 33;

for i = 1:length(tA)       ...Defining Max element in First array
    if tA(i) > MaxtA
        MaxtA = tA(i);
    end
    if tB(i) > MaxtB
        MaxtB  = tB(i);
    end
end

if MaxtA > MaxtB   ... MaxAB is determined
    MaxAB = MaxtA;
else
    MaxAB = MaxtB;
end

for i = 1:length(tA)
    v = ((d / MaxtA) * tA(i)) + (((MaxAB - d) / MaxtB) * tB(i));
    M = [M,round(v, 2)];
end
disp(M);

plot(tA, '-x');
hold on;
plot(tB, '-o');
plot(M, '-*');
hold off;
legend('Array1', 'Array2', 'M');
