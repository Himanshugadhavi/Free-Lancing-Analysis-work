library(readxl)
cluster <- read_excel("modified_data.xlsx", 
                      sheet = "Sheet2")

# scaling the data #
scaling <- scale(cluster[,-1])
scaling

d <- dist(scaling)
options(max.print = 10000)
d

# k means # 
k2 <- kmeans(scaling,centers=2)
k2
k2$cluster


#to find optimum number of clusters
library(ggplot2)
library(factoextra)

fviz_nbclust(scaling, kmeans, method = "wss")
fviz_nbclust(scaling, kmeans, method = "silhouette")
fviz_nbclust(scaling, kmeans, method = "gap_stat")

#see the conclusion
setk <- kmeans(scaling, 2)
setk$cluster
plot(scaling, col=setk$cluster)

#hirarchical clustering
wardse <- hclust(d, "ward.D2")
wardse
plot(wardse)
plot(wardse, hang=-1)
plot(wardse, hang=-1, labels=cluster$Genotypes)
rect.hclust(wardse,k=2,border="blue")
rect.hclust(wardse,k=2,border=2:3)

hcm <- cutree(wardse, k=2)
hcm

# k means cluster distance #
library("clv")

kidistances <- cls.scatt.data(scaling, setk$cluster)
kidistances

# hierarchical cluster distances #
hierarchicalclusterdistances <- cls.scatt.data(scaling, hcm)
print(hierarchicalclusterdistances)


# cluster means #
means <- aggregate(cluster[,-1], list(setk$cluster),mean)
means


sink("Clusteringmodified.txt")
cat("K means with 2 fixed clusters")
print(k2)
cat("means for clusters from k means clustering")
print(setk)
cat("hierarchical clustering")
print(wardse)
cat("hierarchical clustering means")
print(hcm)
cat("k means cluster distance")
print(kidistances)
cat("hierarchical cluster distances")
print(hierarchicalclusterdistances)
cat("cluster means")
print(means)
sink()

sink("Clusteringmodified.doc")
cat("K means with 2 fixed clusters")
print(k2)
cat("means for clusters from k means clustering")
print(setk)
cat("hierarchical clustering")
print(wardse)
cat("hierarchical clustering means")
print(hcm)
cat("k means cluster distance")
print(kidistances)
cat("hierarchical cluster distances")
print(hierarchicalclusterdistances)
cat("cluster means")
print(means)
sink()
