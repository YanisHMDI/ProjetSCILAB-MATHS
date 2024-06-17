data = csvRead("data.csv");

mean(dbldata(:,7))        // moyenne = 115326.96
min(dbldata(:,7))         // min = 350
max(dbldata(:,7))         // max = 250000
median(dbldata(:,7))      // médianne = 115000
quart(dbldata(:,7))       // quartile = [70000.115000.160000]
iqr(dbldata(:,7))         // interquartile = 90000
stdev(dbldata(:,7))       // écart-type = 52786.184

sal = tabul(dbldata(:,7))
[occurence_tri, indice_tri] = gsort(sal(:,2))
liste_sal = sal(:,1)
mode = liste_sal(indice_tri(1))        // mode = 140000

atomsInstall("stixbox")
atomsLoad("stixbox")
boxplot(dbldata(:,7), "orientation", "horizontal");
xlabel('Salaire ($)');
title('Distribution des salaires dans l''échantillon');