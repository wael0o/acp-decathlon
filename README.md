# 📊 Analyse en Composantes Principales (ACP) — Dataset Decathlon

## 🎯 Objectif du projet

L’objectif de ce mini-projet est d’appliquer une **Analyse en Composantes Principales (ACP)** sur le dataset *Decathlon* afin de :

- comprendre les **relations entre disciplines sportives**,
- réduire la dimension des données tout en conservant l’essentiel de l’information,
- interpréter les **axes principaux**, les **contributions** et la **qualité de représentation**,
- illustrer concrètement l’ACP à travers un jeu de données réel et parlant.

Ce projet a également pour but de montrer une **maîtrise des outils statistiques sous R**, en complément de projets réalisés en Python.

---

## 📁 Données utilisées

- **Dataset** : `decathlon` (package *FactoMineR*)
- **Individus** : athlètes des Jeux Olympiques  
  (les compétitions *Decastar* ont été exclues)
- **Variables** :
  - 10 disciplines sportives quantitatives (100m, longueur, poids, etc.)
  - 2 variables quantitatives supplémentaires (`Rank`, `Points`), utilisées uniquement pour l’interprétation

Les variables étant exprimées dans des **unités différentes**, une **standardisation** est appliquée avant l’ACP.

---

## ⚙️ Méthodologie

- ACP réalisée avec `FactoMineR::PCA`
- Standardisation des variables (`scale.unit = TRUE`)
- Analyse basée sur :
  - les valeurs propres et la variance expliquée,
  - le scree plot,
  - le cercle des corrélations,
  - la projection des individus,
  - les contributions et les cos².

---

## 📈 Résultats principaux

### 🔹 Variance expliquée

- **Axe 1** : **35,4 %** de la variance  
- **Axe 2** : **19,7 %** de la variance  
- **Cumul (Dim 1 + Dim 2)** : **≈ 55 %**

👉 Le plan factoriel (Dim1, Dim2) est **suffisamment informatif** pour une interprétation pertinente.

---

### 🔹 Interprétation des axes

**Axe 1 (Dim 1)**  
- Oppose principalement :
  - les **épreuves de vitesse et d’explosivité**  
    (100m, 400m, 110m haies, saut en longueur),
  - aux épreuves plus **techniques ou d’endurance**.
- Cet axe peut être interprété comme un **gradient de puissance / vitesse**.

**Axe 2 (Dim 2)**  
- Fortement influencé par :
  - les **lancers** (poids, disque, javelot),
  - certaines épreuves techniques.
- Il traduit une dimension plus **technique / force spécifique**.

---

### 🔹 Cercle des corrélations

- Les variables proches sur le cercle sont **fortement corrélées** :
  - 100m, 400m et 110m haies sont très liés,
  - les épreuves de lancer forment un groupe cohérent.
- Les variables opposées sur le cercle traduisent des **profils d’athlètes différents**.
- Les flèches longues indiquent une **forte contribution** aux axes principaux.

👉 Le cercle met clairement en évidence une **structure latente** entre les disciplines.

---

### 🔹 Projection des individus

- Les athlètes sont **bien dispersés** sur le plan factoriel.
- Les individus bien représentés (cos² élevé) se situent loin de l’origine.
- On observe différents **profils de performance**, sans séparation artificielle.

👉 L’ACP permet ici une **lecture qualitative des profils**, et non une classification stricte.

---

## 🧠 Analyse critique

- L’ACP est **pertinente** sur ce dataset :
  - corrélations marquées entre variables,
  - réduction de dimension efficace,
  - interprétation intuitive des axes.
- Elle ne vise **pas à prédire**, mais à **comprendre la structure des données**.
- L’utilisation de variables supplémentaires (`Rank`, `Points`) permet une **interprétation enrichie sans biaiser l’analyse**.

---

## 🛠️ Outils utilisés

- **R**
- Packages :
  - `FactoMineR`
  - `factoextra`
  - `corrplot`

---

## ✅ Conclusion

Ce projet illustre comment l’ACP permet de **résumer, structurer et interpréter** un jeu de données multivarié complexe.  
Au-delà des visualisations, l’accent est mis sur la **compréhension statistique**, l’analyse critique et la capacité à relier les résultats au contexte métier (performance sportive).

Ce travail s’inscrit dans une démarche plus large de **data analysis rigoureuse**, complémentaire de projets de machine learning et de data science appliquée.
