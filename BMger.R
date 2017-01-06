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
#  BMger.INP     
##############################                   
# INPUT:             
#  BM12_RESLIQ12
#  BM12_LFTFBC12
#  BM12_LTNFBC12
#  BM12_M0N12
#  BM12_M1N12  
##############################                   
# OUTPUT:          
#  BM_RES
#  BM_LFTPP
#  BM_LTNPP
#  BM_M0FN
#  BM_M1FN 
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
seroutput<-c("BM_RES",
             "BM_LFTPP",
             "BM_LTNPP",
             "BM_M0FN",
             "BM_M1FN")
serinput<-c("BM12_RESLIQ12",
            "BM12_LFTFBC12",
            "BM12_LTNFBC12",
            "BM12_M0N12",
            "BM12_M1N12")
for(i in 1:length(serinput))
{ 
  nomes <- paste0("serie", i)
  assign(nomes,sqlQuery((odbcConnect("ipeadata",uid="",pwd="")),(paste0("SELECT ipea.vw_Valor.SERCODIGO, CAST (ipea.vw_Valor.VALDATA as NUMERIC) as VALDATA, ipea.vw_Valor.VALVALOR FROM ipea.vw_Valor WHERE (((ipea.vw_Valor.SERCODIGO)='",serinput[i],"' and ipea.vw_Valor.VALVALOR IS NOT NULL)) order by VALDATA;"))))
  odbcCloseAll()
}

## 3) FUNDINDO AS SERIES EM UM UNICO BLOCO DE DADOS
serie <- NULL
if (length(serinput)==1){serie <- merge(serie1,serie1,by="VALDATA",all=T)}
if ((length(serinput)>1) & (length(serinput)<=2)){serie <- merge(serie1,serie2,by="VALDATA",all=T)}
if (length(serinput)>2)
{
  serie <- merge(serie1,serie2,by="VALDATA",all=T)
  #names(serie) <- c("VALDATA", rep(c("SERCODIGO","VALVALOR"),2)
  for (i in 3:length(serinput))
  {
    serie <- merge(serie,get(paste0("serie",i)),by="VALDATA",all=T)
    names(serie)[(2*i):((2*i)+1)] <- paste0(c("SERCODIGO.","VALVALOR."),i)
  }
}
serie$VALDATA<-as.Date(serie$VALDATA, origin = "1900-01-01")

## 4) CRIANDO VETOR DE DATAS
## APLICADO EM CONVERSOES DE SERIES MENSAIS PARA ANUAIS ##
# "Se os dados iniciam apos o mes 01, nao fica caracterizado um ano completo." # 
k<-0
if ((as.POSIXlt(serie[1,1])$mon+1)!=1) {k<-1}
# "Ao carregar o 12o mes, a serie anual e automaticamente gerada." #
h<-0
if ((as.POSIXlt(serie[dim(serie)[1],1])$mon+1==12)) {h<-1}
datas<-seq(as.Date(paste0((as.POSIXlt(serie[1,1])$year+1900+k),"-01-01")),
           as.Date(paste0((as.POSIXlt(serie[dim(serie)[1],1])$year+1900+h),"-01-01")),
           by='1 year')  

## 5) BLOCO DE OPERACOES MATEMATICAS
GERADO<-data.frame(NULL)
for (i in 2:length(datas))
{
  GERADO[i-1,1]<-as.numeric(tail(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.x), n = 1L))
  GERADO[i-1,2]<-as.numeric(tail(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.y), n = 1L))
  GERADO[i-1,3]<-as.numeric(tail(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.z), n = 1L))
  GERADO[i-1,4]<-as.numeric(tail(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.w), n = 1L))
  GERADO[i-1,5]<-as.numeric(tail(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR), n = 1L))  
}

## 6) COLOCANDO NO FORMATO NOVO (PLANILHA GENERICA)
GENERICA<-data.frame(datas[-length(datas)],GERADO)
names(GENERICA)<-c("VALDATA",seroutput)
r<-NULL
for (i in 1:dim(GENERICA)[1]){if (sum(is.na(GENERICA[i,]))==0){r<-c(r,i)}}
if (length(r)>0){GENERICA<-GENERICA[r[length(r)-4]:dim(GENERICA)[1],]}

## 7) SALVANDO EM .XLS
write.xlsx(GENERICA,paste0("BMger.xls"),sheetName="Generica",row.names=F,showNA=F)  

# #######################
# ##8) VERIFICACAO COM A SERIE NO BANCO
# for(i in 1:length(seroutput))
# { 
#   nomes <- paste0("verif", i)
#   assign(nomes,sqlQuery((odbcConnect("ipeadata",uid="",pwd="")),(paste0("SELECT ipea.vw_Valor.SERCODIGO, CAST (ipea.vw_Valor.VALDATA as NUMERIC) as VALDATA, ipea.vw_Valor.VALVALOR FROM ipea.vw_Valor WHERE (((ipea.vw_Valor.SERCODIGO)='",seroutput[i],"' and ipea.vw_Valor.VALVALOR IS NOT NULL)) order by VALDATA;"))))
#   odbcCloseAll()
# }
# verif<-merge(verif1,verif2,by="VALDATA",all=T)
# verif<-merge(verif,verif3,by="VALDATA",all=T)
# verif<-merge(verif,verif4,by="VALDATA",all=T,suffixes = c(".z",".w"))
# verif<-merge(verif,verif5,by="VALDATA",all=T,suffixes = c(".a",".b"))
# verif<-verif[,seq(1,dim(verif)[2],length.out=length(seroutput)+1)]
# verif$VALDATA<-as.Date(verif$VALDATA, origin = "1900-01-01")
# names(verif)<-c("VALDATA",seroutput)
# ############ (CTRL+L)
# head(GENERICA)
# head(verif)
# ############ (CTRL+L)
# tail(GENERICA)
# tail(verif)
# #write.xlsx(verif,paste0("BMgerVERIFICACAO ",Sys.Date(),".xls"),sheetName="Generica",row.names=F,showNA=F) 

