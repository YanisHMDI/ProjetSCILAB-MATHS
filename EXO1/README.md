# EXO1 

// 1.

genre = tabul(dataS(:,3),"i")                        // Récupère la liste des genres ainsi que leur occurrence (MALE=3672, FEMALE=3013, OTHER=14)
genre(1)                                             // Liste les différents genres du tableau
genre(2)                                             // Donne l'occurrence correspondant aux valeurs de "genre(1)"
pie(genre(2),genre(1))                               // Ouvre un diagramme camembert représentant les genres en fonction de leur occurrence


![alt text](1.1-1.png)

// 2.
genre_lvl = [dataS(:,3),dataS(:,4)]                                  // Crée une matrice 6699x2 avec les genres et le niveau d'études

high_homme = length(find(genre_lvl(:,2) == "0" & genre_lvl(:,1) == "Male"))     // Nombre d'hommes avec un niveau d'étude de 0 (185)
high_femme = length(find(genre_lvl(:,2) == "0" & genre_lvl(:,1) == "Female"))   // Nombre de femmes avec un niveau d'étude de 0 (251)
high_autre = length(find(genre_lvl(:,2) == "0" & genre_lvl(:,1) == "Other"))    // Nombre d'autres genres avec un niveau d'étude de 0 (12)

b_homme = length(find(genre_lvl(:,2) == "1" & genre_lvl(:,1) == "Male"))        // Nombre d'hommes avec un niveau d'étude de 1 (1823)
b_femme = length(find(genre_lvl(:,2) == "1" & genre_lvl(:,1) == "Female"))      // Nombre de femmes avec un niveau d'étude de 1 (1198)
b_autre = length(find(genre_lvl(:,2) == "1" & genre_lvl(:,1) == "Other"))       // Nombre d'autres genres avec un niveau d'étude de 1 (0)

m_homme = length(find(genre_lvl(:,2) == "2" & genre_lvl(:,1) == "Male"))        // Nombre d'hommes avec un niveau d'étude de 2 (790)
m_femme = length(find(genre_lvl(:,2) == "2" & genre_lvl(:,1) == "Female"))      // Nombre de femmes avec un niveau d'étude de 2 (1068)
m_autre = length(find(genre_lvl(:,2) == "2" & genre_lvl(:,1) == "Other"))       // Nombre d'autres genres avec un niveau d'étude de 2 (2)

d_homme = length(find(genre_lvl(:,2) == "3" & genre_lvl(:,1) == "Male"))        // Nombre d'hommes avec un niveau d'étude de 3 (873)
d_femme = length(find(genre_lvl(:,2) == "3" & genre_lvl(:,1) == "Female"))      // Nombre de femmes avec un niveau d'étude de 3 (496)
d_autre = length(find(genre_lvl(:,2) == "3" & genre_lvl(:,1) == "Other"))       // Nombre d'autres genres avec un niveau d'étude de 3 (0)

temp = [high_homme, high_femme, high_autre;b_homme, b_femme, b_autre;m_homme, m_femme, m_autre;d_homme, d_femme, d_autre]   // Crée un tableau 
lvlEtude = [0,1,2,3]
bar(lvlEtude,temp)
legend("homme","femme","autre")


![alt text](1.2-1.png)

// 3.
metiers = tabul(dataS(:,5),"i")                                 // Récupère la liste des professions ainsi que leur occurrence
[occu,indice] = gsort(metiers(2))                               // Trie les occurrences et récupère les indices
profession = metiers(1)                                         // Stocke la liste des professions dans une variable
matrice_occurence = [occu(1:1),occu(2:2),occu(3:3),occu(4:4),occu(5:5),occu(6:6),occu(7:7),occu(8:8),occu(9:9),occu(10:10)]
bar(1,matrice_occurence)                                        // Affiche un histogramme des 10 professions avec le plus de monde
legend(profession(indice(1:10)))                                // Légende le graphe pour donner un nom à chaque colonne


![alt text](1.3-1.png)

// 4.
indice_female = find(dataS(:,3) == "Female")        // Récupère les indices de la colonne 3 de data.csv contenant "Female"
[valeurs] = dataS(indice_female,5)                  // Récupère les métiers situés aux indices récupérés précédemment
metiers_female = tabul(valeurs)                     // Récupère les métiers sans doublons ainsi que leur occurrence
[occurence_tri,indice_tri] = gsort(metiers_female(2))   // Trie dans un tableau ce qu'on a relevé précédemment et relève leur indice d'avant
liste_metiers_female = metiers_female(1)            // Récupère dans une variable la liste des métiers uniques dans le but de la parcourir par indice
liste_metiers_female(119)                           // Relève le métier recensant le plus de femmes

                                                    // femme = Data Scientist //

indice_male = find(dataS(:,3) == "Male")            // Récupère les indices de la colonne 3 de data.csv contenant "Male"
[valeurs2] = dataS(indice_male,5)                   // Récupère les métiers situés aux indices récupérés précédemment
metiers_male = tabul(valeurs2)                      // Récupère les métiers sans doublons ainsi que leur occurrence
[occurence_tri,indice_tri] = gsort(metiers_male(2)) // Trie dans un tableau ce qu'on a relevé précédemment et relève leur indice d'avant
liste_metiers_male = metiers_male(1)                // Récupère dans une variable la liste des métiers uniques dans le but de la parcourir par indice
liste_metiers_male(11)                              // Relève le métier recensant le plus d'hommes

                                                    // homme = Software Engineer //


// 5.
indice_high = find(dbldata(:,4) == 0)
salaire_high = dbldata(indice_high,7)
mean(salaire_high)                                  // 36706.694
age_high = dbldata(indice_high,2)
mean(age_high)                                      // 26.854911
exp_high = dbldata(indice_high,6)
mean(exp_high)                                      // 1.9151786

indice_b = find(dbldata(:,4) == 1)
salaire_b = dbldata(indice_b,7)
mean(salaire_b)                                     // 95082.909
age_b = dbldata(indice_b,2)
mean(age_b)                                         // 30.260179
exp_b = dbldata(indice_b,6)
mean(exp_b)                                         // 5.4195631

indice_m = find(dbldata(:,4) == 2)
salaire_m = dbldata(indice_m,7)
mean(salaire_m)                                     // 130112.06
age_m = dbldata(indice_m,2)
mean(age_m)                                         // 35.171505
exp_m = dbldata(indice_m,6)
mean(exp_m)                                         // 9.6456989

indice_p = find(dbldata(:,4) == 3)
salaire_p = dbldata(indice_p,7)
mean(salaire_p)                                     // 165651.46
age_p = dbldata(indice_p,2)
mean(age_p)                                         // 41.154858
exp_p = dbldata(indice_p,6)
mean(exp_p)                                         // 13.915267

// 6.
indice_6_female = find(dataS(:,3) == "Female")
salaire_6_female = dbldata(indice_6_female,7)
mean(salaire_6_female)                              // 107889.00
age_6_female = dbldata(indice_6_female,2)
mean(age_6_female)                                  // 32.626286
exp_6_female = dbldata(indice_6_female,6)
mean(exp_6_female)                                  // 7.4201792

indice_6_male = find(dataS(:,3) == "Male")
salaire_6_male = dbldata(indice_6_male,7)
mean(salaire_6_male)                                // 121389.87
age_6_male = dbldata(indice_6_male,2)
mean(age_6_male)                                    // 34.416394
exp_6_male = dbldata(indice_6_male,6)
mean(exp_6_male)                                    // 8.6169662

indice_6_other = find(dataS(:,3) == "Other")        
salaire_6_other = dbldata(indice_6_other,7)         // 125869.86
mean(salaire_6_other)                              
age_6_other = dbldata(indice_6_other,2)             // 39.571429
mean(age_6_other)                                   
exp_6_other = dbldata(indice_6_other,6)             //16.428571
mean(exp_6_other)  