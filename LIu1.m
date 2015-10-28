data = csvread('B.csv');

% age = data(:,1);

%%
age = data(:,1);



%%
%make histogram of ages
figure(1);
% [bincounts, ind] = 
ageData = data(:,1);
h = histogram(ageData);
h.BinWidth = 0.9;
h.NumBins = max(ageData) - min(ageData);
% bar(range, bincounts, 'histc');
ylabel('Pocet');
xlabel('Vek');

%%
bmiData= data(:,3);
bmi = [0,18,19,24,25,29,30,max(bmiData)];

figure(2);
h = histogram(bmiData);
h.BinWidth = 5;
ylim = max(bmiData);
ylabel('Pocet');
xlabel('BMI');

%%

pressureData = data(:,2);

figure(3);
histogram(pressureData);
ylabel('Pocet');
xlabel('Priemern� Krvn� Tlak');

%%

less25 = ageData(ageData < 25);
between25To35 = ageData(ageData >= 25 & ageData < 35);
between35To45 = ageData(ageData >= 35 & ageData < 45);
between45To55 = ageData(ageData >= 45 & ageData < 55);
between55To65 = ageData(ageData >= 55 & ageData < 65);
over65 = ageData(ageData >= 65);

% FirstMedication = data(:,8) >= 1;

% CuredWithFirst = data(:,8);