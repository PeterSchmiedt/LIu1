function ID = NewPatient( age, pressure, bmi, otherMed, data)

%vek/map/bmi/lek/jina medikace

if (age<30) 
    ID = 1000;
elseif (age < 40) 
    ID = 2000;
elseif (age<50)
    ID = 3000;
elseif (age<60)
    ID = 4000;
else
    ID = 5000;
end

if (pressure < 70) 
    ID = ID + 100;
elseif (pressure < 93) 
    ID = ID + 200;
elseif (pressure < 106)
    ID = ID + 300;
elseif (pressure < 120)
    ID = ID + 400;
else
    ID = ID + 500;
end

if (bmi < 18.5) 
    ID = ID + 10;
elseif (bmi < 25) 
    ID = ID + 20;
elseif (bmi < 35)
    ID = ID + 30;
else
    ID = ID + 40;
end

if (otherMed == 0) 
    ID = ID + 0;
else 
    ID = ID + 1;
end

end


