// Load data
data = csvRead('data.csv');
experience = data(:, 6);
salaire = data(:, 7);
niveau_etudes = data(:, 4); // Assuming column 4 contains education levels

// Indices for each education level
indice_high = find(niveau_etudes == 0);
indice_b = find(niveau_etudes == 1);
indice_m = find(niveau_etudes == 2);
indice_p = find(niveau_etudes == 3);

// Extract data for each education level
exp_high = experience(indice_high);
salaire_high = salaire(indice_high);
exp_b = experience(indice_b);
salaire_b = salaire(indice_b);
exp_m = experience(indice_m);
salaire_m = salaire(indice_m);
exp_p = experience(indice_p);
salaire_p = salaire(indice_p);

// Clear current figure
clf;

// Plot for education level 0
subplot(2, 2, 1);
plot(exp_high, salaire_high, '+');
[a, b] = reglin(exp_high', salaire_high');
y_reg = a * exp_high + b;
plot(exp_high, y_reg, '-');
xlabel('Experience (years)');
ylabel('Salary ($)');
title('Niveau d''études : 0');

// Plot for education level 1
subplot(2, 2, 2);
plot(exp_b, salaire_b, '+');
[a, b] = reglin(exp_b', salaire_b');
y_reg = a * exp_b + b;
plot(exp_b, y_reg, '-');
xlabel('Experience (years)');
ylabel('Salary ($)');
title('Niveau d''études : 1');

// Plot for education level 2
subplot(2, 2, 3);
plot(exp_m, salaire_m, '+');
[a, b] = reglin(exp_m', salaire_m');
y_reg = a * exp_m + b;
plot(exp_m, y_reg, '-');
xlabel('Experience (years)');
ylabel('Salary ($)');
title('Niveau d''études : 2');

// Plot for education level 3
subplot(2, 2, 4);
plot(exp_p, salaire_p, '+');
[a, b] = reglin(exp_p', salaire_p');
y_reg = a * exp_p + b;
plot(exp_p, y_reg, '-');
xlabel('Experience (years)');
ylabel('Salary ($)');
title('Niveau d''études : 3');