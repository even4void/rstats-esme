
Le projet consiste à construire un mini système de recommendation avec le logiciel R. Le développement sera réalisé en binôme en utilisant un dépôt Git permettant d'identifier clairement les contributions de chaque membre du binôme.

Vous êtes libres de choisir le jeu de données sur lequel vous souhaitez travailler. Un exemple de données classiques est le jeu de données [Yelp][yelp]. Vous pouvez ramener le jeu de données original à des dimensions qui tiennent facilement en mémoire (min. 5000-10000 évaluations, 250-500 utilisateurs), en détaillant la technique utilisée pour le sous-échantillonnage aléatoire de la base initiale. Le format de la base de données (SQL, JSON, CSV) n'a pas d'importance.

Voici deux exemples de méta-dépôts de sources de données disponibles sur internet, mais il doit en exister d'autres :

- http://shuaizhang.tech/2017/03/15/Datasets-For-Recommender-System/
- https://gist.github.com/entaroadun/1653794

Le jeu de données final doit ressembler aux matrices utilisateur/item classiques mais au lieu de travailler sur la fréquence d'occurence des items, on utilisera un système de "rating" numérique comme pour les données `beers.csv` traitées en TP et en cours. Il faudra donc choisir un jeu de données incluant des évaluations sous forme de commentaires textuels par les utilisateurs pour chacun des items.

Par exemple, le jeu de données [Amazon product data][apd] est un jeu de données répondant à ces caractéristiques puisque les champs stockés contiennent un ID utilisateur (reviewerID), un ID item (asin) et un champ textuel (reviewText) qui peut être analysé par text mining classique (texte anglais)

    {
      "reviewerID": "A2SUAM1J3GNN3B",
      "asin": "0000013714",
      "reviewerName": "J. McDonald",
      "helpful": [2, 3],
      "reviewText": "I bought this for my husband who plays the piano.  He is having a wonderful time playing these old hymns.  The music  is at times hard to read because we think the book was published for singing from more than playing from.  Great purchase though!",
      "overall": 5.0,
      "summary": "Heavenly Highway Hymns",
      "unixReviewTime": 1252800000,
      "reviewTime": "09 13, 2009"
    }

L'idée est de dériver un système de poids numérique pour la matrice utilisateur/item, comme discuté dans le cours ou le 2e TP, mais à partir des évaluations textuelles fournies par les utilisateurs. Pour cela, vous appliquerez une technique d'analyse de sentiment afin de calculer un score continu reflétant la polarité des revues (positive, neutre, négative) basé sur une revue par l'utilisateur de l'item acheté ou évalué. 

Le choix du lexique de codage des sentiments est libre mais vous pouvez vous aider de cette revue technique : [A Pair of Text Analysis Explorations][bing]. Pour le projet, vous utiliserez obligatoirement deux types de scoring (p.ex. AFFIN et Bing, ou Bing et Sentiword). Quelle que soit la technique retenue pour le scoring des évaluations textuelles, il faudra fournir un petit justificatif (2-3 paragraphes) pour le choix du lexique et/ou de l'algorithme de scoring. Les packages listés dans le diaporama #6 sur le "data mining" pourront être utiles, en particulier `{tidytext}`, `{syuzhet}` ou `{sentimentr}`.

Le schéma de construction pour le système de recommendation sera de type UCBF (filtrage collaboratif explicite basé sur les utilisateurs). Pour évaluer la qualité prédictive du modèle, on utilisera la technique de masquage décrire dans l'article ["A Gentle Introduction to Recommender Systems with Implicit Feedback"][girsif] (§ *Creating a Training and Validation Set*) et on vérifiera que le modèle prédit "correctement" les items masqués pour certains utilisateurs. Les valeurs de Precision/Recall (ou F-score, ou n'importe quelle autre mesure utile pour quantifier la qualité de prédiction d'un modèle statistique) seront calculées sur l'échantillon de validation pour chacune des techniques de scoring de sentiment retenues (cf. paragraphe précédent).

En d'autres termes, l'analyse consistera à résumer l'évaluation textuelle d'un item à l'aide d'un score numérique calculé de deux manières différentes et à évaluer les performances prédictives du modèle de recommendation sur un échantillon de validation (dérivé *via* technique de masking) dans les deux cas de figure. Une discussion critique des résultats est attendue (max. 1 page).

Le rendu de projet inclura : (1) un mini rapport (3-4 pages) décrivant les principales étapes de pré-traitement des données, de construction et de validation du modèle ; (2) le code source R utilisé ; (3) le fichier log de votre dépôt Git.

[yelp]: https://www.yelp.com/dataset/
[apd]: http://jmcauley.ucsd.edu/data/amazon/links.html
[bing]: https://towardsdatascience.com/a-pair-of-text-analysis-explorations-fe69cd2324d3
[girsif]: https://jessesw.com/Rec-System/