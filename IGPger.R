##############################################################################
##############################################################################
###########    INSTITUTO DE PESQUISA ECONOMICA APLICADA - Ipea     ###########
###########                  PROJETO IPEADATA                      ###########
###########          COORDENADOR: ERIVELTON PIRES GUEDES           ###########
###########        PROGRAMADOR: LUIZ EDUARDO DA SILVA GOMES        ###########
###########             ROTINA R PARA OBTENCAO DOS GERAS           ###########
##############################################################################
##############################################################################

### 3 GERAS JUNTOS! ###

##############################
# GERA:                         
#  IGPger.INP    
##############################                   
# INPUT:             
#  IGP12_IGPDI12
#  IGP12_IGPM12
#  IGP12_IGPOG12
#  IGP12_INCC12
#  IGP12_IPADI12 
#  IGP12_IPC12
##############################                   
# OUTPUT:          
#  IGP_IGPDIG
#  IGP_IGPMG
#  IGP_IGPOGG
#  IGP_INCCG
#  IGP_IPADIG
#  IGP_IPCG
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
seroutput<-c("IGP_IGPDIG",
             "IGP_IGPMG",
             "IGP_IGPOGG",
             "IGP_INCCG",
             "IGP_IPADIG",
             "IGP_IPCG")
serinput<-c("IGP12_IGPDI12",
            "IGP12_IGPM12",
            "IGP12_IGPOG12",
            "IGP12_INCC12",
            "IGP12_IPADI12", 
            "IGP12_IPC12")
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
  for (i in 3:length(serinput))
  {
    serie <- merge(serie,get(paste0("serie",i)),by="VALDATA",all=T)
    names(serie)[(2*i):((2*i)+1)] <- paste0(c("SERCODIGO.","VALVALOR."),i)
  }
}
serie$VALDATA<-as.Date(serie$VALDATA, origin = "1900-01-01")

## 3.1) SELECIONANDO APENAS OS MESES DE DEZEMBRO - SOMENTE PARA ESSE GERA ##
serie<-subset(serie,(as.POSIXlt(serie[,1])$mon+1) == 12)
serie<-data.frame(serie,row.names=NULL)

## 4) CRIANDO VETOR DE DATAS
## APLICADO EM CONVERS?ES DE SERIES MENSAIS PARA ANUAIS ##
datas<-seq(as.Date(paste0((as.POSIXlt(serie[1,1])$year+1900),"-01-01")),
           as.Date(paste0((as.POSIXlt(serie[dim(serie)[1],1])$year+1901),"-01-01")),
           by='1 year')  
## 5) BLOCO DE OPERACOES MATEMATICAS
GERADO<-data.frame(NULL)
for (i in 2:dim(serie)[1])
{
  if(((is.na(serie[i-1,3])==F))&(serie[i-1,3]!=0)){GERADO[i,1]<-((serie[i,3]/serie[i-1,3])-1)*100} else
    GERADO[i,1]<-NA
  if(((is.na(serie[i-1,5])==F))&(serie[i-1,5]!=0)){GERADO[i,2]<-((serie[i,5]/serie[i-1,5])-1)*100} else
    GERADO[i,2]<-NA
  if(((is.na(serie[i-1,7])==F))&(serie[i-1,7]!=0)){GERADO[i,3]<-((serie[i,7]/serie[i-1,7])-1)*100} else
    GERADO[i,3]<-NA
  if(((is.na(serie[i-1,9])==F))&(serie[i-1,9]!=0)){GERADO[i,4]<-((serie[i,9]/serie[i-1,9])-1)*100} else
    GERADO[i,4]<-NA
  if(((is.na(serie[i-1,11])==F))&(serie[i-1,11]!=0)){GERADO[i,5]<-((serie[i,11]/serie[i-1,11])-1)*100} else
    GERADO[i,5]<-NA
  if(((is.na(serie[i-1,13])==F))&(serie[i-1,13]!=0)){GERADO[i,6]<-((serie[i,13]/serie[i-1,13])-1)*100} else
    GERADO[i,6]<-NA
}
## 6) COLOCANDO NO FORMATO NOVO (PLANILHA GENERICA)
GENERICA<-data.frame(datas[-length(datas)],GERADO)
names(GENERICA)<-c("VALDATA",seroutput)
#######################

# ## 7) VERIFICACAO COM A SERIE NO BANCO
# for(i in 1:length(seroutput))
# { 
#   nomes <- paste0("verif", i)
#   assign(nomes,sqlQuery((odbcConnect("ipeadata",uid="",pwd="")),(paste0("SELECT ipea.vw_Valor.SERCODIGO, CAST (ipea.vw_Valor.VALDATA as NUMERIC) as VALDATA, ipea.vw_Valor.VALVALOR FROM ipea.vw_Valor WHERE (((ipea.vw_Valor.SERCODIGO)='",seroutput[i],"' and ipea.vw_Valor.VALVALOR IS NOT NULL)) order by VALDATA;"))))
#   odbcCloseAll()
# }
# verif <- NULL
# if (length(serinput)==1){verif <- merge(verif1,verif1,by="VALDATA",all=T)}
# if ((length(serinput)>1) & (length(serinput)<=2)){verif <- merge(verif1,verif2,by="VALDATA",all=T)}
# if (length(serinput)>2)
# {
#   verif <- merge(verif1,verif2,by="VALDATA",all=T)
#   for (i in 3:length(serinput))
#   {
#     verif <- merge(verif,get(paste0("verif",i)),by="VALDATA",all=T)
#     names(verif)[(2*i):((2*i)+1)] <- paste0(c("SERCODIGO.","VALVALOR."),i)
#   }
# }
# verif$VALDATA<-as.Date(verif$VALDATA, origin = "1900-01-01")
# verif <- verif[,seq(1,dim(verif)[2],2)]
# names(verif)<-c("VALDATA",seroutput)
# ############ (CTRL+L)
# head(GENERICA)
# head(verif)
# ############ (CTRL+L)
# tail(GENERICA)
# tail(verif)
# #write.xlsx(GENERICA,paste0("IGPger1 ",Sys.Date(),".xls"),sheetName="Generica",row.names=F,showNA=F) 
# write.xlsx(verif,paste0("IGPgerVERIFICACAO1 ",Sys.Date(),".xls"),sheetName="Generica",row.names=F,showNA=F)

##############################
# GERA:                         
#  IGPger.INP    
##############################                   
# INPUT:             
#  IGP12_IGPDI12
#  IGP12_IGPOG12
#  IGP12_IPADI12
#  IGP12_IPAA12
#  IGP12_IPAI12
#  IGP12_IGPF12  
##############################                   
# OUTPUT:          
#  IGP_IGP
#  IGP_IGPOG
#  IGP_IPA
#  IGP_IPAA
#  IGP_IPAI
#  IGP_IGPF 
##############################

## 8) REMOVENDO OS OBJETOS DO PASSO ANTERIOR
rm(list=(ls()[ls()!="GENERICA"]))

## 9) CARREGANDO AS SERIES INPUT E DEFININDO AS SERIES OUTPUT
seroutput<-c("IGP_IGP",
             "IGP_IGPOG",
             "IGP_IPA",
             "IGP_IPAA",
             "IGP_IPAI",
             "IGP_IGPF")
serinput<-c("IGP12_IGPDI12",
            "IGP12_IGPOG12",
            "IGP12_IPADI12",
            "IGP12_IPAA12",
            "IGP12_IPAI12",
            "IGP12_IGPF12")
for(i in 1:length(serinput))
{ 
  nomes <- paste0("serie", i)
  assign(nomes,sqlQuery((odbcConnect("ipeadata",uid="",pwd="")),(paste0("SELECT ipea.vw_Valor.SERCODIGO, CAST (ipea.vw_Valor.VALDATA as NUMERIC) as VALDATA, ipea.vw_Valor.VALVALOR FROM ipea.vw_Valor WHERE (((ipea.vw_Valor.SERCODIGO)='",serinput[i],"' and ipea.vw_Valor.VALVALOR IS NOT NULL)) order by VALDATA;"))))
  odbcCloseAll()
}

## 10) FUNDINDO AS SERIES EM UM UNICO BLOCO DE DADOS
serie <- NULL
if (length(serinput)==1){serie <- merge(serie1,serie1,by="VALDATA",all=T)}
if ((length(serinput)>1) & (length(serinput)<=2)){serie <- merge(serie1,serie2,by="VALDATA",all=T)}
if (length(serinput)>2)
{
  serie <- merge(serie1,serie2,by="VALDATA",all=T)
  for (i in 3:length(serinput))
  {
    serie <- merge(serie,get(paste0("serie",i)),by="VALDATA",all=T)
    names(serie)[(2*i):((2*i)+1)] <- paste0(c("SERCODIGO.","VALVALOR."),i)
  }
}
serie$VALDATA<-as.Date(serie$VALDATA, origin = "1900-01-01")

## 11) CRIANDO VETOR DE DATAS
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

## 12) BLOCO DE OPERACOES MATEMATICAS
GERADO<-data.frame(NULL)
for (i in 2:length(datas))
{
  GERADO[i-1,1] <- mean(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.x)[,1])
  GERADO[i-1,2] <- mean(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.y)[,1])
  GERADO[i-1,3] <- mean(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.3)[,1])
  GERADO[i-1,4] <- mean(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.4)[,1])
  GERADO[i-1,5] <- mean(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.5)[,1])
  GERADO[i-1,6] <- as.numeric(tail(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i] ,select=VALVALOR.6), n = 1L))
}

## 13) COLOCANDO NO FORMATO NOVO (PLANILHA GENERICA)
GENERICA1 <- data.frame(datas[-length(datas)],GERADO)
names(GENERICA1) <- c("VALDATA",seroutput)
#######################

# # 14) VERIFICACAO COM A SERIE NO BANCO
# for(i in 1:length(seroutput))
# { 
#   nomes <- paste0("verif", i)
#   assign(nomes,sqlQuery((odbcConnect("ipeadata",uid="",pwd="")),(paste0("SELECT ipea.vw_Valor.SERCODIGO, CAST (ipea.vw_Valor.VALDATA as NUMERIC) as VALDATA, ipea.vw_Valor.VALVALOR FROM ipea.vw_Valor WHERE (((ipea.vw_Valor.SERCODIGO)='",seroutput[i],"' and ipea.vw_Valor.VALVALOR IS NOT NULL)) order by VALDATA;"))))
#   odbcCloseAll()
# }
# verif <- merge(verif1,verif2,by="VALDATA",all=T)
# verif <- merge(verif,verif3,by="VALDATA",all=T)
# verif <- merge(verif,verif4,by="VALDATA",all=T,suffixes = c(".z",".w"))
# verif <- merge(verif,verif5,by="VALDATA",all=T,suffixes = c(".a",".b"))
# verif <- merge(verif,verif6,by="VALDATA",all=T,suffixes = c(".c",".d"))
# verif <- verif[,seq(1,dim(verif)[2],length.out=length(seroutput)+1)]
# verif$VALDATA<-as.Date(verif$VALDATA, origin = "1900-01-01")
# names(verif)<-c("VALDATA",seroutput)
# ############ (CTRL+L)
# head(GENERICA1)
# head(verif)
# ############ (CTRL+L)
# tail(GENERICA1)
# tail(verif)
# #write.xlsx(GENERICA1,paste0("IGPger2 ",Sys.Date(),".xls"),sheetName="Generica",row.names=F,showNA=F) 
# #write.xlsx(verif,paste0("IGPgerVERIFICACAO2 ",Sys.Date(),".xls"),sheetName="Generica",row.names=F,showNA=F)

##############################
# GERA:                         
#  IGPger.INP   
##############################                   
# INPUT:             
#  IGP_IGPF
##############################                   
# OUTPUT:          
#  IGP_IGPFG
##############################

## 15) JUNTANDO OS 2 RESULTADOS PARCIAIS
GENERICA <- merge(GENERICA,GENERICA1,by="VALDATA",all=T)

## 16) REMOVENDO OS OBJETOS DO PASSO ANTERIOR
rm(list=(ls()[ls()!="GENERICA"]))

## 17) CARREGANDO AS SERIES INPUT E DEFININDO AS SERIES OUTPUT
seroutput <- c("IGP_IGPFG")
serinput <- c("IGP_IGPF")
for(i in 1:length(serinput))
{ 
  nomes <- paste0("serie", i)
  assign(nomes,sqlQuery((odbcConnect("ipeadata",uid="",pwd="")),(paste0("SELECT ipea.vw_Valor.SERCODIGO, CAST (ipea.vw_Valor.VALDATA as NUMERIC) as VALDATA, ipea.vw_Valor.VALVALOR FROM ipea.vw_Valor WHERE (((ipea.vw_Valor.SERCODIGO)='",serinput[i],"' and ipea.vw_Valor.VALVALOR IS NOT NULL)) order by VALDATA;"))))
  odbcCloseAll()
}

## 18) REARRUMANDO A PROPRIA SERIE PARA FICAR NO PADRAO ###
serie <- data.frame(VALDATA=serie1[,2],SERCODIGO=serie1[,1],VALVALOR=serie1[,3])
serie$VALDATA<-as.Date(serie$VALDATA, origin = "1900-01-01")

## 19) BLOCO DE OPERACOES MATEMATICAS
GERADO <- data.frame(NULL)
for (i in 2:dim(serie)[1])
{
  if(serie[i-1,3]!=0){GERADO[i,1] <- 100*((serie[i,3]-serie[(i-1),3])/serie[(i-1),3])} else
    GERADO[i,1] <- NA
}
## 20) COLOCANDO NO FORMATO NOVO (PLANILHA GENERICA)
GENERICA1<-data.frame(serie[,1],GERADO)
names(GENERICA1)<-c("VALDATA",seroutput)

## 21) VERIFICACAO COM A SERIE NO BANCO
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
# head(GENERICA1)
# head(verif)
# ############ (CTRL+L)
# tail(GENERICA1)
# tail(verif)
# #write.xlsx(GENERICA1,paste0("IGPger3 ",Sys.Date(),".xls"),sheetName="Generica",row.names=F,showNA=F) 
# #write.xlsx(verif,paste0("IGPgerVERIFICACAO3 ",Sys.Date(),".xls"),sheetName="Generica",row.names=F,showNA=F)

## 22) JUNTANDO OS 3 RESULTADOS
GENERICA<-merge(GENERICA,GENERICA1,by="VALDATA",all=T)
r<-NULL
for (i in 1:dim(GENERICA)[1]){if (sum(is.na(GENERICA[i,]))==(dim(GENERICA)[2]-1)){r<-c(r,i)}}
if (length(r)>0){GENERICA<-GENERICA[-r,]}
r<-NULL
for (i in 1:dim(GENERICA)[1]){if (sum(is.na(GENERICA[i,]))==0){r<-c(r,i)}}
if (length(r)>0){GENERICA<-GENERICA[r[length(r)]:dim(GENERICA)[1],]}

## 23) SALVANDO EM .XLS
write.xlsx(GENERICA,paste0("IGPger.xls"),sheetName="Generica",row.names=F,showNA=F)
