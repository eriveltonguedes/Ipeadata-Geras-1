## http://blog.revolutionanalytics.com/2016/01/microsoft-r-open.html

setwd("/home/DLIPEA/r1439546/R/AulaR/")


library(readxl)
base.mun <- read_excel("~/R/AulaR/dados/Municipios_2010.xlsx")
View(base.mun)

library(readr)
Mum_de_obitos_2010 <- read_csv("~/R/AulaR/dados/Num de obitos 2010.csv")