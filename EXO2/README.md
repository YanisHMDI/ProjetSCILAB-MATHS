# EXO2 



// 1.
ages = tabul(dbldata(:, 2)); // Récupère la liste des âges et leurs occurrences
figure;                       // Nouvelle figure
bar(ages(:, 1), ages(:, 2));  // Affiche un histogramme des âges
xlabel('Âge');
ylabel('Fréquence');
title('Répartition des âges dans l''échantillon');

![alt text](2.1.1-1.png)

// 2.
exp = tabul(dbldata(:, 6));    // Récupère la liste des expériences et leurs occurrences
figure;                        // Nouvelle figure
bar(exp(:, 1), exp(:, 2));     // Affiche un histogramme des expériences
xlabel('Expérience (années)');
ylabel('Fréquence');
title('Répartition de l''expérience dans l''échantillon');

![alt text](2.1.2-1.png)

// 3.
mean(dbldata(:,2))                                    //moyenne  =  33.622033
min(dbldata(:,2))                                     //min      =  21
max(dbldata(:,2))                                     //max      =  62
median(dbldata(:,2))                                  //médianne  =  32
quart(dbldata(:,2))                                   //quartile  = 28.32.38.
iqr(dbldata(:,2))                                     //interquartile = 10
stdev(dbldata(:,2))                                   //ecart-type = 7.6156456

age = tabul(dbldata(:,2))                             //récupère la liste des âges et leurs occurrences
[occurence_tri, indice_tri] = gsort(age(:,2))         //trie les occurrences et récupère les indices
liste_age = age(:,1)                                  //liste des âges
mode = liste_age(indice_tri(1))                       //mode =27  

// 4.
atomsInstall("stixbox")                               //installe le module stixbox
atomsLoad("stixbox")                                  //charge le module stixbox
boxplot(dbldata(:, 2), "orientation", "horizontal"); // Affiche un boxplot des âges
xlabel('Âge');                  // Étiquette de l'axe des x
title('Distribution des âges dans l''échantillon'); // Titre du graphique

![alt text](2.4-1.png)

// 5. 

mean(dbldata(:,6))                                    //moyenne  =  8.0950142
min(dbldata(:,6))                                     //min  =  0
max(dbldata(:,6))                                     //max  =   34
median(dbldata(:,6))                                  //médianne = 7
quart(dbldata(:,6))                                   //quartile  = [3.7.12]
iqr(dbldata(:,6))                                     //interquartile = 9
stdev(dbldata(:,6))                                   //ecart-type =  6.0598534

exp = tabul(dbldata(:,6))                             //récupère la liste des expériences et leurs occurrences
[occurence_tri, indice_tri] = gsort(exp(:,2))         //trie les occurrences et récupère les indices
liste_exp = exp(:,1)                                  //liste des expériences
mode = liste_exp(indice_tri(1))                       //mode = 2

atomsInstall("stixbox")                               //installe le module stixbox
atomsLoad("stixbox")                                  //charge le module stixbox
boxplot(dbldata(:, 6), "orientation", "horizontal"); // Affiche un boxplot des expériences
xlabel('Expérience (années)');  // Étiquette de l'axe des x
title('Distribution des expériences dans l''échantillon'); // Titre du graphique

![alt text](2.5-1.png)

# EXO2

## Table des matières
1. [Répartition des genres](#q1)
2. [Répartition des niveaux d'études suivant le genre](#q2)
3. [Effectifs des 10 professions les plus représentées](#q3)
4. [La profession la plus fréquente](#q4)
5. [Salaire moyen, l'âge moyen et l'expérience moyenne suivant le niveau d'étude](#q5)

---

## Question 1 {#q1}

> Donnez sous forme d'histogrammes la distributions des ages.

**[Script Scilab](scripts/ex2-1.sce) :**

```scilab
genre = tabul(dataS(:,3),"i")                        
genre(1)                                             
genre(2)                                             
pie(genre(2),genre(1)) 
```

**Résultat :**

![Représentation des genres en fonction de leur occurrences](img/1.1-1.png)
![Représentation des genres en fonction de leur occurrences en pourcentage](img/1.1.png)

---

## Question 2 {#q2}

> Donnez sous forme d'histogrammes la distributions de l'expérience.

**[Script Scilab](scripts/ex2-2.sce) :**

```scilab
genre_lvl = [dataS(:,3),dataS(:,4)]                                 

high_homme = length(find(genre_lvl(:,2) == "0" & genre_lvl(:,1) == "Male"))    
high_femme = length(find(genre_lvl(:,2) == "0" & genre_lvl(:,1) == "Female"))   
high_autre = length(find(genre_lvl(:,2) == "0" & genre_lvl(:,1) == "Other"))    

b_homme = length(find(genre_lvl(:,2) == "1" & genre_lvl(:,1) == "Male"))        
b_femme = length(find(genre_lvl(:,2) == "1" & genre_lvl(:,1) == "Female"))      
b_autre = length(find(genre_lvl(:,2) == "1" & genre_lvl(:,1) == "Other"))       

m_homme = length(find(genre_lvl(:,2) == "2" & genre_lvl(:,1) == "Male"))        
m_femme = length(find(genre_lvl(:,2) == "2" & genre_lvl(:,1) == "Female"))      
m_autre = length(find(genre_lvl(:,2) == "2" & genre_lvl(:,1) == "Other"))       

d_homme = length(find(genre_lvl(:,2) == "3" & genre_lvl(:,1) == "Male"))        
d_femme = length(find(genre_lvl(:,2) == "3" & genre_lvl(:,1) == "Female"))      
d_autre = length(find(genre_lvl(:,2) == "3" & genre_lvl(:,1) == "Other"))       

temp = [high_homme, high_femme, high_autre;b_homme, b_femme, b_autre;m_homme, m_femme, m_autre;d_homme, d_femme, d_autre]   // Crée un tableau 
lvlEtude = [0,1,2,3]
bar(lvlEtude,temp)
legend("homme","femme","autre")
```

**Résultat :**

![Histogramme de la répartition des niveau d'études suivant le genre](img/1.2-1.png)

---

## Question 3 {#q3}

> Donnez les quartiles, interquatiles, min,max, moyenne, mediane, mode, et ecart type de l'age.

**[Script Scilab](scripts/ex2-3.sce) :**

```scilab
metiers = tabul(dataS(:,5),"i")                                 
[occu,indice] = gsort(metiers(2))                               
profession = metiers(1)                                         
matrice_occurence = [occu(1:1),occu(2:2),occu(3:3),occu(4:4),occu(5:5),occu(6:6),occu(7:7),occu(8:8),occu(9:9),occu(10:10)]
bar(1,matrice_occurence)                                        
legend(profession(indice(1:10)))                                
```
**Résultat :**

![Histogramme représentant l'effectif des 10 professions les plus représentées](img/1.3.png)

---

## Question 4 {#q4}

> A l'aide du paquet stixbox, tracez une boite à moustache pour l'age.

**[Script Scilab](scripts/ex2-4.sce) :**

```scilab
indice_female = find(dataS(:,3) == "Female")        
[valeurs] = dataS(indice_female,5)                  
metiers_female = tabul(valeurs)                    
[occurence_tri,indice_tri] = gsort(metiers_female(2))   
liste_metiers_female = metiers_female(1)            
liste_metiers_female(119)                           

                                                    

indice_male = find(dataS(:,3) == "Male")            
[valeurs2] = dataS(indice_male,5)                   
metiers_male = tabul(valeurs2)                      
[occurence_tri,indice_tri] = gsort(metiers_male(2)) 
liste_metiers_male = metiers_male(1)                
liste_metiers_male(11)                              

                                                    
```

**Résultat :**

- Homme : Software Engineer

- Femme : Data Scientist


---

## Question 5 {#q5}

> Refaire les questions précédentes pour l'expérience.

**[Script Scilab](scripts/ex2-5.sce) :**

```scilab
indice_high = find(dbldata(:,4) == 0)
salaire_high = dbldata(indice_high,7)
mean(salaire_high)                                  
age_high = dbldata(indice_high,2)
mean(age_high)                                      
exp_high = dbldata(indice_high,6)
mean(exp_high)                                      

indice_b = find(dbldata(:,4) == 1)
salaire_b = dbldata(indice_b,7)
mean(salaire_b)                                     
age_b = dbldata(indice_b,2)
mean(age_b)                                         
exp_b = dbldata(indice_b,6)
mean(exp_b)                                         

indice_m = find(dbldata(:,4) == 2)
salaire_m = dbldata(indice_m,7)
mean(salaire_m)                                     
age_m = dbldata(indice_m,2)
mean(age_m)                                         
exp_m = dbldata(indice_m,6)
mean(exp_m)                                         

indice_p = find(dbldata(:,4) == 3)
salaire_p = dbldata(indice_p,7)
mean(salaire_p)                                     
age_p = dbldata(indice_p,2)
mean(age_p)                                         
exp_p = dbldata(indice_p,6)
mean(exp_p)                                         
```

**Résultat :**

// 36706.694
// 26.854911
// 1.9151786

// 95082.909
// 30.260179
// 5.4195631

// 130112.06
// 35.171505
// 9.6456989

// 165651.46
// 41.154858
// 13.915267

---


[⬅️](../EXO1/ "Exercice précédent (Exercice 1)") | [🏠](../ "Retour au sommaire") | [➡️](../EXO3/ "Exercice suivant (Exercice 3)")
