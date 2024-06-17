# EXO2 



// 1.
ages = tabul(dbldata(:, 2)); // Récupère la liste des âges et leurs occurrences
figure;                       // Nouvelle figure
bar(ages(:, 1), ages(:, 2));  // Affiche un histogramme des âges
xlabel('Âge');
ylabel('Fréquence');
title('Répartition des âges dans l''échantillon');

![alt text](2.1.1-1.png)

// 2.
exp = tabul(dbldata(:, 6));    // Récupère la liste des expériences et leurs occurrences
figure;                        // Nouvelle figure
bar(exp(:, 1), exp(:, 2));     // Affiche un histogramme des expériences
xlabel('Expérience (années)');
ylabel('Fréquence');
title('Répartition de l''expérience dans l''échantillon');

![alt text](2.1.2-1.png)

// 3.
mean(dbldata(:,2))                                    //moyenne  =  33.622033
min(dbldata(:,2))                                     //min      =  21
max(dbldata(:,2))                                     //max      =  62
median(dbldata(:,2))                                  //médianne  =  32
quart(dbldata(:,2))                                   //quartile  = 28.32.38.
iqr(dbldata(:,2))                                     //interquartile = 10
stdev(dbldata(:,2))                                   //ecart-type = 7.6156456

age = tabul(dbldata(:,2))                             //récupère la liste des âges et leurs occurrences
[occurence_tri, indice_tri] = gsort(age(:,2))         //trie les occurrences et récupère les indices
liste_age = age(:,1)                                  //liste des âges
mode = liste_age(indice_tri(1))                       //mode =27  

// 4.
atomsInstall("stixbox")                               //installe le module stixbox
atomsLoad("stixbox")                                  //charge le module stixbox
boxplot(dbldata(:, 2), "orientation", "horizontal"); // Affiche un boxplot des âges
xlabel('Âge');                  // Étiquette de l'axe des x
title('Distribution des âges dans l''échantillon'); // Titre du graphique

![alt text](2.4-1.png)

// 5. 

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

![alt text](2.5-1.png)