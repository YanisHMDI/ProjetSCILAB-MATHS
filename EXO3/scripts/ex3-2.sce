data = csvRead("data.csv");

indice_high = find(dbldata(:,4) == 0)
salaire_high = dbldata(indice_high,7)
moy_h = mean(salaire_high)   // moy_h = 36706.694                                     

indice_b = find(dbldata(:,4) == 1)
salaire_b = dbldata(indice_b,7)
moy_b = mean(salaire_b)      // moy_b = 95082.909 

indice_m = find(dbldata(:,4) == 2)
salaire_m = dbldata(indice_m,7)
moy_m = mean(salaire_m)      moy_m = 130112.06     

indice_p = find(dbldata(:,4) == 3)
salaire_p = dbldata(indice_p,7)
moy_p = mean(salaire_p)      moy_p = 165651.46 

                                     

matrice = [moy_h, moy_b, moy_m, moy_p];
bar([0, 1, 2, 3], matrice);

// Ajouter des étiquettes aux axes et un titre
xlabel('Niveau d''études');
ylabel('Salaire moyen ($)');
title('Moyenne des salaires par niveau d''études');