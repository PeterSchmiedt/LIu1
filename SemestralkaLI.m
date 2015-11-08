data = csvread('B.csv');

ids = zeros(2, length(data));

ageData = data(:,1);
bmiData= data(:,3);
pressureData = data(:,2);

%%

for i = 1 : length(ids)
    row = data(i,:);
    [ids(1, i), ids(2, i)] = NewPatient(row, i);
    data(i, 12) = ids(1,i);
end

%%
[a, b] = hist(ids(1, :), unique(ids(1, :)));

newIdsA = zeros(1, length(a(a < 25)));
newIdsB = zeros(1, length(a(a < 25)));
relevantIds = zeros(1, length(a(a < 25)));

%%
j = 1;

for i = 1 : length(newIdsA)
    if (a(i) > 25) 
        newIdsA(j) = a(i);
        newIdsB(j) = b(i);
        j = j + 1;
    end
end

newIdsA(newIdsA==0) = [];
newIdsB(newIdsB==0) = [];

%%
newIdsMatrix = zeros(length(newIdsA), 2);

newIdsMatrix(:, 2) = newIdsA';
newIdsMatrix(:, 1) = newIdsB';

%csvwrite('output.csv', newIdsMatrix);
%^just valid data

%%
idData = data(:,12);
for i = 1 : length(newIdsB)
    newId = newIdsB(i);
    newData = data(idData == newId, :);
    
    first = newData(newData(newData(:, 8) == 1), :);
end










