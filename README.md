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

![Alt text](image.png)

2. Donnez sous forme d'histogramme la répartition des niveaux d'études, suivants le genre.
3. Donnez sous forme d'histogramme, les effectifs des 10 professions les plus représentées.
4. Quelle est la profession la plus fréquente des femmes ? des hommes ?
5. Pour chaque niveau d'études, donnez le salaire moyen, l'âge moyen et l'expérience moyenne.
6. Pour chaque genre, donnez le salaire moyen, l'âge moyen et l'expérience moyenne.

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
1. Donnez, sous forme d'histogramme la distribution des salaires, suivant le genre.
2. Tracez un histogramme des salaires moyens suivants le niveau d'études.
3. Donnez les quartiles, interquatiles, min,max, moyenne, mediane, et ecart type des salaires. Tracez une 
   boite à moustaches.
4. Refaire la question précédente, en distingant les genres. Tracez une boîte à moustache pour chaque genre. Commentaires ? 

# ExO4 
1. Tracez un nuage de points (age,salaire), et la droite de regression correspondante. Quel est le coefficient de corrélation ?
--> // Charger les données depuis le fichier CSV

--> data = csvRead('data.csv');

--> // Extraire les colonnes pertinentes (âge et salaire)

--> age = data(:, 2);

--> salaire = data(:, 7);

--> // Vérifier les dimensions

--> disp(size(age));

   6699.   1.

--> disp(size(salaire));

   6699.   1.

--> clf;

--> // Tracer le nuage de points avec les vraies données

--> scatter(age, salaire, 10, 'filled');

--> xlabel('Age');

--> ylabel('Salaire');

--> title('Nuage de points : Age vs Salaire');

--> A = [ones(length(age), 1), age];

--> coefficients = A \ salaire;

--> salaire_pred = A * coefficients;

--> // Tracer la droite de régression

--> plot(age, salaire, '+'); // Tracer le nuage de points

--> plot(age, salaire_pred, '-r'); // Tracer la droite de régression

--> legend(['Données', 'Droite de régression'], 'Location', 'northwest');

--> // Calcul manuel du coefficient de corrélation

--> mean_age = mean(age);

--> mean_salaire = mean(salaire);

--> numerateur = sum((age - mean_age) .* (salaire - mean_salaire));

--> denominateur = sqrt(sum((age - mean_age).^2) * sum((salaire - mean_salaire).^2));

--> correlation_coefficient = numerateur / denominateur;

--> // Affichage du coefficient de corrélation

--> disp('Le coefficient de corrélation est :');

  "Le coefficient de corrélation est :"

--> disp(correlation_coefficient);

   0.9376936

2. Tracez un nuage de points (expérience,salaire), et la droite de regression correspondante. Quel est le coefficient de corrélation ?

data = csvRead("data.csv"); 

--> experience = data(:, 6);

--> salaire = data(:, 7); 

--> n = length(experience);

--> sum_x = sum(experience);

--> sum_y = sum(salaire);

--> sum_xy = sum(experience .* salaire);

--> sum_x2 = sum(experience.^2);

--> b = (n * sum_xy - sum_x * sum_y) / (n * sum_x2 - sum_x^2);

--> a = (sum_y - b * sum_x) / n;

--> clf; // Clear the figure

--> plot(experience, salaire, 'bo'); // 'bo' pour des points bleus

--> xlabel('Expérience (années)');

--> ylabel('Salaire ($)');

--> title('Nuage de points et droite de régression');

--> y_pred = a + b * experience;

--> plot(experience, y_pred, 'r-'); // 'r-' pour une ligne rouge

--> legend(['Données', 'Régression linéaire'], 'location', 'northwest');

--> mean_experience = mean(experience);

--> mean_salaire = mean(salaire);

--> numerator = sum((experience - mean_experience) .* (salaire - mean_salaire));

--> denominator = sqrt(sum((experience - mean_experience).^2) * sum((salaire - mean_salaire).^2));

--> correlation = numerator / denominator;

--> disp("Coefficient de corrélation : " + string(correlation));

  "Coefficient de corrélation : 0.8089689"


# ExO5 
1. Tracez un nuage de points (salaire,expérience) pour les hommes et les femmes, ainsi que les droites de regression associées. Commentaire ?
2. Tracez un nuage de points (salaire,expérince) et les droites de regression associées pour chaque niveau d'études. Commentaire ?


# EXO 1

1. ![Alt text](image.png)