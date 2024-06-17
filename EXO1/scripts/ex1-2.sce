genre_lvl = [dataS(:,3),dataS(:,4)]                                  // Crée une matrice 6699x2 avec les genres et le niveau d'études

high_homme = length(find(genre_lvl(:,2) == "0" & genre_lvl(:,1) == "Male"))     // Nombre d'hommes avec un niveau d'étude de 0 (185)
high_femme = length(find(genre_lvl(:,2) == "0" & genre_lvl(:,1) == "Female"))   // Nombre de femmes avec un niveau d'étude de 0 (251)
high_autre = length(find(genre_lvl(:,2) == "0" & genre_lvl(:,1) == "Other"))    // Nombre d'autres genres avec un niveau d'étude de 0 (12)

b_homme = length(find(genre_lvl(:,2) == "1" & genre_lvl(:,1) == "Male"))        // Nombre d'hommes avec un niveau d'étude de 1 (1823)
b_femme = length(find(genre_lvl(:,2) == "1" & genre_lvl(:,1) == "Female"))      // Nombre de femmes avec un niveau d'étude de 1 (1198)
b_autre = length(find(genre_lvl(:,2) == "1" & genre_lvl(:,1) == "Other"))       // Nombre d'autres genres avec un niveau d'étude de 1 (0)

m_homme = length(find(genre_lvl(:,2) == "2" & genre_lvl(:,1) == "Male"))        // Nombre d'hommes avec un niveau d'étude de 2 (790)
m_femme = length(find(genre_lvl(:,2) == "2" & genre_lvl(:,1) == "Female"))      // Nombre de femmes avec un niveau d'étude de 2 (1068)
m_autre = length(find(genre_lvl(:,2) == "2" & genre_lvl(:,1) == "Other"))       // Nombre d'autres genres avec un niveau d'étude de 2 (2)

d_homme = length(find(genre_lvl(:,2) == "3" & genre_lvl(:,1) == "Male"))        // Nombre d'hommes avec un niveau d'étude de 3 (873)
d_femme = length(find(genre_lvl(:,2) == "3" & genre_lvl(:,1) == "Female"))      // Nombre de femmes avec un niveau d'étude de 3 (496)
d_autre = length(find(genre_lvl(:,2) == "3" & genre_lvl(:,1) == "Other"))       // Nombre d'autres genres avec un niveau d'étude de 3 (0)

temp = [high_homme, high_femme, high_autre;b_homme, b_femme, b_autre;m_homme, m_femme, m_autre;d_homme, d_femme, d_autre]   // Crée un tableau 
lvlEtude = [0,1,2,3]
bar(lvlEtude,temp)
legend("homme","femme","autre")