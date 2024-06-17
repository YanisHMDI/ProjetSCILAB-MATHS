data = csvRead("data.csv");

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