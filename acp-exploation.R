# Packages pour l'ACP et la visualisation
library(FactoMineR)
library(factoextra)

# Chargement du dataset Decathlon (FactoMineR)
data(decathlon)

# On conserve uniquement les athlètes des JO (on enlève le Decastar)
# et uniquement les variables de performance (pas les infos qualitatives)
deca <- decathlon[14:nrow(decathlon), 1:12]

# ACP :
# - scale.unit = TRUE : standardisation indispensable (unités différentes)
# - quanti.sup = 11:12 : variables supplémentaires (non utilisées pour construire les axes)
res.pca <- PCA(
  deca,
  scale.unit = TRUE,
  quanti.sup = 11:12,
  graph = FALSE
)

# Analyse préliminaire : corrélations entre variables
library(corrplot)
res_corr <- cor(deca)
corrplot(res_corr, method = "circle")

# Valeurs propres : quantité de variance expliquée par chaque axe
eig.val <- get_eigenvalue(res.pca)
eig.val

# Scree plot : aide au choix du nombre d'axes à interpréter
fviz_eig(
  res.pca,
  addlabels = TRUE,
  ylim = c(0, 60)
)

# Projection des individus (athlètes)
# Coloration par cos² : qualité de représentation sur le plan
fviz_pca_ind(
  res.pca,
  geom.ind = "point",
  col.ind = "cos2",
  gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
  repel = TRUE
)

# Cercle des corrélations :
# - direction = corrélation avec les axes
# - couleur = contribution aux axes
fviz_pca_var(
  res.pca,
  col.var = "contrib",
  gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
  repel = TRUE
)

# Contributions détaillées des variables par dimension
var <- get_pca_var(res.pca)
var$contrib
