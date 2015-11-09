data = csvread('B.csv');
workingData = data;

%%

workingData = [zeros(length(workingData),1) workingData]; %pridaj jeden stlpec nul do nasich dat

%%

%potrebujeme priradit kazdemu pacientovi ID

for i=1 : 10000
    
    ID = 0;
    
    if (workingData(i,2)<30) 
        ID = 1000;
    elseif (workingData(i,2) < 40) 
        ID = 2000;
    elseif (workingData(i,2)<50)
        ID = 3000;
    elseif (workingData(i,2)<60)
        ID = 4000;
    else
        ID = 5000;
    end
    
    if (workingData(i,3) < 70) 
        ID = ID + 100;
    elseif (workingData(i,3) < 93) 
        ID = ID + 200;
    elseif (workingData(i,3) < 106)
        ID = ID + 300;
    elseif (workingData(i,3) < 120)
        ID = ID + 400;
    else
        ID = ID + 500;
    end
    
    if (workingData(i,4) < 18.5) 
        ID = ID + 10;
    elseif (workingData(i,4) < 25) 
        ID = ID + 20;
    elseif (workingData(i,4) < 35)
        ID = ID + 30;
    else
        ID = ID + 40;
    end
    
    if (workingData(i,8) == 0) 
        ID = ID + 0;
    else 
        ID = ID + 1;
    end
        
    workingData(i,1) = ID;
end

%%
%zoradome si to a potrebujeme to zoskupit

workingData = sortrows(workingData);

%%
%zoskupime si to

groupedData = zeros(200,8);

riadok = 1;

for age=1:5
    for pressure=1:5
        for bmi=1:4
           for otherMedication=0:1
               groupedData(riadok) = age*1000 + pressure*100 + bmi*10 + otherMedication;
               riadok = riadok + 1;
           end
        end
    end
end

%%
%mame prazdnu maticu so vsetkymi IDckami a naplnime ju kolko pacientov
%patri do skupiny

for i=1:10000
   groupedData(find(groupedData==workingData(i,1)),2) = groupedData(find(groupedData==workingData(i,1)),2) + 1;
end

%%
%musime vymazat prazdne riadky





