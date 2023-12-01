# ANOVA - Estimation of Genetic Parameters
para<-gen.var(Analysis_main_book[3:12], Analysis_main_book$Genotypes,
              Analysis_main_book$Replications)
para

# Genotypic Correlation Analysis
gen_cor<-geno.corr(Analysis_main_book[3:12], Analysis_main_book$Genotypes,
                   Analysis_main_book$Replications)
gen_cor

# Phenotypic Correlation Analysis
phen_cor<-pheno.corr(Analysis_main_book[3:12], Analysis_main_book$Genotypes,
                     Analysis_main_book$Replications)
phen_cor

# Genotypic Path Analysis
geno_path<-geno.path(Analysis_main_book[12],Analysis_main_book[3:11] ,
                     Analysis_main_book$Genotypes, Analysis_main_book$Replications)
geno_path

# Phenotypic Path Analysis
pheno_path<-pheno.path(Analysis_main_book[12],Analysis_main_book[3:11] ,
                       Analysis_main_book$Genotypes, Analysis_main_book$Replications)
pheno_path

library(openxlsx)

# Export gen_cor matrix to Excel
write.xlsx(para,"para.xlsx")
write.xlsx(gen_cor,"gen_cor.xlsx")
write.xlsx(phen_cor,"phen_cor.xlsx")
write.xlsx(geno_path,"geno_path.xlsx")
write.xlsx(pheno_path,"pheno_path.xlsx")

# file output
sink("Output2022.txt")
cat("ANOVA")
print(para)
cat("Genotypic correlations")
print(gen_cor)
cat("Phenotypic correlations")
print(phen_cor)
cat("Genotypic path analysis")
print(geno_path)
cat("Phenotypic path analyis")
print(pheno_path)
sink()
