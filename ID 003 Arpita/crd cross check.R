library(doebioresearch)

#### Loading the dataset ####
library(readxl)
fcrd <- read_excel("fcrd.xlsx")
View(fcrd)
anova <- fcrd2fact(fcrd[3],fcrd$S,fcrd$H,2)
anova
