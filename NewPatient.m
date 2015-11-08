function ID = NewPatient( age, pressure, bmi, otherMed, data)

%vek/map/bmi/lek/jina medikace

if (age<30) 
    ID = '1';
elseif (age < 40) 
    ID = '2';
elseif (age<50)
    ID = '3';
elseif (age<60)
    ID = '4';
elseif (age>=60)
    ID = '5';
end

if (pressure < 70) 
    ID = ID + '1';
elseif (pressure < 93) 
    ID = ID + '2';
elseif (pressure < 106)
    ID = ID + '3';
elseif (pressure < 120)
    ID = ID + '4';
elseif (pressure >= 120)
    ID = ID + '5';
end

if (bmi < 18.5) 
    ID = ID + '1';
elseif (bmi < 25) 
    ID = ID + '2';
elseif (bmi < 35)
    ID = ID + '3';
elseif (bmi >= 35)
    ID = ID + '4';
end

if (otherMed == 0) 
    ID = ID + '0';
elseif (otherMed == 1)
    ID = ID + '1';
end

end


