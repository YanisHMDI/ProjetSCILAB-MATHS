data = csvRead("data.csv");

atomsInstall("stixbox")
atomsLoad("stixbox")

id_male = find(dataS(:,3) == "Male")
salaire_male = dbldata(id_male,7)
mean(salaire_male)        // moyenne = 121389.87
min(salaire_male)         // min = 350
max(salaire_male)         // max = 250000
median(salaire_male)      // médianne = 120000
quart(salaire_male)       // quartile = [75000.120000.170000]
iqr(salaire_male)         // interquartile = 95000
stdev(salaire_male)       // écart-type = 52092.726
sal = tabul(salaire_male)
[occurence_tri, indice_tri] = gsort(sal(:,2))
liste_sal = sal(:,1)
mode = liste_sal(indice_tri(1))        // mode = 140000
id_male = find(dataS(:,3) == "Male");
salaire_male = dbldata(id_male, 7);

boxplot(salaire_male, "orientation", "horizontal");
xlabel('Salaire ($)');


id_female = find(dataS(:,3) == "Female")
salaire_female = dbldata(id_female,7)
mean(salaire_female)        // moyenne = 107889.00
min(salaire_female)         // min = 500.
max(salaire_female)         // max = 220000
median(salaire_female)      // médianne = 105000
quart(salaire_female)       // quartile = [60000.105000.150000]
iqr(salaire_female)         // interquartile = 90000
stdev(salaire_female)       // écart-type = 52723.610
sal = tabul(salaire_female)
[occurence_tri, indice_tri] = gsort(sal(:,2))
liste_sal = sal(:,1)
mode = liste_sal(indice_tri(1))        // mode = 120000
boxplot(salaire_female', "orientation", "horizontal");



id_other = find(dataS(:,3) == "Other")
salaire_other = dbldata(id_other,7)
mean(salaire_other)        // moyenne =  125869.86
min(salaire_other)         // min = 62852.
max(salaire_other)         // max = 166109
median(salaire_other)      // médianne = 158610
quart(salaire_other)       // quartile = [69032.158610.161393]
iqr(salaire_other)         // interquartile = 92361
stdev(salaire_other)       // écart-type = 44242.383
sal = tabul(salaire_other)
[occurence_tri, indice_tri] = gsort(sal(:,2))
liste_sal = sal(:,1)
mode = liste_sal(indice_tri(1))        // mode = 158966
boxplot(salaire_other, "orientation", "horizontal")