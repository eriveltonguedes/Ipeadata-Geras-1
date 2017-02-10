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
#  BPAGger.INP     
##############################                   
# INPUT:             
#  BPAG12_AR12
#  BPAG12_BC12
#  BPAG12_BCM12
#  BPAG12_BCX12
#  BPAG12_CF12
#  BPAG12_CK12
#  BPAG12_CKD12
#  BPAG12_CKR12
#  BPAG12_CRCO12
#  BPAG12_CRCOA12
#  BPAG12_CRCOP12
#  BPAG12_CRCOPI12
#  BPAG12_CRCOPS12
#  BPAG12_DER12
#  BPAG12_DERA12
#  BPAG12_DERP12
#  BPAG12_EMP12
#  BPAG12_EMPA12
#  BPAG12_EMPAI12
#  BPAG12_EMPAS12
#  BPAG12_EMPP12
#  BPAG12_EMPPI12
#  BPAG12_EMPPS12
#  BPAG12_EO12
#  BPAG12_ETCP12
#  BPAG12_ETLP12
#  BPAG12_ETLPA12
#  BPAG12_ETLPADE12
#  BPAG12_ETLPAED12
#  BPAG12_ETLPATPRI12
#  BPAG12_ETLPATPUB12
#  BPAG12_ETLPI12
#  BPAG12_ETLPIDE12
#  BPAG12_ETLPIED12
#  BPAG12_ETLPITPRI12
#  BPAG12_ETLPITPUB12
#  BPAG12_HF12
#  BPAG12_HFBAN12
#  BPAG12_HFBC12
#  BPAG12_ICA12
#  BPAG12_ICAA12
#  BPAG12_ICAAA12
#  BPAG12_ICAAV12
#  BPAG12_ICAD12
#  BPAG12_ICAF12
#  BPAG12_ICAFA12
#  BPAG12_ICAFV12
#  BPAG12_ICAR12
#  BPAG12_ICARF12
#  BPAG12_ICARFA12
#  BPAG12_ICARFV12
#  BPAG12_ICP12
#  BPAG12_ICPA12
#  BPAG12_ICPAI12
#  BPAG12_ICPAS12
#  BPAG12_ICPD12
#  BPAG12_ICPF12
#  BPAG12_ICPFI12
#  BPAG12_ICPFS12
#  BPAG12_ICPR12
#  BPAG12_ICPRF12
#  BPAG12_ICPRFD12
#  BPAG12_ICPRFDI12
#  BPAG12_ICPRFDS12
#  BPAG12_ICPRFI12
#  BPAG12_ICPRFIN12
#  BPAG12_ICPRFINI12
#  BPAG12_ICPRFINS12
#  BPAG12_ICPRFS12
#  BPAG12_IDE12
#  BPAG12_IDEI12
#  BPAG12_IDEOI12
#  BPAG12_IDEOIA12
#  BPAG12_IDEOIC12
#  BPAG12_IDEPC12
#  BPAG12_IDEPCI12
#  BPAG12_IDEPCLR12
#  BPAG12_IDEPCS12
#  BPAG12_IDES12
#  BPAG12_IDP12
#  BPAG12_IDPI12
#  BPAG12_IDPOI12
#  BPAG12_IDPOIA12
#  BPAG12_IDPOIC12
#  BPAG12_IDPPC12
#  BPAG12_IDPPCI12
#  BPAG12_IDPPCLR12
#  BPAG12_IDPPCS12
#  BPAG12_IDPS12
#  BPAG12_MD12
#  BPAG12_MDA12
#  BPAG12_MDP12
#  BPAG12_OI12
#  BPAG12_OIA12
#  BPAG12_OIP12
#  BPAG12_RP12
#  BPAG12_RPD12
#  BPAG12_RPIC12
#  BPAG12_RPICD12
#  BPAG12_RPICJUDOM12
#  BPAG12_RPICJUEX12
#  BPAG12_RPICJUEXD12
#  BPAG12_RPICJUEXR12
#  BPAG12_RPICLD12
#  BPAG12_RPICLDD12
#  BPAG12_RPICLDR12
#  BPAG12_RPICR12
#  BPAG12_RPID12
#  BPAG12_RPIDD12
#  BPAG12_RPIDJU12
#  BPAG12_RPIDJUD12
#  BPAG12_RPIDJUR12
#  BPAG12_RPIDLD12
#  BPAG12_RPIDLDD12
#  BPAG12_RPIDLDR12
#  BPAG12_RPIDLR12
#  BPAG12_RPIDLRD12
#  BPAG12_RPIDLRR12
#  BPAG12_RPIDR12
#  BPAG12_RPOI12
#  BPAG12_RPOID12
#  BPAG12_RPOIR12
#  BPAG12_RPR12
#  BPAG12_RPRES12
#  BPAG12_RPSAL12
#  BPAG12_RPSALD12
#  BPAG12_RPSALR12
#  BPAG12_RS12
#  BPAG12_RSD12
#  BPAG12_RSR12
#  BPAG12_SER12
#  BPAG12_SERALUG12
#  BPAG12_SERALUGD12
#  BPAG12_SERALUGR12
#  BPAG12_SERCONST12
#  BPAG12_SERCONSTD12
#  BPAG12_SERCONSTR12
#  BPAG12_SERCULT12
#  BPAG12_SERCULTD12
#  BPAG12_SERCULTR12
#  BPAG12_SERD12
#  BPAG12_SERFIN12
#  BPAG12_SERFIND12
#  BPAG12_SERFINR12
#  BPAG12_SERGOV12
#  BPAG12_SERGOVD12
#  BPAG12_SERGOVR12
#  BPAG12_SERINT12
#  BPAG12_SERINTD12
#  BPAG12_SERINTR12
#  BPAG12_SERMANUF12
#  BPAG12_SERMANUFD12
#  BPAG12_SERMANUFR12
#  BPAG12_SERMANUT12
#  BPAG12_SERMANUTD12
#  BPAG12_SERMANUTR12
#  BPAG12_SEROUTROS12
#  BPAG12_SEROUTROSD12
#  BPAG12_SEROUTROSR12
#  BPAG12_SERR12
#  BPAG12_SERSEG12
#  BPAG12_SERSEGD12
#  BPAG12_SERSEGR12
#  BPAG12_SERTEL12
#  BPAG12_SERTELD12
#  BPAG12_SERTELR12
#  BPAG12_SERTRANS12
#  BPAG12_SERTRANSD12
#  BPAG12_SERTRANSR12
#  BPAG12_SERVIAG12
#  BPAG12_SERVIAGD12
#  BPAG12_SERVIAGR12
#  BPAG12_TC12
#  BPAG12_TCPIB12
##############################                   
# OUTPUT:          
#  BPAG_AR
#  BPAG_BC
#  BPAG_BCM
#  BPAG_BCX
#  BPAG_CF
#  BPAG_CK
#  BPAG_CKD
#  BPAG_CKR
#  BPAG_CRCO
#  BPAG_CRCOA
#  BPAG_CRCOP
#  BPAG_CRCOPI
#  BPAG_CRCOPS
#  BPAG_DER
#  BPAG_DERA
#  BPAG_DERP
#  BPAG_EMP
#  BPAG_EMPA
#  BPAG_EMPAI
#  BPAG_EMPAS
#  BPAG_EMPP
#  BPAG_EMPPI
#  BPAG_EMPPS
#  BPAG_EO
#  BPAG_ETCP
#  BPAG_ETLP
#  BPAG_ETLPA
#  BPAG_ETLPADE
#  BPAG_ETLPAED
#  BPAG_ETLPATPRI
#  BPAG_ETLPATPUB
#  BPAG_ETLPI
#  BPAG_ETLPIDE
#  BPAG_ETLPIED
#  BPAG_ETLPITPRI
#  BPAG_ETLPITPUB
#  BPAG_HF
#  BPAG_HFBAN
#  BPAG_HFBC
#  BPAG_ICA
#  BPAG_ICAA
#  BPAG_ICAAA
#  BPAG_ICAAV
#  BPAG_ICAD
#  BPAG_ICAF
#  BPAG_ICAFA
#  BPAG_ICAFV
#  BPAG_ICAR
#  BPAG_ICARF
#  BPAG_ICARFA
#  BPAG_ICARFV
#  BPAG_ICP
#  BPAG_ICPA
#  BPAG_ICPAI
#  BPAG_ICPAS
#  BPAG_ICPD
#  BPAG_ICPF
#  BPAG_ICPFI
#  BPAG_ICPFS
#  BPAG_ICPR
#  BPAG_ICPRF
#  BPAG_ICPRFD
#  BPAG_ICPRFDI
#  BPAG_ICPRFDS
#  BPAG_ICPRFI
#  BPAG_ICPRFIN
#  BPAG_ICPRFINI
#  BPAG_ICPRFINS
#  BPAG_ICPRFS
#  BPAG_IDE
#  BPAG_IDEI
#  BPAG_IDEOI
#  BPAG_IDEOIA
#  BPAG_IDEOIC
#  BPAG_IDEPC
#  BPAG_IDEPCI
#  BPAG_IDEPCLR
#  BPAG_IDEPCS
#  BPAG_IDES
#  BPAG_IDP
#  BPAG_IDPI
#  BPAG_IDPOI
#  BPAG_IDPOIA
#  BPAG_IDPOIC
#  BPAG_IDPPC
#  BPAG_IDPPCI
#  BPAG_IDPPCLR
#  BPAG_IDPPCS
#  BPAG_IDPS
#  BPAG_MD
#  BPAG_MDA
#  BPAG_MDP
#  BPAG_OI
#  BPAG_OIA
#  BPAG_OIP
#  BPAG_RP
#  BPAG_RPD
#  BPAG_RPIC
#  BPAG_RPICD
#  BPAG_RPICJUDOM
#  BPAG_RPICJUEX
#  BPAG_RPICJUEXD
#  BPAG_RPICJUEXR
#  BPAG_RPICLD
#  BPAG_RPICLDD
#  BPAG_RPICLDR
#  BPAG_RPICR
#  BPAG_RPID
#  BPAG_RPIDD
#  BPAG_RPIDJU
#  BPAG_RPIDJUD
#  BPAG_RPIDJUR
#  BPAG_RPIDLD
#  BPAG_RPIDLDD
#  BPAG_RPIDLDR
#  BPAG_RPIDLR
#  BPAG_RPIDLRD
#  BPAG_RPIDLRR
#  BPAG_RPIDR
#  BPAG_RPOI
#  BPAG_RPOID
#  BPAG_RPOIR
#  BPAG_RPR
#  BPAG_RPRES
#  BPAG_RPSAL
#  BPAG_RPSALD
#  BPAG_RPSALR
#  BPAG_RS
#  BPAG_RSD
#  BPAG_RSR
#  BPAG_SER
#  BPAG_SERALUG
#  BPAG_SERALUGD
#  BPAG_SERALUGR
#  BPAG_SERCONST
#  BPAG_SERCONSTD
#  BPAG_SERCONSTR
#  BPAG_SERCULT
#  BPAG_SERCULTD
#  BPAG_SERCULTR
#  BPAG_SERD
#  BPAG_SERFIN
#  BPAG_SERFIND
#  BPAG_SERFINR
#  BPAG_SERGOV
#  BPAG_SERGOVD
#  BPAG_SERGOVR
#  BPAG_SERINT
#  BPAG_SERINTD
#  BPAG_SERINTR
#  BPAG_SERMANUF
#  BPAG_SERMANUFD
#  BPAG_SERMANUFR
#  BPAG_SERMANUT
#  BPAG_SERMANUTD
#  BPAG_SERMANUTR
#  BPAG_SEROUTROS
#  BPAG_SEROUTROSD
#  BPAG_SEROUTROSR
#  BPAG_SERR
#  BPAG_SERSEG
#  BPAG_SERSEGD
#  BPAG_SERSEGR
#  BPAG_SERTEL
#  BPAG_SERTELD
#  BPAG_SERTELR
#  BPAG_SERTRANS
#  BPAG_SERTRANSD
#  BPAG_SERTRANSR
#  BPAG_SERVIAG
#  BPAG_SERVIAGD
#  BPAG_SERVIAGR
#  BPAG_TC
#  BPAG_TCPIB
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
serinput<-c("BPAG12_AR12",
            "BPAG12_BC12",
            "BPAG12_BCM12",
            "BPAG12_BCX12",
            "BPAG12_CF12",
            "BPAG12_CK12",
            "BPAG12_CKD12",
            "BPAG12_CKR12",
            "BPAG12_CRCO12",
            "BPAG12_CRCOA12",
            "BPAG12_CRCOP12",
            "BPAG12_CRCOPI12",
            "BPAG12_CRCOPS12",
            "BPAG12_DER12",
            "BPAG12_DERA12",
            "BPAG12_DERP12",
            "BPAG12_EMP12",
            "BPAG12_EMPA12",
            "BPAG12_EMPAI12",
            "BPAG12_EMPAS12",
            "BPAG12_EMPP12",
            "BPAG12_EMPPI12",
            "BPAG12_EMPPS12",
            "BPAG12_EO12",
            "BPAG12_ETCP12",
            "BPAG12_ETLP12",
            "BPAG12_ETLPA12",
            "BPAG12_ETLPADE12",
            "BPAG12_ETLPAED12",
            "BPAG12_ETLPATPRI12",
            "BPAG12_ETLPATPUB12",
            "BPAG12_ETLPI12",
            "BPAG12_ETLPIDE12",
            "BPAG12_ETLPIED12",
            "BPAG12_ETLPITPRI12",
            "BPAG12_ETLPITPUB12",
            "BPAG12_HF12",
            "BPAG12_HFBAN12",
            "BPAG12_HFBC12",
            "BPAG12_ICA12",
            "BPAG12_ICAA12",
            "BPAG12_ICAAA12",
            "BPAG12_ICAAV12",
            "BPAG12_ICAD12",
            "BPAG12_ICAF12",
            "BPAG12_ICAFA12",
            "BPAG12_ICAFV12",
            "BPAG12_ICAR12",
            "BPAG12_ICARF12",
            "BPAG12_ICARFA12",
            "BPAG12_ICARFV12",
            "BPAG12_ICP12",
            "BPAG12_ICPA12",
            "BPAG12_ICPAI12",
            "BPAG12_ICPAS12",
            "BPAG12_ICPD12",
            "BPAG12_ICPF12",
            "BPAG12_ICPFI12",
            "BPAG12_ICPFS12",
            "BPAG12_ICPR12",
            "BPAG12_ICPRF12",
            "BPAG12_ICPRFD12",
            "BPAG12_ICPRFDI12",
            "BPAG12_ICPRFDS12",
            "BPAG12_ICPRFI12",
            "BPAG12_ICPRFIN12",
            "BPAG12_ICPRFINI12",
            "BPAG12_ICPRFINS12",
            "BPAG12_ICPRFS12",
            "BPAG12_IDE12",
            "BPAG12_IDEI12",
            "BPAG12_IDEOI12",
            "BPAG12_IDEOIA12",
            "BPAG12_IDEOIC12",
            "BPAG12_IDEPC12",
            "BPAG12_IDEPCI12",
            "BPAG12_IDEPCLR12",
            "BPAG12_IDEPCS12",
            "BPAG12_IDES12",
            "BPAG12_IDP12",
            "BPAG12_IDPI12",
            "BPAG12_IDPOI12",
            "BPAG12_IDPOIA12",
            "BPAG12_IDPOIC12",
            "BPAG12_IDPPC12",
            "BPAG12_IDPPCI12",
            "BPAG12_IDPPCLR12",
            "BPAG12_IDPPCS12",
            "BPAG12_IDPS12",
            "BPAG12_MD12",
            "BPAG12_MDA12",
            "BPAG12_MDP12",
            "BPAG12_OI12",
            "BPAG12_OIA12",
            "BPAG12_OIP12",
            "BPAG12_RP12",
            "BPAG12_RPD12",
            "BPAG12_RPIC12",
            "BPAG12_RPICD12",
            "BPAG12_RPICJUDOM12",
            "BPAG12_RPICJUEX12",
            "BPAG12_RPICJUEXD12",
            "BPAG12_RPICJUEXR12",
            "BPAG12_RPICLD12",
            "BPAG12_RPICLDD12",
            "BPAG12_RPICLDR12",
            "BPAG12_RPICR12",
            "BPAG12_RPID12",
            "BPAG12_RPIDD12",
            "BPAG12_RPIDJU12",
            "BPAG12_RPIDJUD12",
            "BPAG12_RPIDJUR12",
            "BPAG12_RPIDLD12",
            "BPAG12_RPIDLDD12",
            "BPAG12_RPIDLDR12",
            "BPAG12_RPIDLR12",
            "BPAG12_RPIDLRD12",
            "BPAG12_RPIDLRR12",
            "BPAG12_RPIDR12",
            "BPAG12_RPOI12",
            "BPAG12_RPOID12",
            "BPAG12_RPOIR12",
            "BPAG12_RPR12",
            "BPAG12_RPRES12",
            "BPAG12_RPSAL12",
            "BPAG12_RPSALD12",
            "BPAG12_RPSALR12",
            "BPAG12_RS12",
            "BPAG12_RSD12",
            "BPAG12_RSR12",
            "BPAG12_SER12",
            "BPAG12_SERALUG12",
            "BPAG12_SERALUGD12",
            "BPAG12_SERALUGR12",
            "BPAG12_SERCONST12",
            "BPAG12_SERCONSTD12",
            "BPAG12_SERCONSTR12",
            "BPAG12_SERCULT12",
            "BPAG12_SERCULTD12",
            "BPAG12_SERCULTR12",
            "BPAG12_SERD12",
            "BPAG12_SERFIN12",
            "BPAG12_SERFIND12",
            "BPAG12_SERFINR12",
            "BPAG12_SERGOV12",
            "BPAG12_SERGOVD12",
            "BPAG12_SERGOVR12",
            "BPAG12_SERINT12",
            "BPAG12_SERINTD12",
            "BPAG12_SERINTR12",
            "BPAG12_SERMANUF12",
            "BPAG12_SERMANUFD12",
            "BPAG12_SERMANUFR12",
            "BPAG12_SERMANUT12",
            "BPAG12_SERMANUTD12",
            "BPAG12_SERMANUTR12",
            "BPAG12_SEROUTROS12",
            "BPAG12_SEROUTROSD12",
            "BPAG12_SEROUTROSR12",
            "BPAG12_SERR12",
            "BPAG12_SERSEG12",
            "BPAG12_SERSEGD12",
            "BPAG12_SERSEGR12",
            "BPAG12_SERTEL12",
            "BPAG12_SERTELD12",
            "BPAG12_SERTELR12",
            "BPAG12_SERTRANS12",
            "BPAG12_SERTRANSD12",
            "BPAG12_SERTRANSR12",
            "BPAG12_SERVIAG12",
            "BPAG12_SERVIAGD12",
            "BPAG12_SERVIAGR12",
            "BPAG12_TC12",
            "BPAG12_TCPIB12")
seroutput<-c("BPAG_AR",
             "BPAG_BC",
             "BPAG_BCM",
             "BPAG_BCX",
             "BPAG_CF",
             "BPAG_CK",
             "BPAG_CKD",
             "BPAG_CKR",
             "BPAG_CRCO",
             "BPAG_CRCOA",
             "BPAG_CRCOP",
             "BPAG_CRCOPI",
             "BPAG_CRCOPS",
             "BPAG_DER",
             "BPAG_DERA",
             "BPAG_DERP",
             "BPAG_EMP",
             "BPAG_EMPA",
             "BPAG_EMPAI",
             "BPAG_EMPAS",
             "BPAG_EMPP",
             "BPAG_EMPPI",
             "BPAG_EMPPS",
             "BPAG_EO",
             "BPAG_ETCP",
             "BPAG_ETLP",
             "BPAG_ETLPA",
             "BPAG_ETLPADE",
             "BPAG_ETLPAED",
             "BPAG_ETLPATPRI",
             "BPAG_ETLPATPUB",
             "BPAG_ETLPI",
             "BPAG_ETLPIDE",
             "BPAG_ETLPIED",
             "BPAG_ETLPITPRI",
             "BPAG_ETLPITPUB",
             "BPAG_HF",
             "BPAG_HFBAN",
             "BPAG_HFBC",
             "BPAG_ICA",
             "BPAG_ICAA",
             "BPAG_ICAAA",
             "BPAG_ICAAV",
             "BPAG_ICAD",
             "BPAG_ICAF",
             "BPAG_ICAFA",
             "BPAG_ICAFV",
             "BPAG_ICAR",
             "BPAG_ICARF",
             "BPAG_ICARFA",
             "BPAG_ICARFV",
             "BPAG_ICP",
             "BPAG_ICPA",
             "BPAG_ICPAI",
             "BPAG_ICPAS",
             "BPAG_ICPD",
             "BPAG_ICPF",
             "BPAG_ICPFI",
             "BPAG_ICPFS",
             "BPAG_ICPR",
             "BPAG_ICPRF",
             "BPAG_ICPRFD",
             "BPAG_ICPRFDI",
             "BPAG_ICPRFDS",
             "BPAG_ICPRFI",
             "BPAG_ICPRFIN",
             "BPAG_ICPRFINI",
             "BPAG_ICPRFINS",
             "BPAG_ICPRFS",
             "BPAG_IDE",
             "BPAG_IDEI",
             "BPAG_IDEOI",
             "BPAG_IDEOIA",
             "BPAG_IDEOIC",
             "BPAG_IDEPC",
             "BPAG_IDEPCI",
             "BPAG_IDEPCLR",
             "BPAG_IDEPCS",
             "BPAG_IDES",
             "BPAG_IDP",
             "BPAG_IDPI",
             "BPAG_IDPOI",
             "BPAG_IDPOIA",
             "BPAG_IDPOIC",
             "BPAG_IDPPC",
             "BPAG_IDPPCI",
             "BPAG_IDPPCLR",
             "BPAG_IDPPCS",
             "BPAG_IDPS",
             "BPAG_MD",
             "BPAG_MDA",
             "BPAG_MDP",
             "BPAG_OI",
             "BPAG_OIA",
             "BPAG_OIP",
             "BPAG_RP",
             "BPAG_RPD",
             "BPAG_RPIC",
             "BPAG_RPICD",
             "BPAG_RPICJUDOM",
             "BPAG_RPICJUEX",
             "BPAG_RPICJUEXD",
             "BPAG_RPICJUEXR",
             "BPAG_RPICLD",
             "BPAG_RPICLDD",
             "BPAG_RPICLDR",
             "BPAG_RPICR",
             "BPAG_RPID",
             "BPAG_RPIDD",
             "BPAG_RPIDJU",
             "BPAG_RPIDJUD",
             "BPAG_RPIDJUR",
             "BPAG_RPIDLD",
             "BPAG_RPIDLDD",
             "BPAG_RPIDLDR",
             "BPAG_RPIDLR",
             "BPAG_RPIDLRD",
             "BPAG_RPIDLRR",
             "BPAG_RPIDR",
             "BPAG_RPOI",
             "BPAG_RPOID",
             "BPAG_RPOIR",
             "BPAG_RPR",
             "BPAG_RPRES",
             "BPAG_RPSAL",
             "BPAG_RPSALD",
             "BPAG_RPSALR",
             "BPAG_RS",
             "BPAG_RSD",
             "BPAG_RSR",
             "BPAG_SER",
             "BPAG_SERALUG",
             "BPAG_SERALUGD",
             "BPAG_SERALUGR",
             "BPAG_SERCONST",
             "BPAG_SERCONSTD",
             "BPAG_SERCONSTR",
             "BPAG_SERCULT",
             "BPAG_SERCULTD",
             "BPAG_SERCULTR",
             "BPAG_SERD",
             "BPAG_SERFIN",
             "BPAG_SERFIND",
             "BPAG_SERFINR",
             "BPAG_SERGOV",
             "BPAG_SERGOVD",
             "BPAG_SERGOVR",
             "BPAG_SERINT",
             "BPAG_SERINTD",
             "BPAG_SERINTR",
             "BPAG_SERMANUF",
             "BPAG_SERMANUFD",
             "BPAG_SERMANUFR",
             "BPAG_SERMANUT",
             "BPAG_SERMANUTD",
             "BPAG_SERMANUTR",
             "BPAG_SEROUTROS",
             "BPAG_SEROUTROSD",
             "BPAG_SEROUTROSR",
             "BPAG_SERR",
             "BPAG_SERSEG",
             "BPAG_SERSEGD",
             "BPAG_SERSEGR",
             "BPAG_SERTEL",
             "BPAG_SERTELD",
             "BPAG_SERTELR",
             "BPAG_SERTRANS",
             "BPAG_SERTRANSD",
             "BPAG_SERTRANSR",
             "BPAG_SERVIAG",
             "BPAG_SERVIAGD",
             "BPAG_SERVIAGR",
             "BPAG_TC",
             "BPAG_TCPIB")

###############################################################################
# DESCRIÇÃO BREVE: 
# - Esta rotina calcula a soma de valores de uma
#   série mensal e cria uma série anual correspondente.
# - NÃO são considerados todos os valores, 
#   portanto o ano só será atualizado quando o 12o mês também o for.
# - Para acrescentar novo par de séries, atenção pois APENAS o
#   último par é calculado de MANEIRA DISTINTA dos outros
# - CUIDADO: testar os resultados antes de aplicar
###############################################################################

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

## 4) CRIANDO VETOR DE DATAS
## APLICADO EM CONVERSOES DE SERIES MENSAIS PARA ANUAIS ##
# "Se os dados iniciam apos o mes 01, nao fica caracterizado um ano completo." # 
k <- 0
if ((as.POSIXlt(serie[1,1])$mon+1)!=1) {k<-1}
h<-0
if ((as.POSIXlt(serie[dim(serie)[1],1])$mon+1==12)) {h<-1}
datas<-seq(as.Date(paste0((as.POSIXlt(serie[1,1])$year+1900+k),"-01-01")),
           as.Date(paste0((as.POSIXlt(serie[dim(serie)[1],1])$year+1900+h),"-01-01")),
           by='1 year')  

## 5) BLOCO DE OPERACOES MATEMATICAS
# "Calcula a soma anual"
# (serie 1 a 173 do banco)
GERADO<-data.frame(NULL)
for (i in 2:length(datas)){for (j in 1:(length(serinput)-1)){GERADO[i-1,j] <- sum(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i])[,(3+(j-1)*2)],na.rm=F)}}

# "Calcula o fim do período"
# serie 174
for (i in 2:length(datas)){GERADO[i-1,174] <- subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i])[length(subset(serie, serie$VALDATA >= datas[i-1] & serie$VALDATA < datas[i])[,(3+(174-1)*2)]),(3+(174-1)*2)]}

## 6) COLOCANDO NO FORMATO NOVO (PLANILHA GENERICA)
GENERICA<-data.frame(datas[-length(datas)],GERADO)
names(GENERICA)<-c("VALDATA",seroutput)
r<-NULL
for (i in 1:dim(GENERICA)[1]){if (sum(is.na(GENERICA[i,]))==0){r<-c(r,i)}}
# "Permanece apenas os últimos g valores"
g <- 5
if (length(r)>0){GENERICA<-GENERICA[r[length(r)-(g-1)]:dim(GENERICA)[1],]}

## 7) SALVANDO EM .XLS
write.xlsx(GENERICA,paste0("BPAGger.xls"),sheetName="Generica",row.names=F,showNA=F)

# #######################
# ##8) VERIFICACAO COM A SERIE NO BANCO
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
# verif <-  verif[,seq(1,dim(verif)[2],2)]
# names(verif)<-c("VALDATA",seroutput)
# ############ (CTRL+L)
# head(GENERICA)
# head(verif)
# ############ (CTRL+L)
# tail(GENERICA)
# tail(verif)
# # #write.xlsx(verif,paste0("BPAGgerVERIFICACAO ",Sys.Date(),".xls"),sheetName="Generica",row.names=F,showNA=F) 

