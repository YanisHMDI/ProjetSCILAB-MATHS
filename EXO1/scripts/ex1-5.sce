data = csvRead("data.csv");

indice_high = find(dbldata(:,4) == 0)
salaire_high = dbldata(indice_high,7)
mean(salaire_high)                                  // 36706.694
age_high = dbldata(indice_high,2)
mean(age_high)                                      // 26.854911
exp_high = dbldata(indice_high,6)
mean(exp_high)                                      // 1.9151786

indice_b = find(dbldata(:,4) == 1)
salaire_b = dbldata(indice_b,7)
mean(salaire_b)                                     // 95082.909
age_b = dbldata(indice_b,2)
mean(age_b)                                         // 30.260179
exp_b = dbldata(indice_b,6)
mean(exp_b)                                         // 5.4195631

indice_m = find(dbldata(:,4) == 2)
salaire_m = dbldata(indice_m,7)
mean(salaire_m)                                     // 130112.06
age_m = dbldata(indice_m,2)
mean(age_m)                                         // 35.171505
exp_m = dbldata(indice_m,6)
mean(exp_m)                                         // 9.6456989

indice_p = find(dbldata(:,4) == 3)
salaire_p = dbldata(indice_p,7)
mean(salaire_p)                                     // 165651.46
age_p = dbldata(indice_p,2)
mean(age_p)                                         // 41.154858
exp_p = dbldata(indice_p,6)
mean(exp_p)                                         // 13.915267