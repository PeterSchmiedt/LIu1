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

%%
j = 1;
sum = 0;
for i = 1 : length(a)
    if (a(i) > 25) 
        newIdsA(j) = a(i);
        newIdsB(j) = b(i);
        j = j + 1;
    end
end

newIdsA(newIdsA==0) = [];
newIdsB(newIdsB==0) = [];

%%
newIdsMatrix = zeros(length(newIdsA), 10);

newIdsMatrix(:, 1) = newIdsB';
newIdsMatrix(:, 2) = newIdsA';

%%
idData = data(:,12);

firstCuredArray = zeros(length(newIdsB), 1);
firstUnCuredArray = zeros(length(newIdsB), 1);
secondCuredArray = zeros(length(newIdsB), 1);
secondUnCuredArray = zeros(length(newIdsB), 1);

chi2f = zeros(length(newIdsB),1);
chi2s = zeros(length(newIdsB),1);

for i = 1 : length(newIdsB)
    newId = newIdsB(i);
    newData = data(idData == newId, :);
    
    first = newData(newData(:, 8) == 1, :);
    second = newData(newData(:, 8) == 2, :);
    
    firstCured = first(first(:, 9) == 0, :);
    firstUnCured = first(first(:, 9) == 1, :);
    secondCured = second(second(:, 9) == 0, :);
    secondUnCured = second(second(:, 9) == 1, :);
    
    firstCuredArray(i) = length(firstCured(:,1));
    firstUnCuredArray(i) = length(firstUnCured(:,1));
    secondCuredArray(i) = length(secondCured(:,1));
    secondUnCuredArray(i) = length(secondUnCured(:,1));           
end

%%

newIdsMatrix(:, 3) = firstCuredArray;
newIdsMatrix(:, 4) = firstUnCuredArray;
newIdsMatrix(:, 5) = secondCuredArray;
newIdsMatrix(:, 6) = secondUnCuredArray;
newIdsMatrix(:, 7) = chi2f;
newIdsMatrix(:, 8) = chi2s;
%%

%csvwrite('output.csv', newIdsMatrix);

for i = 1 : length(newIdsB) 
    
    %expected = length(firstCured(:,1)) + length(secondCured(:,1)) + length(firstUnCured(:,1)) + length(secondUnCured(:,1));
    %expectedF = (length(firstCured(:,i)) + length(firstUnCured(:,i))) * 0.2975;
    %expectedS = (length(secondCured(:,i)) + length(secondUnCured(:,i))) * 0.8;
    
    %chi2f(i) = (firstCuredArray(i) - expectedF)^2 / expectedF;
    %chi2s(i) = (secondCuredArray(i) - expectedS)^2 / expectedS;
end




