data = csvRead("data.csv");

// Récupère la liste des genres ainsi que leur occurrence (MALE=3672, FEMALE=3013, OTHER=14)
genre = tabul(dataS(:,3),"i") 

// Liste les différents genres du tableau
// Donne l'occurrence correspondant aux valeurs de "genre(1)"

genre(1)                                             
genre(2)

// Ouvre un diagramme camembert représentant les genres en fonction de leur occurrence                                             
pie(genre(2),genre(1))                               