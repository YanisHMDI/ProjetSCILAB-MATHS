# SAÉ S2.04 (visualisation de données)

Le fichier [data.csv](data/data.csv)  contient une base de données des salariés d'une entreprise : pour chacun, on dispose de :

- id 
- age
- niveau d'éducation
- intitulé du métier
- nombre d'années d'expérience
- salaire

Le niveau d'éducation est codé par un entier :

| valeur      | niveau | 
| :---        |    :----   |  
| 0 | High School	|
| 1 | Bachelor |
| 2 | Master |
| 3 | PhD |

# Attendus 
> La saé est à réaliser en binôme. Vous devez m'envoyer un [mail](mailto:monnerat@u-pec.fr) (objet : [SAE]) avec :
> - les noms du binôme,
> - l'url du dépôt git.

Vous devez produire : 

- Les script(s) scilab qui calculent/affichent les réponses demandées.
- Un compte rendu en markdown sur votre dépot git avec les commandes et les réponses (y compris les graphes).

**Le tout est à rendre au plus tard  le 17 juin (23h59).**

# EXO 1 
1. Donnez sous forme de camembert la répartition des genres.

--> data = csvRead('data.csv');

--> FM = csvRead('data.csv',',','.','string')

--> genres = FM(:, 3);

--> nb_hommes = sum(genres == 'Male'); // Nombre d'hommes

--> nb_femmes = sum(genres == "Female"); // Nombre de femmes

--> nb_other = sum(genres == "Other"); // Nombre de Other

--> pie([nb_hommes, nb_femmes ,nb_other]);



2. Donnez sous forme d'histogramme la répartition des niveaux d'études, suivants le genre.

Donnez sous forme d'histogramme la répartition des niveaux d'études, suivants le genre.
// Charger les données à partir du fichier CSV
data_nbr = csvRead('data.csv');
data_txt = csvRead('data.csv', [], [], 'string');

// Extraire les colonnes de genre et de niveau d'éducation
genders = data_txt(:, 3);
education_levels = data_nbr(:, 4);

// Afficher les données pour débogage
disp(genders);
disp(education_levels);

// Listes des niveaux d'études disponibles (par exemple, "bachelor", "master", "Phd")
education_types = ['0','1', '2', '3'];

// Compter le nombre de diplômés pour chaque combinaison de genre et de niveau d'études
male_HS = sum(genders == 'Male' & education_levels == 0);
male_bachelor = sum(genders == 'Male' & education_levels == 1);
male_master = sum(genders == 'Male' & education_levels == 2);
male_Phd = sum(genders == 'Male' & education_levels == 3);

female_HS = sum(genders == 'Female' & education_levels == 0);
female_bachelor = sum(genders == 'Female' & education_levels == 1);
female_master = sum(genders == 'Female' & education_levels == 2);
female_Phd = sum(genders == 'Female' & education_levels == 3);

other_HS = sum(genders == 'Other' & education_levels == 0);
other_bachelor = sum(genders == 'Other' & education_levels == 1);
other_master = sum(genders == 'Other' & education_levels == 2);
other_Phd = sum(genders == 'Other' & education_levels == 3);

// Afficher les comptes pour débogage
disp("Hommes : HS=" + string(male_HS) + ", Bachelor=" + string(male_bachelor) + ", Master=" + string(male_master) + ", PhD=" + string(male_Phd));
disp("Femmes : HS=" + string(female_HS) + ", Bachelor=" + string(female_bachelor) + ", Master=" + string(female_master) + ", PhD=" + string(female_Phd));
disp("Autres : HS=" + string(other_HS) + ", Bachelor=" + string(other_bachelor) + ", Master=" + string(other_master) + ", PhD=" + string(other_Phd));

// Pour les hommes
male_data = [male_HS, male_bachelor, male_master, male_Phd];

// Pour les femmes
female_data = [female_HS, female_bachelor, female_master, female_Phd];

// Pour les autres genres
other_data = [other_HS, other_bachelor, other_master, other_Phd];

// Création du graphique à barres groupées
bar([male_data' female_data' other_data']);
title("Répartition diplôme par genre");
xlabel("Niveau education");
ylabel("Nombre de diplômés");

// Définir les étiquettes sur l'axe x
xtick_labels = ["HS", "Bachelor", "Master", "PhD"];
xtitle(xtick_labels);

// Ajouter une légende pour chaque groupe de barres
legend(["Hommes", "Femmes", "Autres"]);
  	xs2png(0, "images/ex2.png");






3. Donnez sous forme d'histogramme, les effectifs des 10 professions les plus représentées.
Donnez sous forme d'histogramme, les effectifs des 10 professions les plus représentées.
// Charger les données à partir du fichier CSV
data_txt = csvRead('data.csv', [], [], 'string');

// Extraire la colonne des professions (supposons qu'elle soit la 5ème colonne)
professions = data_txt(:, 5);

// Trouver les professions uniques et compter les occurrences
[unique_professions, idx] = unique(professions, "r");
counts = zeros(size(unique_professions, 1), 1);

for i = 1:size(unique_professions, 1)
    counts(i) = sum(strcmp(professions, unique_professions(i)));
end

// Trier les professions par ordre décroissant d'effectifs
[sorted_counts, sort_idx] = gsort(counts, "g");
sorted_professions = unique_professions(sort_idx);

// Sélectionner les 10 professions les plus représentées
top_10_counts = sorted_counts(1:10);
top_10_professions = sorted_professions(1:10);

// Afficher les comptes pour débogage
for i = 1:10
    disp("Profession: " + top_10_professions(i) + ", Effectifs: " + string(top_10_counts(i)));
end

// Création de l'histogramme
bar(top_10_counts);
title("Effectifs des 10 professions les plus représentées");
xlabel("Professions");
ylabel("Nombre de personnes");

// Rotation des étiquettes sur l'axe x pour une meilleure lisibilité
set(gca(), "xticklabels", top_10_professions);
xtitle(top_10_professions);
set(gca(), "x_tick_angle", 45);
xs2png(0, "images/ex3.png");







4. Quelle est la profession la plus fréquente des femmes ? des hommes ?
// Charger les données à partir du fichier CSV
data_txt = csvRead('data.csv', [], [], 'string');

// Extraire les colonnes des genres et des professions (supposons qu'elles soient la 3ème et la 5ème colonne respectivement)
genders = data_txt(:, 3);
professions = data_txt(:, 5);

// Trouver les index des entrées pour chaque genre
idx_female = find(genders == 'Female');
idx_male = find(genders == 'Male');

// Extraire les professions pour chaque genre
professions_female = professions(idx_female);
professions_male = professions(idx_male);

// Trouver les professions les plus fréquentes pour chaque genre
function [most_frequent_profession] = find_most_frequent_profession(professions)
    [unique_professions, idx] = unique(professions, "r");
    counts = zeros(size(unique_professions, 1), 1);
    for i = 1:size(unique_professions, 1)
        counts(i) = sum(strcmp(professions, unique_professions(i)));
    end

    [max_count, max_idx] = max(counts);
    most_frequent_profession = unique_professions(max_idx);
endfunction

most_frequent_profession_female = find_most_frequent_profession(professions_female);
most_frequent_profession_male = find_most_frequent_profession(professions_male);

// Afficher les professions les plus fréquentes pour chaque genre
disp("La profession la plus fréquente des femmes est : " + most_frequent_profession_female);
disp("La profession la plus fréquente des hommes est : " + most_frequent_profession_male);






5. Pour chaque niveau d'études, donnez le salaire moyen, l'âge moyen et l'expérience moyenne.
// Charger les données à partir du fichier CSV
data_nbr = csvRead('data.csv');
data_txt = csvRead('data.csv', [], [], 'string');

// Afficher les premières lignes des données pour débogage
disp(data_nbr(1:5, :));
disp(data_txt(1:5, :));

// Extraire les colonnes des niveaux d'études, des salaires, des âges et des années d'expérience
education_levels = data_nbr(:, 4);
salaries = data_nbr(:, 7);
ages = data_nbr(:, 2);
experience_years = data_nbr(:, 6);

// Liste des niveaux d'études disponibles (par exemple, "Bachelor", "Master", "Phd")
education_levels = ['0', '1', '2', '3'];

// Initialiser des vecteurs pour stocker les moyennes
mean_salaries = zeros(4, 1);
mean_ages = zeros(4, 1);
mean_experience_years = zeros(4, 1);

// Boucle sur chaque niveau d'études
for i = 1:4
    // Indices des entrées pour ce niveau d'études
    idx = find(education_levels == education_levels(i));
    
    // Afficher les indices pour débogage
    disp("Indices pour le niveau etudes " + education_levels(i) + " : ");
    disp(idx);
    
    // Calcul des moyennes pour ce niveau d'études
    mean_salaries(i) = mean(salaries(idx));
    mean_ages(i) = mean(ages(idx));
    mean_experience_years(i) = mean(experience_years(idx));
end

// Afficher les moyennes pour chaque niveau d'études
for i = 1:4
    disp("Niveau etudes : " + string(education_types(i)));
    disp("Salaire moyen : " + string(mean_salaries(i)));
    disp(" ge moyen : " + string(mean_ages(i)));
    disp("Expérience moyenne (en années) : " + string(mean_experience_years(i)));
    disp(" ");
end




6. Pour chaque genre, donnez le salaire moyen, l'âge moyen et l'expérience moyenne.

// Charger les données à partir du fichier CSV
data_txt = csvRead('data.csv', [], [], 'string');
data_nbr = csvRead('data.csv');

// Extraire les colonnes de genre, salaire, âge et expérience
genders = data_txt(:, 3);
salaries = data_nbr(:, 7);
ages = data_nbr(:, 2);
experience_years = data_nbr(:, 6);

// Liste des genres disponibles
gender_types = ["Male", "Female", "Other"];

// Initialiser des vecteurs pour stocker les moyennes
mean_salaries = zeros(3, 1);
mean_ages = zeros(3, 1);
mean_experience_years = zeros(3, 1);

// Boucle sur chaque genre
for i = 1:3
	// Indices des entrées pour ce genre
	idx = find(genders == gender_types(i));
    
	// Calcul des moyennes pour ce genre
	mean_salaries(i) = mean(salaries(idx));
	mean_ages(i) = mean(ages(idx));
	mean_experience_years(i) = mean(experience_years(idx));
end

// Afficher les moyennes pour chaque genre
for i = 1:3
	disp("Genre : " + string(gender_types(i)));
	disp("Salaire moyen : " + string(mean_salaries(i)));
	disp(" ge moyen : " + string(mean_ages(i)));
	disp("Expérience moyenne (en années) : " + string(mean_experience_years(i)));
	disp(" ");
end









# EXO2 
Donnez sous forme d'histogrammes la distributions des ages.
Je crée d'abord un tableau pour la catégorie age : age = D(:, 2);
Je cherche ensuite l'age maximum et l'age minimum pour déterminer un intervalle :
min_age = min(age); (j'ai trouvé 62)
max_age = max(age);  (j'ai trouvé 21)
Il existe donc 41 age différents. Ensuite je peux tracer mon histogramme. 
histplot(41,age);

Donnez sous forme d'histogrammes la distributions de l'expérience.
Je suis le même raisonnement que celui de l'age. 
exp = D(:,6);
min_xp = min(exp);
max_xp = max(exp);
histplot(34,exp);
Donnez les quartiles, interquatiles, min,max, moyenne, mediane, mode, et ecart type de l'age.
quartiles : Q = quart(age) (Q1=28, Q2=32, Q3=38)
min : min_age = min(age); (=21)
max : max_age = max(age); (=42)
moyenne : mean(age) (environ 34)
médiane : median(age) (=32)
mode : Je cherche d'abord les valeurs uniques --> unique_vals = unique(age);
       Ensuite, compte les occurences de chaque valeur unique --> freq = histc(ages, unique_vals);
       Je cherche ensuite l'indice de la valeur la plus fréquente --> [max_freq, max_index] = max(freq);
       Je peux ensuite trouver la valeur du mode --> age_mode = unique_vals(max_index);





A l'aide du paquet stixbox, tracez une boite à moustache pour l'age.
J'installe d'abord stixbox : atomsInstall("stixbox");
Pour tracer le graphique, j'utilise la commande :
 boxplot(age);

Refaire les questions précédentes pour l'expérience.
Refaire les questions précédentes pour l'expérience.
quartiles : Q = quart(exp) (Q1=3, Q2=7, Q3=12)
min : min_xp = min(exp); (=0)
max : max_xp = max(exp); (=34)
moyenne : mean(exp) (environ 8)
médiane : median(exp) (=7)
mode : Je cherche d'abord les valeurs uniques --> Unique_vals = unique(exp);
       Ensuite, compte les occurences de chaque valeur unique --> Freq = histc(exp, Unique_vals);
       Je cherche ensuite l'indice de la valeur la plus fréquente --> [max_Freq, max_Index] = max(Freq);
       Je peux ensuite trouver la valeur du mode --> exp_mode = Unique_vals(max_Index); (=1,5)

# EXO3 
Pour cette exo on a besoin de ça :
D = csvRead('data.csv');
DD = csvRead('data.csv',',','.','string');
genre = DD(:,3);
1. Donnez, sous forme d'histogramme la distribution des salaires, suivant le genre.

D_homme = D(genre == 'Male',:);
D_femme = D(genre == 'Female',:);
salaire_homme = D_homme(:,7);
salaire_femme = D_femme(:,7);
subplot(2, 1, 1);
histplot(num_bins, salaire_homme);
title("Distribution des salaires pour les hommes");
xlabel("Salaire");
ylabel("Fréquence");

subplot(2, 1, 2); 
histplot(num_bins, salaire_femme);
title("Distribution des salaires pour les femmes");
xlabel("Salaire");
ylabel("Fréquence");

2. Tracez un histogramme des salaires moyens suivants le niveau d'études.

niveau_etudes = D(:, 4);
salaires = D(:, 7);
unique_niveaux = unique(niveau_etudes);
moy_salaire_par_niveau = zeros(size(unique_niveaux));

for i = 1:length(unique_niveaux)
    moy_salaire_par_niveau(i) = mean(salaires(niveau_etudes == unique_niveaux(i)));
end

bar(unique_niveaux, moy_salaire_par_niveau);

xlabel("Niveau d''études");
ylabel("Salaire moyen");
title("Salaire moyen par niveau d''études");

3. Donnez les quartiles, interquatiles, min,max, moyenne, mediane, et ecart type des salaires. Tracez une 
   boite à moustaches.

Q = quart(salaires)
IQR = Q(3) - Q(1);
min_salaire = min(salaires)
max_salaire = max(salaires)
mean(salaires)
median(salaires)
stdev(salaires)
boxplot(salaires)


4. Refaire la question précédente, en distingant les genres. Tracez une boîte à moustache pour chaque genre. Commentaires ? 
QH = quart(salaire_homme)  
QF = quart(salaire_femme)
IQH = QH(3) - QH(1)   
IQF = QF(3) - QF(1)
 min(salaire_homme)  
min(salaire_femme)   
max(salaire_homme)   
max(salaire_femme)   
mean(salaire_homme) 
mean(salaire_femme)  
median(salaire_homme) 
median(salaire_femme)  
stdev(salaire_homme) 
stdev(salaire_femme) 

boite à moustache : 
boxplot(salaire_homme);
title("Boîte à moustaches des salaires des hommes");
ylabel("Salaires");

boxplot(salaire_femme);
title("Boîte à moustaches des salaires des femmes");
ylabel("Salaires");

# ExO4 
1. Tracez un nuage de points (age,salaire), et la droite de regression correspondante. Quel est le coefficient de corrélation ?
// Charger les données depuis le fichier CSV

data = csvRead('data.csv');

// Extraire les colonnes pertinentes (âge et salaire)

age = data(:, 2);

salaire = data(:, 7);

// Vérifier les dimensions

disp(size(age));
disp(size(salaire)),;

clf;

// Tracer le nuage de points avec les vraies données

scatter(age, salaire, 10, 'filled');

xlabel('Age');

ylabel('Salaire');

title('Nuage de points : Age vs Salaire');

A = [ones(length(age), 1), age];

coefficients = A \ salaire;

salaire_pred = A * coefficients;

// Tracer la droite de régression

plot(age, salaire, '+'); // Tracer le nuage de points

plot(age, salaire_pred, '-r'); // Tracer la droite de régression

legend(['Données', 'Droite de régression'], 'Location', 'northwest');

// Calcul manuel du coefficient de corrélation

mean_age = mean(age);

mean_salaire = mean(salaire);

numerateur = sum((age - mean_age) .* (salaire - mean_salaire));

denominateur = sqrt(sum((age - mean_age).^2) * sum((salaire - mean_salaire).^2));

correlation_coefficient = numerateur / denominateur;

// Affichage du coefficient de corrélation

disp('Le coefficient de corrélation est :');

disp(correlation_coefficient);

   0.9376936

2. Tracez un nuage de points (expérience,salaire), et la droite de regression correspondante. Quel est le coefficient de corrélation ?

data = csvRead("data.csv"); 

experience = data(:, 6);

salaire = data(:, 7); 

n = length(experience);

sum_x = sum(experience);

sum_y = sum(salaire);

sum_xy = sum(experience .* salaire);

sum_x2 = sum(experience.^2);

b = (n * sum_xy - sum_x * sum_y) / (n * sum_x2 - sum_x^2);

a = (sum_y - b * sum_x) / n;

clf; // Clear the figure

plot(experience, salaire, 'b+'); // 'bo' pour des points bleus

xlabel('Expérience (années)');

ylabel('Salaire ($)');

title('Nuage de points et droite de régression');

y_pred = a + b * experience;

plot(experience, y_pred, 'r-'); 

legend(['Données', 'Régression linéaire'], 'location', 'northwest');

mean_experience = mean(experience);

mean_salaire = mean(salaire);

numerator = sum((experience - mean_experience) .* (salaire - mean_salaire));

denominator = sqrt(sum((experience - mean_experience).^2) * sum((salaire - mean_salaire).^2));

correlation = numerator / denominator;

disp("Coefficient de corrélation : " + string(correlation));

"Coefficient de corrélation : 0.8089689"


# ExO5 
1. Tracez un nuage de points (salaire,expérience) pour les hommes et les femmes, ainsi que les droites de regression associées. Commentaire ?

 // Charger les données
data_nbr = csvRead('data.csv');

data_txt = csvRead('data.csv', [], [], 'string');

// Extraire les colonnes pertinentes (expérience, salaire, sexe)

experience = data_nbr(:, 6);

salaire = data_nbr(:, 7);

sexe = data_txt(:, 3); 

// Séparer les données pour les hommes et les femmes

experience_hommes = experience(sexe == 'Male');

salaire_hommes = salaire(sexe == 'Male');

experience_femmes = experience(sexe == 'Female');

salaire_femmes = salaire(sexe == 'Female');

// Calcul de la régression linéaire pour les hommes (méthode des moindres carrés)

X_hommes = [ones(length(experience_hommes), 1), experience_hommes];

coeffs_hommes = X_hommes \ salaire_hommes;

salaire_pred_hommes = X_hommes * coeffs_hommes; 

// Calcul de la régression linéaire pour les femmes (méthode des moindres carrés)

X_femmes = [ones(length(experience_femmes), 1), experience_femmes];

coeffs_femmes = X_femmes \ salaire_femmes;

salaire_pred_femmes = X_femmes * coeffs_femmes; 

// Tracer le nuage de points et les droites de régression

clf;

plot(experience_hommes, salaire_hommes, 'bo'); // Nuage de points pour les hommes

plot(experience_hommes, salaire_pred_hommes, 'b-'); // Droite de régression pour les hommes

plot(experience_femmes, salaire_femmes, 'ro'); // Nuage de points pour les femmes

plot(experience_femmes, salaire_pred_femmes, 'r-'); // Droite de régression pour les femmes

xlabel('Expérience (années)');

ylabel('Salaire ($)');

title('Nuage de points et droites de régression par sexe');

legend(['Hommes', 'Régression Hommes', 'Femmes', 'Régression Femmes'], 'location', 'northwest');


2. Tracez un nuage de points (salaire,expérince) et les droites de regression associées pour chaque niveau d'études. Commentaire ?


// Charger les données
data = csvRead('data.csv');
experience = data(:, 6);
salaire = data(:, 7);
niveau_etudes = data(:, 4); // Supposons que la colonne 4 contient les niveaux d'études

// Obtenir les différents niveaux d'études
niveaux = unique(niveau_etudes);

// Tracer le nuage de points et les droites de régression pour chaque niveau d'études
clf;
for i = 1:length(niveaux)
    niveau = niveaux(i);

    // Sélectionner les indices pour ce niveau d'études
    indices_niveau = find(niveau_etudes == niveau);

    // Sélectionner les données pour ce niveau d'études
    experience_niveau = experience(indices_niveau);
    salaire_niveau = salaire(indices_niveau);

    // Si aucune donnée pour ce niveau, passer au suivant
    if isempty(experience_niveau) || isempty(salaire_niveau)
        continue;
    end

    // Calculer les coefficients de régression linéaire
    X_niveau = [ones(length(experience_niveau), 1), experience_niveau];
    coeffs_niveau = X_niveau \ salaire_niveau;
    salaire_pred_niveau = X_niveau * coeffs_niveau;

    // Tracer le nuage de points et la droite de régression
    subplot(2, 2, i);
    plot(experience_niveau, salaire_niveau, 'o');
    plot(experience_niveau, salaire_pred_niveau, '-');
    xlabel('Expérience (années)');
    ylabel('Salaire ($)');
    title(['Niveau d''études : ', string(niveau)]);
end


# EXO 1

1. ![Alt text](image.png)