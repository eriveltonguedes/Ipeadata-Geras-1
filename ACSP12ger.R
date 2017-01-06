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
#  ACSP12ger.INP     
##############################                   
# INPUT:             
#  ACSP12_SCPCRR12   
#  ACSP12_SCPCRC12  
#  ACSP12_SCPCC12   
##############################                   
# OUTPUT:          
#  ACSP12_INAD12    
#  ACSP12_INADI12    
#  ACSP12_SCPCRL12   
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
seroutput<-c("ACSP12_INAD12",
             "ACSP12_INADI12",
             "ACSP12_SCPCRL12")
serinput<-c("ACSP12_SCPCRR12",
            "ACSP12_SCPCRC12",
            "ACSP12_SCPCC12")
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

## 4) BLOCO DE OPERACOES MATEMATICAS
GERADO<-data.frame(NULL)
for (i in 4:(dim(serie)[1])){GERADO[i,1]<-(100*(serie[i,3]-serie[i,5]))/serie[(i-3),7]}
for (i in 5:(dim(serie)[1])){GERADO[i,2]<-(100*(serie[i,3]-serie[i,5]))/serie[(i-4),7]}
for (i in 1:(dim(serie)[1])){GERADO[i,3]<-serie[i,3]-serie[i,5]}

## 5) COLOCANDO NO FORMATO NOVO (PLANILHA GENERICA)
GENERICA<-data.frame(serie[,1],GERADO)
names(GENERICA)<-c("VALDATA",seroutput)
r<-NULL
for (i in 1:dim(GENERICA)[1]){if (sum(is.na(GENERICA[i,]))==0){r<-c(r,i)}}
if (length(r)>0){GENERICA<-GENERICA[r[length(r)-4]:dim(GENERICA)[1],]}
GENERICA <- na.exclude(GENERICA)

## 6) SALVANDO EM .XLS
write.xlsx(GENERICA,paste0("ACSP12ger.xls"),sheetName="Generica",row.names=F,showNA=F)

# #######################
# ## 7) VERIFICACAO COM A SERIE NO BANCO
# for(i in 1:length(seroutput))
# { 
#   nomes <- paste0("verif", i)
#   assign(nomes,sqlQuery((odbcConnect("ipeadata",uid="",pwd="")),(paste0("SELECT ipea.vw_Valor.SERCODIGO, CAST (ipea.vw_Valor.VALDATA as NUMERIC) as VALDATA, ipea.vw_Valor.VALVALOR FROM ipea.vw_Valor WHERE (((ipea.vw_Valor.SERCODIGO)='",seroutput[i],"' and ipea.vw_Valor.VALVALOR IS NOT NULL)) order by VALDATA;"))))
#   odbcCloseAll()
# }
# verif<-merge(verif1,verif2,by="VALDATA",all=T)
# verif<-merge(verif,verif3,by="VALDATA",all=T)
# verif<-verif[,seq(1,dim(verif)[2],length.out=length(seroutput)+1)]
# verif$VALDATA<-as.Date(verif$VALDATA, origin = "1900-01-01")
# names(verif)<-c("VALDATA",seroutput)
# ############ (CTRL+L)
# head(GENERICA)
# head(verif)
# ############ (CTRL+L)
# tail(GENERICA)
# tail(verif)
# #write.xlsx(verif,paste0("ACSP12gerVERIFICACAO ",Sys.Date(),".xls"),sheetName="Generica",row.names=F,showNA=F)

