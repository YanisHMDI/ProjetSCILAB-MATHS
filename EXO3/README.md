# EXO3
// 1.
nbr_classe = 10

// Identifier les indices des hommes
id_male = find(dataS(:, 3) == "Male");

// Extraire les salaires des hommes
salaire_male = dbldata(id_male, 7);

// Définir le nombre de classes pour l'histogramme
nbr_classe = 10;

// Afficher un histogramme des salaires des hommes
histplot(nbr_classe, salaire_male, normalization=%f);  // Histogramme des salaires des hommes
xlabel('Salaire ($)');              // Étiquette de l'axe des x
ylabel('Fréquence relative');       // Étiquette de l'axe des y
title('Distribution des salaires des hommes dans l''échantillon');  // Titre du graphique

![alt text](3.1M-1.png)

// Identifier les indices des femmes
id_female = find(dataS(:, 3) == "Female");

// Extraire les salaires des femmes
salaire_female = dbldata(id_female, 7);

// Définir le nombre de classes pour l'histogramme
nbr_classe = 10;

// Afficher un histogramme des salaires des femmes
histplot(nbr_classe, salaire_female, normalization=%f);  // Histogramme des salaires des femmes
xlabel('Salaire ($)');              // Étiquette de l'axe des x
ylabel('Fréquence relative');       // Étiquette de l'axe des y
title('Distribution des salaires des femmes dans l''échantillon');  // Titre du graphique

![alt text](3.1F-1.png)

// Identifier les indices pour la catégorie "Other"
id_other = find(dataS(:, 3) == "Other");

// Extraire les salaires pour la catégorie "Other"
salaire_other = dbldata(id_other, 7);

// Définir le nombre de classes pour l'histogramme
nbr_classe = 10;

// Afficher un histogramme des salaires pour la catégorie "Other"
histplot(nbr_classe, salaire_other, normalization=%f);  // Histogramme des salaires pour la catégorie "Other"
xlabel('Salaire ($)');              // Étiquette de l'axe des x
ylabel('Fréquence relative');       // Étiquette de l'axe des y
title('Distribution des salaires pour la catégorie ''Other'' dans l''échantillon');  // Titre du graphique

![alt text](3.1O-1.png)

// 2.
indice_high = find(dbldata(:,4) == 0)
salaire_high = dbldata(indice_high,7)
moy_h = mean(salaire_high)   // moy_h = 36706.694                                     

indice_b = find(dbldata(:,4) == 1)
salaire_b = dbldata(indice_b,7)
moy_b = mean(salaire_b)      // moy_b = 95082.909 

indice_m = find(dbldata(:,4) == 2)
salaire_m = dbldata(indice_m,7)
moy_m = mean(salaire_m)      moy_m = 130112.06     

indice_p = find(dbldata(:,4) == 3)
salaire_p = dbldata(indice_p,7)
moy_p = mean(salaire_p)      moy_p = 165651.46 

                                     

matrice = [moy_h, moy_b, moy_m, moy_p];
bar([0, 1, 2, 3], matrice);

// Ajouter des étiquettes aux axes et un titre
xlabel('Niveau d''études');
ylabel('Salaire moyen ($)');
title('Moyenne des salaires par niveau d''études');

![alt text](3.2-1.png)


// 3.
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

![alt text](3.3-1.png)

// 4.
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

![alt text](3.4M-1.png)

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
![alt text](3.4O-1.png)