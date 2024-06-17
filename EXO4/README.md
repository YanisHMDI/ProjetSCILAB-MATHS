# ExO4 
1. Tracez un nuage de points (age,salaire), et la droite de regression correspondante. Quel est le coefficient de corrélation ?
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


![alt text](4.1-1.png)


2. Tracez un nuage de points (expérience,salaire), et la droite de regression correspondante. Quel est le coefficient de corrélation ?

// Lire les données
data = csvRead("data.csv");

// Extraire les colonnes pertinentes (expérience et salaire)
experience = data(:, 6);
salaire = data(:, 7);

// Calcul des coefficients de la droite de régression
n = length(experience);
sum_x = sum(experience);
sum_y = sum(salaire);
sum_xy = sum(experience .* salaire);
sum_x2 = sum(experience.^2);

b = (n * sum_xy - sum_x * sum_y) / (n * sum_x2 - sum_x^2);
a = (sum_y - b * sum_x) / n;

// Effacer la figure
clf;

// Tracer le nuage de points
plot(experience, salaire, 'b+');
xlabel('Expérience (années)');
ylabel('Salaire ($)');
title('Nuage de points et droite de régression');

// Calculer les valeurs prédites par la droite de régression
y_pred = a + b * experience;

// Tracer la droite de régression
plot(experience, y_pred, 'r-');

// Ajouter une légende
legend(['Données', 'Régression linéaire'], 'location', 'northwest');

// Calcul manuel du coefficient de corrélation
mean_experience = mean(experience);
mean_salaire = mean(salaire);

numerator = sum((experience - mean_experience) .* (salaire - mean_salaire));
denominator = sqrt(sum((experience - mean_experience).^2) * sum((salaire - mean_salaire).^2));
correlation = numerator / denominator;

// Afficher le coefficient de corrélation
disp(msprintf("Coefficient de corrélation : %.6f", correlation));   //"Coefficient de corrélation : 0.808969"

![alt text](4.2-1.png)