data = csvRead("data.csv");

exp = tabul(dbldata(:, 6));    // Récupère la liste des expériences et leurs occurrences
figure;                        // Nouvelle figure
bar(exp(:, 1), exp(:, 2));     // Affiche un histogramme des expériences
xlabel('Expérience (années)');
ylabel('Fréquence');
title('Répartition de l''expérience dans l''échantillon');