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

%%

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

%%

%urci kolko ludi bolo vyliecenych v jednotlivych kategoriach pre jednotlive
%lieky a potom na to pusti chi-kvadrat test a vsetko bude krasne.

firstAndSick = tmpioo == 1;
firstAndHealty = tmpioi == 1;
secondAndSick = tmpiio == 1;
secondAndHealty = tmpiii == 1;

%%
less25Bool = ageData < 25;
less25AndfirstAndSick = firstAndSick & less25Bool;
less25AndfirstAndSick = less25AndfirstAndSick(less25AndfirstAndSick == 1);
less25AndfirstAndHealty = firstAndHealty & less25Bool;
less25AndfirstAndHealty = less25AndfirstAndHealty(less25AndfirstAndHealty == 1);

less25AndSecondAndSick = secondAndSick & less25Bool;
less25AndSecondAndSick = less25AndSecondAndSick(less25AndSecondAndSick == 1);
less25AndSecondAndHealty = secondAndHealty & less25Bool;
less25AndSecondAndHealty = less25AndSecondAndHealty(less25AndSecondAndHealty == 1);

%%
between25To35Bool = ageData >= 25 & ageData < 35;
between25To35AndfirstAndSick = firstAndSick & between25To35Bool;
between25To35AndfirstAndSick = between25To35AndfirstAndSick(between25To35AndfirstAndSick == 1);
between25To35AndfirstAndHealty = firstAndHealty & between25To35Bool;
between25To35AndfirstAndHealty = between25To35AndfirstAndHealty(between25To35AndfirstAndHealty == 1);

between25To35AndSecondAndSick = secondAndSick & between25To35Bool;
between25To35AndSecondAndSick = between25To35AndSecondAndSick(between25To35AndSecondAndSick == 1);
between25To35AndSecondAndHealty = secondAndHealty & between25To35Bool;
between25To35AndSecondAndHealty = between25To35AndSecondAndHealty(between25To35AndSecondAndHealty == 1);

%%





















