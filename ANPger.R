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
#  ANPger.INP     
##############################                   
# INPUT:             
#  ANP12_CALCO12
##############################                   
# OUTPUT:          
#  ANP_CALCO
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
seroutput <- c("ANP_CALCO")
serinput <- c("ANP12_CALCO12")

for(i in 1:length(serinput))
{ 
  nomes <- paste0("serie", i)
  assign(nomes,sqlQuery((odbcConnect("ipeadata",uid="",pwd="")),(paste0("SELECT ipea.vw_Valor.SERCODIGO, CAST (ipea.vw_Valor.VALDATA as NUMERIC) as VALDATA, ipea.vw_Valor.VALVALOR FROM ipea.vw_Valor WHERE (((ipea.vw_Valor.SERCODIGO)='",serinput[i],"' and ipea.vw_Valor.VALVALOR IS NOT NULL)) order by VALDATA;"))))
  odbcCloseAll()
}

## 3) FUNDINDO AS SERIES EM UM UNICO BLOCO DE DADOS
serie <- merge(serie1,serie1,by="VALDATA",all=T)
serie$VALDATA <- as.Date(serie$VALDATA, origin = "1900-01-01")

## 4) CRIANDO VETOR DE DATAS
## APLICADO EM CONVERSOES DE SERIES MENSAIS PARA ANUAIS ##
# "Se os dados iniciam apos o mes 01, nao fica caracterizado um ano completo." # 
k <- 0
if ((as.POSIXlt(serie[1,1])$mon+1)!=1) {k<-1}
# # "Ao carregar o 12o mes, a serie anual e automaticamente gerada." #
# h<-0
# if ((as.POSIXlt(serie[dim(serie)[1],1])$mon+1==12)) {h<-1}
h <- 1
datas<-seq(as.Date(paste0((as.POSIXlt(serie[1,1])$year+1900+k),"-01-01")),
           as.Date(paste0((as.POSIXlt(serie[dim(serie)[1],1])$year+1900+h),"-01-01")),
           by='1 year')  

## 5) BLOCO DE OPERACOES MATEMATICAS
GERADO<-data.frame(NULL)
for (i in 2:length(datas)){GERADO[i-1,1] <- round(mean(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i])[,3],na.rm=T),2)}

## 6) COLOCANDO NO FORMATO NOVO (PLANILHA GENERICA)
GENERICA<-data.frame(datas[-length(datas)],GERADO)
names(GENERICA)<-c("VALDATA",seroutput)
r<-NULL
for (i in 1:dim(GENERICA)[1]){if (sum(is.na(GENERICA[i,]))==0){r<-c(r,i)}}
if (length(r)>0){GENERICA<-GENERICA[r[length(r)-4]:dim(GENERICA)[1],]}

## 7) SALVANDO EM .XLS
write.xlsx(GENERICA,paste0("ANPger.xls"),sheetName="Generica",row.names=F,showNA=F)

# #######################
# ##8) VERIFICACAO COM A SERIE NO BANCO
# for(i in 1:length(seroutput))
# { 
#   nomes <- paste0("verif", i)
#   assign(nomes,sqlQuery((odbcConnect("ipeadata",uid="",pwd="")),(paste0("SELECT ipea.vw_Valor.SERCODIGO, CAST (ipea.vw_Valor.VALDATA as NUMERIC) as VALDATA, ipea.vw_Valor.VALVALOR FROM ipea.vw_Valor WHERE (((ipea.vw_Valor.SERCODIGO)='",seroutput[i],"' and ipea.vw_Valor.VALVALOR IS NOT NULL)) order by VALDATA;"))))
#   odbcCloseAll()
# }
# verif<-merge(verif1,verif1,by="VALDATA",all=T)
# verif<-verif[,seq(1,dim(verif)[2],length.out=length(seroutput)+1)]
# verif$VALDATA<-as.Date(verif$VALDATA, origin = "1900-01-01")
# names(verif)<-c("VALDATA",seroutput)
# ############ (CTRL+L)
# head(GENERICA)
# head(verif)
# ############ (CTRL+L)
# tail(GENERICA)
# tail(verif)
# #write.xlsx(verif,paste0("ANPgerVERIFICACAO ",Sys.Date(),".xls"),sheetName="Generica",row.names=F,showNA=F) 

