values = csvread('B.csv');

h = figure(1);
hist(values(:,1),49);
saveas(h, 'histAges.pdf');

%%

h = figure(1);
hist(values(:,2),49);
saveas(h, 'histPressures.pdf');

%%
h = figure(1);
hist(values(:,3),19);
saveas(h, 'histBmi.pdf');

%%

%real analysis begins here

