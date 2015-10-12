values = csvread('B.csv');

h = figure(1);
hist(values(:,1),49);
saveas(h, 'histAges.pdf');