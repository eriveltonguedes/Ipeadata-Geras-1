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
#  IGPM12ger.INP     
##############################                   
# INPUT:             
#  IGP12_IGPMG12 
##############################                   
# OUTPUT:          
#  IGP12_IGPM12    
##############################

## 0) IMPORTANDO PACOTES NECESSARIOS
pacotes<-c("RODBC","rJava","xlsxjars","xlsx")
for (i in 1:length(pacotes))
{
  if (length(names(installed.packages()[,1])[names(installed.packages()[,1])==pacotes[i]])==0){install.packages(pacotes[i], repos="http://cran.fiocruz.br/")}
  library(pacotes[i],character.only = TRUE) 
}

## 1) AJUSTES DOS PARAMETROS
options(scipen=999)
setwd("//Srjn3/Area_Corporativa/Projeto_IPEADATA/Temporario/geras")

## 2) CARREGANDO AS SERIES INPUT E DEFININDO AS SERIES OUTPUT
seroutput<-c("IGP12_IGPM12")
serinput<-c("IGP12_IGPMG12")
for(i in 1:length(serinput))
{ 
  nomes <- paste0("serie", i)
  assign(nomes,sqlQuery((odbcConnect("ipeadata",uid="",pwd="")),(paste0("SELECT ipea.vw_Valor.SERCODIGO, CAST (ipea.vw_Valor.VALDATA as NUMERIC) as VALDATA, ipea.vw_Valor.VALVALOR FROM ipea.vw_Valor WHERE (((ipea.vw_Valor.SERCODIGO)='",serinput[i],"' and ipea.vw_Valor.VALVALOR IS NOT NULL)) order by VALDATA;"))))
  odbcCloseAll()
}

## 3) FUNDINDO AS SERIES EM UM UNICO BLOCO DE DADOS
serie <- merge(serie1,serie1,by="VALDATA",all=T)[,1:3]
serie$VALDATA<-as.Date(serie$VALDATA, origin = "1900-01-01")
# Excepcionalmente para essa serie a conta se inicia em 08/1994 #
serie <- subset(serie,serie$VALDATA>=as.Date("1994-08-01", origin = "1900-01-01"))

## 4) BLOCO DE OPERACOES MATEMATICAS
GERADO<-data.frame(100) # Indice base: 100 = 08/1994
for (i in 2:(dim(serie)[1])){GERADO[i,1]<- GERADO[(i-1),1]*(1+(serie[i,3]/100))}   

## 5) COLOCANDO NO FORMATO NOVO (PLANILHA GENERICA)
GENERICA<-data.frame(serie[,1],GERADO)
names(GENERICA)<-c("VALDATA",seroutput)
r<-NULL
for (i in 1:dim(GENERICA)[1]){if (sum(is.na(GENERICA[i,]))==0){r<-c(r,i)}}
if (length(r)>0){GENERICA<-GENERICA[r[(length(r)-4)]:dim(GENERICA)[1],]}
GENERICA <- na.exclude(GENERICA)

## 6) SALVANDO EM .XLS
write.xlsx(GENERICA,paste0("IGPM12ger.xls"),sheetName="Generica",row.names=F,showNA=F)

# # #######################
# ## 7) VERIFICACAO COM A SERIE NO BANCO
# for(i in 1:length(seroutput))
# { 
#   nomes <- paste0("verif", i)
#   assign(nomes,sqlQuery((odbcConnect("ipeadata",uid="",pwd="")),(paste0("SELECT ipea.vw_Valor.SERCODIGO, CAST (ipea.vw_Valor.VALDATA as NUMERIC) as VALDATA, ipea.vw_Valor.VALVALOR FROM ipea.vw_Valor WHERE (((ipea.vw_Valor.SERCODIGO)='",seroutput[i],"' and ipea.vw_Valor.VALVALOR IS NOT NULL)) order by VALDATA;"))))
#   odbcCloseAll()
# }
# verif<-merge(verif1,verif1,by="VALDATA",all=T)[,c(1,3)]
# verif$VALDATA<-as.Date(verif$VALDATA, origin = "1900-01-01")
# verif <- subset(verif,verif$VALDATA>=as.Date("1994-08-01", origin = "1900-01-01"))
# names(verif)<-c("VALDATA",seroutput)
# ############ (CTRL+L)
# head(GENERICA)
# head(verif)
# ############ (CTRL+L)
# tail(GENERICA)
# tail(verif)
# #write.xlsx(verif,paste0("ACSP12gerVERIFICACAO ",Sys.Date(),".xls"),sheetName="Generica",row.names=F,showNA=F)

