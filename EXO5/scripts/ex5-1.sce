// Charger les données
dbldata = csvRead('data.csv');
dataS = csvRead('data.csv', [], [], 'string');

// Extraire les colonnes pertinentes (expérience, salaire, sexe)
experience = dbldata(:, 6);
salaire = dbldata(:, 7);
sexe = dataS(:, 3); 

// Séparer les données pour les hommes
id_male = find(sexe == 'Male');
salaire_male = salaire(id_male);
exp_male = experience(id_male);

// Calcul de la régression linéaire pour les hommes (méthode des moindres carrés)
X_hommes = [ones(length(salaire_male), 1), salaire_male];
coeffs_hommes = X_hommes \ exp_male;
exp_pred_hommes = X_hommes * coeffs_hommes;

// Séparer les données pour les femmes
id_female = find(sexe == 'Female');
salaire_female = salaire(id_female);
exp_female = experience(id_female);

// Calcul de la régression linéaire pour les femmes (méthode des moindres carrés)
X_femmes = [ones(length(salaire_female), 1), salaire_female];
coeffs_femmes = X_femmes \ exp_female;
exp_pred_femmes = X_femmes * coeffs_femmes;

// Tracer le nuage de points et les droites de régression
clf;

plot(salaire_male, exp_male, 'b+'); // Nuage de points pour les hommes
plot(salaire_male, exp_pred_hommes, 'b-'); // Droite de régression pour les hommes

plot(salaire_female, exp_female, 'r+'); // Nuage de points pour les femmes
plot(salaire_female, exp_pred_femmes, 'r-'); // Droite de régression pour les femmes

xlabel('Salaire ($)');
ylabel('Expérience (années)');
title('Nuage de points et droites de régression par sexe');
legend(['Hommes', 'Régression Hommes', 'Femmes', 'Régression Femmes'], 'location', 'northwest');