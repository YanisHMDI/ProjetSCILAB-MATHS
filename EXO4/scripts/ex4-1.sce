// Lire les données
data = csvRead('data.csv');

// Extraire les colonnes pertinentes (âge et salaire)
age = data(:, 2);
salaire = data(:, 7);

// Effacer la figure
clf;

// Tracer le nuage de points
plot2d(age, salaire, -1);
xlabel('Age');
ylabel('Salaire');
title('Nuage de points : Age vs Salaire');

// Calculer les coefficients de la droite de régression
[a, b] = reglin(age', salaire');
y_reg = a * age + b;

// Tracer la droite de régression
plot2d(age, y_reg, 5);

// Ajouter une légende
legend(['Données', 'Droite de régression'], 'Location', 'northwest');

// Calcul manuel du coefficient de corrélation
mean_age = mean(age);
mean_salaire = mean(salaire);
numerateur = sum((age - mean_age) .* (salaire - mean_salaire));
denominateur = sqrt(sum((age - mean_age).^2) * sum((salaire - mean_salaire).^2));
correlation_coefficient = numerateur / denominateur;

// Afficher le coefficient de corrélation
disp(msprintf('Le coefficient de corrélation est : %.6f', correlation_coefficient));      //"Le coefficient de corrélation est : 0.728053"