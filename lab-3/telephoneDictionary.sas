data telephoneDictionary;
infile datalines dlm='' dsd missover;
length ID 4 Name $20 Last_Name $20 Phone_Country 3 Phone $10 Phone_Type $8;
input ID Name Last_Name Phone_Country Phone Phone_Type;

datalines;
1 Энтони Старк 1 1441969100 mobile
2 Кларк Кент 1 5417543010 landline
. Борис Ельцин 7 1993092104 landline
3 Тор Одинсон . . .
4 Рэйвен . 1 1973012701 landline
;

run;