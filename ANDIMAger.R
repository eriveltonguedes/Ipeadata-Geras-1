##############################################################################
##############################################################################
###########    INSTITUTO DE PESQUISA ECONOMICA APLICADA - Ipea     ###########
###########                  PROJETO IPEADATA                      ###########
###########          COORDENADOR: ERIVELTON PIRES GUEDES           ###########
###########        PROGRAMADOR: LUIZ EDUARDO DA SILVA GOMES        ###########
###########             ROTINA R PARA OBTENCAO DOS GERAS           ###########
##############################################################################
##############################################################################

##############################
# GERA:                         
#  ANDIMAger.INP     
##############################                   
# INPUT:             
#  ANDIMA366_TJTLN1366
#  ANDIMA366_TJTLN3366
#  ANDIMA366_TJTLN6366
#  ANDIMA366_TJTLN12366
##############################                   
# OUTPUT:          
#  ANDIMA12_TJTLN112
#  ANDIMA12_TJTLN312
#  ANDIMA12_TJTLN612
#  ANDIMA12_TJTLN1212  
##############################

## 0) IMPORTANDO PACOTES NECESSARIOS
pacotes <- c("RODBC","rJava","xlsxjars","xlsx")
for (i in 1:length(pacotes))
{
  if (length(names(installed.packages()[,1])[names(installed.packages()[,1])==pacotes[i]])==0){install.packages(pacotes[i], repos="http://cran.fiocruz.br/")}
  library(pacotes[i],character.only = TRUE) 
}
## 1) AJUSTES DOS PARAMETROS
options(scipen=999)
setwd("//Srjn3/Area_Corporativa/Projeto_IPEADATA/Temporario/geras")
## 2) CARREGANDO AS SERIES INPUT E DEFININDO AS SERIES OUTPUT
seroutput <- c("ANDIMA12_TJTLN112",
             "ANDIMA12_TJTLN312",
             "ANDIMA12_TJTLN612",
             "ANDIMA12_TJTLN1212")
serinput <- c("ANDIMA366_TJTLN1366",
            "ANDIMA366_TJTLN3366",
            "ANDIMA366_TJTLN6366",
            "ANDIMA366_TJTLN12366")
for(i in 1:length(serinput))
{ 
  nomes <- paste0("serie", i)
  assign(nomes,sqlQuery((odbcConnect("ipeadata",uid="",pwd="")),(paste0("SELECT ipea.vw_Valor.SERCODIGO, CAST (ipea.vw_Valor.VALDATA as NUMERIC) as VALDATA, ipea.vw_Valor.VALVALOR FROM ipea.vw_Valor WHERE (((ipea.vw_Valor.SERCODIGO)='",serinput[i],"' and ipea.vw_Valor.VALVALOR IS NOT NULL)) order by VALDATA;"))))
  odbcCloseAll()
}
## 3) FUNDINDO AS SERIES EM UM UNICO BLOCO DE DADOS
serie <- merge(serie1,serie2,by="VALDATA",all=T)
serie <- merge(serie,serie3,by="VALDATA",all=T)
serie <- merge(serie,serie4,by="VALDATA",all=T,suffixes = c(".z",".w"))
serie$VALDATA <- as.Date(serie$VALDATA, origin = "1900-01-01")
## 4) CRIANDO VETOR DE DATAS
### APLICADO EM CONVERSOES DE SERIES DIARIAS PARA MENSAIS ###
# "Se os dados iniciam apos o dia 04, nao fica caracterizado um mes completo" #   
k <- 2
if (as.POSIXlt(serie[1,1])$mday<5){k <- 1}
datas <- seq(as.Date(paste0((as.POSIXlt(serie[1,1])$year+1900),"-",(as.POSIXlt(serie[1,1])$mon+k),"-01")),
           as.Date(paste0((as.POSIXlt(serie[dim(serie)[1],1])$year+1900),"-",(as.POSIXlt(serie[dim(serie)[1],1])$mon+1),"-01")),
           by='1 month')
## 5) BLOCO DE OPERACOES MATEMATICAS
GERADO <- data.frame(NULL)
for (i in 2:length(datas))
{
  GERADO[i-1,1] <- mean(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.x)[,1])
  GERADO[i-1,2] <- mean(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.y)[,1])
  GERADO[i-1,3] <- mean(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.z)[,1])
  GERADO[i-1,4] <- mean(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.w)[,1])
}
## 6) COLOCANDO NO FORMATO NOVO (PLANILHA GENERICA)
GENERICA <- data.frame(datas[-length(datas)],GERADO)
names(GENERICA) <- c("VALDATA",seroutput)
r <- NULL
for (i in 1:dim(GENERICA)[1]){if (sum(is.na(GENERICA[i,]))==(dim(GENERICA)[2]-1)){r <- c(r,i)}}
if (length(r)>0){GENERICA <- GENERICA[-r,]}
r<-NULL
for (i in 1:dim(GENERICA)[1]){if (sum(is.na(GENERICA[i,]))==0){r<-c(r,i)}}
if (length(r)>0){GENERICA<-GENERICA[r[length(r)]:dim(GENERICA)[1],]}
## 7) SALVANDO EM .XLS
write.xlsx(GENERICA,paste0("ANDIMAger.xls"),sheetName="Generica",row.names=F,showNA=F)  
# #######################
# ##8) VERIFICACAO COM A SERIE NO BANCO
# for(i in 1:length(seroutput))
# { 
#   nomes  <-  paste0("verif", i)
#   assign(nomes,sqlQuery((odbcConnect("ipeadata",uid="",pwd="")),(paste0("SELECT ipea.vw_Valor.SERCODIGO, CAST (ipea.vw_Valor.VALDATA as NUMERIC) as VALDATA, ipea.vw_Valor.VALVALOR FROM ipea.vw_Valor WHERE (((ipea.vw_Valor.SERCODIGO)='",seroutput[i],"' and ipea.vw_Valor.VALVALOR IS NOT NULL)) order by VALDATA;"))))
#   odbcCloseAll()
# }
# verif <- merge(verif1,verif2,by="VALDATA",all=T)
# verif <- merge(verif,verif3,by="VALDATA",all=T)
# verif <- merge(verif,verif4,by="VALDATA",all=T,suffixes = c(".z",".w"))
# verif <- verif[,seq(1,dim(verif)[2],length.out=length(seroutput)+1)]
# verif$VALDATA <- as.Date(verif$VALDATA, origin = "1900-01-01")
# names(verif) <- c("VALDATA",seroutput)
# ############ (CTRL+L)
# head(GENERICA)
# head(verif)
# ############ (CTRL+L)
# tail(GENERICA)
# tail(verif)
# #write.xlsx(verif,paste0("ANDIMAgerVERIFICACAO ",Sys.Date(),".xls"),sheetName="Generica",row.names=F,showNA=F) 

