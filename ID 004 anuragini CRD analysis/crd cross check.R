library(doebioresearch)

#### Loading the dataset ####
library(readxl)
data <- read_excel("E:/7. Free lancing analysis/ID 108 anuragini CRD analysis/anuragini data.xlsx", 
                             sheet = "Rdata")
View(data)

anova <- fcrd2fact(data[3],data$P,data$B,2)
anova
