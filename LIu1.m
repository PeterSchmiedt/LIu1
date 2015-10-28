data = csvread('B.csv');
 
ageData = data(:,1);
bmiData= data(:,3);
pressureData = data(:,2);

%%
%make histogram of ages
figure(1);
% [bincounts, ind] =
h = histogram(ageData);
h.BinWidth = 0.9;
h.NumBins = max(ageData) - min(ageData);
% bar(range, bincounts, 'histc');
ylabel('Pocet');
xlabel('Vek');

%%
bmi = [0,18,19,24,25,29,30,max(bmiData)];

figure(2);
h = histogram(bmiData);
h.BinWidth = 5;
ylim = max(bmiData);
ylabel('Pocet');
xlabel('BMI');

%%
figure(3);
histogram(pressureData);
ylabel('Pocet');
xlabel('Priemerný Krvný Tlak');

%%

less25 = ageData(ageData < 25);
between25To35 = ageData(ageData >= 25 & ageData < 35);
between35To45 = ageData(ageData >= 35 & ageData < 45);
between45To55 = ageData(ageData >= 45 & ageData < 55);
between55To65 = ageData(ageData >= 55 & ageData < 65);
over65 = ageData(ageData >= 65);

%%

underWeight = bmiData(bmiData<18.5);
normalWeight = bmiData(bmiData >= 18.5 & bmiData < 25);
overWeight = bmiData(bmiData >= 25 & bmiData < 30);
obeseWeight = bmiData(bmiData >= 30);

%%

lowMap = pressureData(pressureData < 95);
mediumMap = pressureData(pressureData >= 95 & pressureData < 105);
normalMap = pressureData(pressureData >= 105 & pressureData < 115);
highMap = pressureData(pressureData >= 115 & pressureData < 125);
insaneMap = pressureData(pressureData >= 125);

%%
%bol chory - liek - je chory
wasSickData = data(:,4);
tookFirst = data(:,8);
isSickData = data(:,9);

o00 = wasSickData == 0;
o01 = wasSickData == 1;
o11 = tookFirst == 1;
o12 = tookFirst == 2;
o20 = isSickData == 0;
o21 = isSickData == 1;

tmpooo = o00 & o11 & o20;
tmpooi = o00 & o11 & o21;
tmpoio = o00 & o12 & o20;
tmpoii = o00 & o12 & o21;
tmpioo = o01 & o11 & o20;
tmpioi = o01 & o11 & o21;
tmpiio = o01 & o12 & o20;
tmpiii = o01 & o12 & o21;

ooo = tmpooo(tmpooo == 1);
ooi = tmpooi(tmpooi == 1);
oio = tmpoio(tmpoio == 1);
oii = tmpoii(tmpoii == 1);
ioo = tmpioo(tmpioo == 1);
ioi = tmpioi(tmpioi == 1);
iio = tmpiio(tmpiio == 1);
iii = tmpiii(tmpiii == 1);





