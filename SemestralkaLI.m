data = csvread('B.csv');

ids = 

for i = length(data)
    row = data(i,:);
    ids[i] = NewPatient(row[1], row[2], row[3], row[7], data);