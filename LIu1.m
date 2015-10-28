data = csvread('B.csv');

% age = data(:,1);

%%
age = data(:,1);



%%
%make histogram of ages
hist(data(:,1),70);
ylabel('Count');
xlabel('Age');

%%

hist(data(:,1),70);
ylabel('Count');
xlabel('Age');

% FirstMedication = data(:,8) >= 1;

% CuredWithFirst = data(:,8);