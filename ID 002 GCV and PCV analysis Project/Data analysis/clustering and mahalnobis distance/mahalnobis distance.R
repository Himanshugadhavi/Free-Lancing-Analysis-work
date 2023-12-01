library("MASS")
library("biotools")

library(readxl)
pooled <- read_excel("modified_data.xlsx")
View(modified_data)

# separating the dependent variable #
dv <- as.matrix(pooled[,3:11])
dv


# model of manova #
mod <- manova(dv~as.factor(Genotypes)+
                as.factor(Replications),
              data=pooled)
mod
summary<-summary(mod)
summary


ss <- SSD(mod)
ss
covar <- ss$SSD/ss$df
covar

## percentage contribution

imp <- singh(dv,covar)
imp
plot(imp)

# D2 mahalnobis distance
d <- D2.dist(avg[,-1],covar)
d

# clustering by tocher method

toc<-tocher(d)
toc
toc$clusters
toccherdistance<-toc$distClust
toccherdistance

# file output
sink("D2mahalnobis.txt")
cat("Manova summary")
print(summary)
cat("sum of square")
print(ss)
cat("covarince")
print(covar)
cat("Percentage contribution")
print(imp)
cat("Mahalnobis distance")
print(d)
cat("tocher clusters")
print(toc)
cat("toccherdistance")
print(toccherdistance)
sink()











