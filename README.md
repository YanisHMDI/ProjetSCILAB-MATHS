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
2. Donnez sous forme d'histogramme la répartition des niveaux d'études, suivants le genre.
3. Donnez sous forme d'histogramme, les effectifs des 10 professions les plus représentées.
4. Quelle est la profession la plus fréquente des femmes ? des hommes ?
5. Pour chaque niveau d'études, donnez le salaire moyen, l'âge moyen et l'expérience moyenne.
6. Pour chaque genre, donnez le salaire moyen, l'âge moyen et l'expérience moyenne.

# EXO2 
1. Donnez sous forme d'histogrammes la distributions des ages.
1. Donnez sous forme d'histogrammes la distributions de l'expérience.
2. Donnez les quartiles, interquatiles, min,max, moyenne, mediane, mode, et ecart type de l'age.
3. A l'aide du paquet stixbox, tracez une boite à moustache pour l'age.
4. Refaire les questions précédentes pour l'expérience.

# EXO3 
1. Donnez, sous forme d'histogramme la distribution des salaires, suivant le genre.
2. Tracez un histogramme des salaires moyens suivants le niveau d'études.
3. Donnez les quartiles, interquatiles, min,max, moyenne, mediane, et ecart type des salaires. Tracez une 
   boite à moustaches.
4. Refaire la question précédente, en distingant les genres. Tracez une boîte à moustache pour chaque genre. Commentaires ? 

# ExO4 
1. Tracez un nuage de points (age,salaire), et la droite de regression correspondante. Quel est le coefficient de corrélation ?
2. Tracez un nuage de points (expérience,salaire), et la droite de regression correspondante. Quel est le coefficient de corrélation ?

# ExO5 
1. Tracez un nuage de points (salaire,expérience) pour les hommes et les femmes, ainsi que les droites de regression associées. Commentaire ?
2. Tracez un nuage de points (salaire,expérince) et les droites de regression associées pour chaque niveau d'études. Commentaire ?


# EXO 1

1. 