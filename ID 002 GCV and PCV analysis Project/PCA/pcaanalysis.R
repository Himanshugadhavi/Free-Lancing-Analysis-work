pca
# scaling the data #
scd <- scale(pca[,-1])
scd
View(scd)
# options #
options(max.print = 10000)
options(scipen = 100)

# setting wroking directory #
setwd("E:/7. Free lancing analysis/GCV and PCV analysis Project")
getwd()

library(ggplot2)
library(factoextra)

# spectral decomposition approach #
pca1<-princomp(scd)
pca1
biplot(pca1)
pca1$scores

#singular value decompositoin #
pca2<-prcomp(scd)
pca2
pca2$x
summary(pca2)
biplot(pca2)
pca1$scores == pca2$x

# visulization
fviz_pca(pca2)
fviz_pca_biplot(pca2, repel=TRUE)
fviz_pca_var(pca2)
fviz_pca_ind(pca2)
fviz_screeplot(pca2)

# FactoMineR
library(FactoMineR)

# pca svd
fpca <- PCA(scd,ncp=10)
fpca
fpca$eig
fpca$ind$coord
fpca$ind$cos2
fpca$var$contrib

# visualization
fviz_pca(fpca)
fviz_pca_biplot(fpca,repel=TRUE)
fviz_pca_biplot(fpca,repel=TRUE,col.ind = "cos2",
                col.var = "red")

# scatter plot
fviz_pca_ind(fpca)
fviz_pca_ind(fpca, repel=T,col.ind = "cos2")

# variables
fviz_pca_var(fpca)
fviz_pca_var(fpca,repel=T)
fviz_pca_var(fpca,repel=T,col.var="contrib")

#screeplot
fviz_screeplot(fpca)
fviz_screeplot(fpca,ncp=10)
fviz_screeplot(fpca,ncp=10,geom="line")
fviz_screeplot(fpca,ncp=10,geom="bar",barfill="red")
fviz_screeplot(fpca,choice="eigenvalue",ncp=10)

fpca$eig
table1<-fpca$eig
class(table1)
table1<-as.data.frame(table1)
class(table1)
# importing the above data set to excel form
library(writexl)
write_xlsx(table1,"eigentable.xlsx")

# elbow method 
plot(table1$`cumulative percentage of variance`)
#########################
library(psych)
rpca<-principal(scd, nfactor=3,rotate="varimax",scores=TRUE)
rpca
rpca$communality
rpca$loadings
print(rpca$loadings,digits=3,cutoff=0)
barplot(rpca$loadings)
barplot(rpca$loadings,beside=TRUE,col="blue",
        main="rotated component matrix")
# R colour palette
library(pals)
barplot(rpca$loadings, beside =TRUE, col=brewer.accent(10),
        main="rotated component matrix")
barplot(rpca$loadings, beside =TRUE, col=brewer.greens(10),
        main="rotated component matrix")

# import scores
rpca$scores
scores<-rpca$scores
class(scores)
scores<-as.data.frame(scores)
class(scores)
write_xlsx(scores,"scores.xlsx")
