data = csvread('B.csv');

ids = zeros(1, length(data));

%%

for i = 1 : length(ids)
    row = data(i,:);
    ids(i) = NewPatient(row(1), row(2), row(3), row(7), data);    
end

%%

h = histogram(ids);
values = h.Values;