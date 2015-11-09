data = csvread('output.csv');

for i=1:length(data)
    
    expectedF = (data(i,3) + data(i,4)) * 0.2975;
    expectedS = (data(i,5) + data(i,6)) * 0.8;
    
    chisq1 = (data(i,3) - expectedF)^2 / expectedF;
    chisq2 = (data(i,5) - expectedS)^2 / expectedS;
    
    chisq = chisq1 + chisq2;
    
    data(i,7) = chisq;
    
end

%%

csvwrite('datachisq.csv', data);

