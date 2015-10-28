data = csvread('B.csv');

% age = data(:,1);

%%
age = data(:,1);



%%
%make histogram of ages
figure(1);
range = min(age):max(age);
% [bincounts, ind] = 
hist(data(:,1),range);
% bar(range, bincounts, 'histc');
ylabel('Pocet');
xlabel('Vek');


length(age >= 70)

%%
bmi = [18,24,30,40]
histc(data(:,3),bmi);
ylabel('Count');
xlabel('BMI');

% FirstMedication = data(:,8) >= 1;

% CuredWithFirst = data(:,8);