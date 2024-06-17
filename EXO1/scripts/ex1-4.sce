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