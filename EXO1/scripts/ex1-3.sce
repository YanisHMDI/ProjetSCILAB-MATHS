data = csvRead("data.csv");

metiers = tabul(dataS(:,5),"i")                                 // Récupère la liste des professions ainsi que leur occurrence

[occu,indice] = gsort(metiers(2))                               // Trie les occurrences et récupère les indices

profession = metiers(1)                                         // Stocke la liste des professions dans une variable

matrice_occurence = [occu(1:1),occu(2:2),occu(3:3),occu(4:4),occu(5:5),occu(6:6),occu(7:7),occu(8:8),occu(9:9),occu(10:10)]

bar(1,matrice_occurence)                                        // Affiche un histogramme des 10 professions avec le plus de monde

legend(profession(indice(1:10)))                                // Légende le graphe pour donner un nom à chaque colonne