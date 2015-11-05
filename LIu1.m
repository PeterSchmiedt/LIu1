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

less30 = ageData(ageData < 30);
between30To44 = ageData(ageData >= 30 & ageData < 45);
between45To64 = ageData(ageData >= 45 & ageData < 65);
over65 = ageData(ageData >= 65);

%%

underWeight = bmiData(bmiData<18.5);
normalWeight = bmiData(bmiData >= 18.5 & bmiData < 25);
overWeight = bmiData(bmiData >= 25 & bmiData < 30);
obeseWeight = bmiData(bmiData >= 30);

%%

hypoMap = pressureData(pressureData < 70);
normalMap = pressureData(pressureData >= 70 & pressureData < 93);
prehyperMap = pressureData(pressureData >= 93 & pressureData < 106);
hyper1Map = pressureData(pressureData >= 106 & pressureData < 120);
hyper2Map = pressureData(pressureData >= 120);

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

%%

tmpioo = o01 & o11 & o20;
tmpioi = o01 & o11 & o21;
tmpiio = o01 & o12 & o20;
tmpiii = o01 & o12 & o21;

ioo = tmpioo(tmpioo == 1);
ioi = tmpioi(tmpioi == 1);
iio = tmpiio(tmpiio == 1);
iii = tmpiii(tmpiii == 1);

%%

%urci kolko ludi bolo vyliecenych v jednotlivych kategoriach pre jednotlive
%lieky a potom na to pusti chi-kvadrat test a vsetko bude krasne.

firstAndSick = tmpioo == 1;
firstAndHealty = tmpioi == 1;
secondAndSick = tmpiio == 1;
secondAndHealty = tmpiii == 1;

%%
less30Bool = ageData < 30;
less30AndfirstAndSick = firstAndSick & less30Bool;
less30AndfirstAndSick = less30AndfirstAndSick(less30AndfirstAndSick == 1);
less30AndfirstAndHealty = firstAndHealty & less30Bool;
less30AndfirstAndHealty = less30AndfirstAndHealty(less30AndfirstAndHealty == 1);

less30AndSecondAndSick = secondAndSick & less30Bool;
less30AndSecondAndSick = less30AndSecondAndSick(less30AndSecondAndSick == 1);
less30AndSecondAndHealty = secondAndHealty & less30Bool;
less30AndSecondAndHealty = less30AndSecondAndHealty(less30AndSecondAndHealty == 1);

%%
between30To45Bool = ageData >= 30 & ageData < 45;
between30To45AndfirstAndSick = firstAndSick & between30To45Bool;
between30To45AndfirstAndSick = between30To45AndfirstAndSick(between30To45AndfirstAndSick == 1);
between30To45AndfirstAndHealty = firstAndHealty & between30To45Bool;
between30To45AndfirstAndHealty = between30To45AndfirstAndHealty(between30To45AndfirstAndHealty == 1);

between30To45AndSecondAndSick = secondAndSick & between30To45Bool;
between30To45AndSecondAndSick = between30To45AndSecondAndSick(between30To45AndSecondAndSick == 1);
between30To45AndSecondAndHealty = secondAndHealty & between30To45Bool;
between30To45AndSecondAndHealty = between30To45AndSecondAndHealty(between30To45AndSecondAndHealty == 1);

%%
between35To45Bool = ageData >= 45 & ageData < 65;
between45To65AndfirstAndSick = firstAndSick & between45To65Bool;
between45To65AndfirstAndSick = between45To65AndfirstAndSick(between45To65AndfirstAndSick == 1);
between45To65AndfirstAndHealty = firstAndHealty & between45To65Bool;
between45To65AndfirstAndHealty = between45To65AndfirstAndHealty(between45To65AndfirstAndHealty == 1);

between45To65AndSecondAndSick = secondAndSick & between45To65Bool;
between45To65AndSecondAndSick = between45To65AndSecondAndSick(between45To65AndSecondAndSick == 1);
between45To65AndSecondAndHealty = secondAndHealty & between45To65Bool;
between45To65AndSecondAndHealty = between45To65AndSecondAndHealty(between45To65AndSecondAndHealty == 1);

%%
over65Bool = ageData >= 65;
over65AndfirstAndSick = firstAndSick & over65Bool;
over65AndfirstAndSick = over65AndfirstAndSick(over65AndfirstAndSick == 1);
over65AndfirstAndHealty = firstAndHealty & over65Bool;
over65AndfirstAndHealty = over65AndfirstAndHealty(over65AndfirstAndHealty == 1);

over65AndSecondAndSick = secondAndSick & over65Bool;
over65AndSecondAndSick = over65AndSecondAndSick(over65AndSecondAndSick == 1);
over65AndSecondAndHealty = secondAndHealty & over65Bool;
over65AndSecondAndHealty = over65AndSecondAndHealty(over65AndSecondAndHealty == 1);

%%















