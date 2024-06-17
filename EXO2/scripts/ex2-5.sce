data = csvRead("data.csv");

mean(dbldata(:,6))                                    //moyenne  =  8.0950142
min(dbldata(:,6))                                     //min  =  0
max(dbldata(:,6))                                     //max  =   34
median(dbldata(:,6))                                  //médianne = 7
quart(dbldata(:,6))                                   //quartile  = [3.7.12]
iqr(dbldata(:,6))                                     //interquartile = 9
stdev(dbldata(:,6))                                   //ecart-type =  6.0598534

exp = tabul(dbldata(:,6))                             //récupère la liste des expériences et leurs occurrences
[occurence_tri, indice_tri] = gsort(exp(:,2))         //trie les occurrences et récupère les indices
liste_exp = exp(:,1)                                  //liste des expériences
mode = liste_exp(indice_tri(1))                       //mode = 2

atomsInstall("stixbox")                               //installe le module stixbox
atomsLoad("stixbox")                                  //charge le module stixbox
boxplot(dbldata(:, 6), "orientation", "horizontal"); // Affiche un boxplot des expériences
xlabel('Expérience (années)');  // Étiquette de l'axe des x
title('Distribution des expériences dans l''échantillon'); // Titre du graphique