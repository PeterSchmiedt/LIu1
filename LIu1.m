data = csvread('B.csv');

% age = data(:,1);

%%
age = data(:,1);



%%
%make histogram of ages
figure(1);
% [bincounts, ind] = 
hist(data(:,1),49);
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
xlabel('Priemernı Krvnı Tlak');
% FirstMedication = data(:,8) >= 1;

% CuredWithFirst = data(:,8);