#################### IPEA #######################
##### Introducao à Analise de Dados usando R ####
########### Setembro / Outubro 2017 #############
###########  Jony Arrais Pinto Junior ###########




## AULA 1 ##  
## 19/09/2017 ##




# Criando um objeto chamado idade
Idade = c(20,35,34,28,30,31,27)

#Visualizando o objeto criado
Idade

# Calculando a média das idades
mean(Idade)

# Plotando o boxplot das idade
boxplot(Idade)

# Instalando o pacote vioplot
install.packages("vioplot")

packageDescription("vioplot")

installed.packages()

old.packages()

update.packages()

help(package = "vioplot")

help(package = "stats")

?vioplot

library("vioplot")







## AULA 2 ##  
## 21/09/2017 ##






# Criando um vetor com as idades dos entrevistados
Idade = c(20,39,25,28,27,19,45,23,22)

# Visualizando o vetor Idade
Idade

#Criando um vetor com os nomes
# Se a palavra nao estiver escrito com aspas o R vai considerar como um objeto 
Nome <- c("Jony", "Felipe", "Paulo", "Estevão", "Mayra","Helena","Priscila","Roberto","Daniel")

# Visualizando o vetor Nome
Nome

# Caso não soubesse a idade de um dos entrevistados (valores faltantes - missing - NA )
Idade = c(20,39,25,28,27,NA,45,23,22)

# Visualizando o vetor Idade
Idade

# Visualizando somente o quinto elemento do vetor Idade 
# Usar colchetes e colocar a posicao (ou o intervalo ) do elemento
Idade[5]

# Visualizando do segundo ao sexto elemento do vetor Idade
Idade[2:6]

# Modificando o quinto valor do vetor Idade
Idade[5]=10

# Visualizando o vetor Idade
Idade

#Visualizando o valor máximo - funcao max 
max(Idade)

# Nesse caso o valor maximo foi NA. Mas pq?
# Vamos buscar o help da funcao max

help (max)

# No help da funcao max, vemos que o argumento para NA = FALSE. 
#Para excluir o NA, alteramos para na = TRUE
max(Idade, na.rm = TRUE)

## MATRIZES ##

# Funcao matrix #
# Criando uma matriz com 4 linhas e 2 colunas e que será alimentada por linha
A = matrix(c(2,3,4,19,4,5,5,9),ncol=2,nrow=4, dimnames=list(c("L1","L2","L3","L4"),c("C1","C2")))

#Visualizando a matriz A
A

# A matriz em regra e alimentada por colunas, isto e, os valores sao preenchidos por coluna.
# Mas posso inserir o argumento byrow e alimenta-la por linha
A = matrix(c(2,3,4,19,4,5,5,9),ncol=2,nrow=4, dimnames=list(c("L1","L2","L3","L4"),c("C1","C2")), byrow=TRUE)

#Visualizando a (nova) matriz A
A

#Comnhecendo a dimensão da matriz
dim(A)
#Acessando somente os elementos da segunda coluna
A[,2]
#Acessando somente os elementos da terceira linha
A[3,]
#Acessando somente o elemento da primeira coluna e da terceira linha
A[3,1]

## DATA FRAMES ##

# Criando um objeto data frame com 3 variáveis: sexo, idade e nome
base = data.frame(nome=c("João","Maria","Renato","Pedro","Jony","Helena","Bruno","Paulo","Marcelo","Ana"),sexo=c(2,1,2,2,2,1,2,2,2,1),idade=c(10,12,13,15,12,13,12,10,10,11),escolaridade=c(1,1,2,3,2,3,4,1,2,4))

#Visualizando o data frame base
base

#Visualizando somente as linhas iniciais
head(base)

#Visualizando somente as linhas finais
tail(base)

#Acessando somente a variável idade
#Nome do objeto onde se encontra $ nome do objeto que quero acessar
base$idade

#Descobrindo a estrutura de um objeto - tipos de variaveis
str(base)


## TIPOS DE DADOS ##


# A seguir apresentamos os tipos de dados usados com frequência no R 
#para representar variáveis quantitativas e qualitativas.

#R tem 5 classes básicas:

#•logical (ex.., TRUE, FALSE) - LÓGICA
#•integer (ex.,, 2L, as.integer(3)) - QUANTITATIVA 
#•numeric (real or decimal) (ex., 2, 2.0, pi) - QUANTITATIVA
#•complex (ex., 1 + 0i, 1 + 4i) - QUANTITATIVA
#•character (ex., “a”, “swc”) - QUALITATIVA ("factor")

# Verificando as classes dos objetos criados
class(Idade)

class(Nome)

class(A)

# DADOS LOGICOS #
# Verificando quais componentes de Idade são maiores do que 25
Idade>25


#Expressões lógicas são implementadas com os operadores lógicos:
#  •<
#  <
#  menor que;
#•<=
#  <=
#  menor que ou igual a;
#•>
#  >
#  maior que;
#•>=
#  >=
#  maior que ou igual a;
#•==
#  ==
#  igual a;
#•!=
#  !=
#  diferente de.



#Operações importantes utilizando um dado do tipo lógico
Nome[Idade>25]

base[base$escolaridade!=1,]


## FATORES ##

# A variavel "sexo" esta sendo tratata como numeric, mas ela eh qualitativa ("factor")
#Transformando a variável sexo em um factor e indicando os rótulos de cada categoria
#Assumindo que 1 eh feminino e 2 masculino
base$sexo = factor(base$sexo, labels=c("Feminino","Masculino"))

#Visualizando as linhas iniciais da base
head(base)

#analisando novamente a base de dados#
str (base)

#Note-se que agora "sexo" virou "factor"

# variavel qualitativa ordinal #
# Caso a ordem da variável seja importante (qualitativa ordinal), será necessário usar fatores ordenados:

#Transformando a variável escolaridade em um ordered e indicando os rótulos de cada categoria e as suas relações de grandeza
base$escolaridade = ordered(base$escolaridade,levels=c(2,3,4,1), labels=c("Analfabeto","Fundamental","Medio","Superior"))

#Note-se que eles ja devem estar ordenados na ordem correta e associar cada valor a uma categoria

base$sexo

base$escolaridade

#Veja que no caso de escolaridade ele retorna os niveis ordenados

## IMPORTANDO ARQUIVOS PRO R ##
#Descobrindo qual a pasta de trabalho que o R está "enxergando" neste momento
getwd()

#Caso não seja a pasta onde localiza-se o seu arquivo, podemos mudar essa pasta com a função setwd(…).
#setwd("PASSAR AQUI O CAMINHO DA SUA PASTA SEMPRE ENTRE ASPAS")

setwd("C:\\Users\\cursos\\Desktop\\Aula 02")
#Lembrando que em Windows ou dobro a barra ou inverto# 

## IMPORTANDO DADOS ##

#IMPORTANTO TXT
base2 = read.table("Base saude.txt", header=TRUE, dec=",", na.strings=9)
# header+TRUE indica que ha cabecalho; dec="," indica que o que estou usando para decimal eh a vírgula e o na.strings=9 indica que o 9 equivale ao NA

#vendo a estrtutura de base2
str(base2)
summary(base2)

#note-se que ele esta lendo a variavel qualitativa "sexo" como quantitativa

#Tratando as variáveis qualitativas
#Transformando a variável Sexo em um factor
base2$Sexo = factor(base2$Sexo, labels=c("Feminino","Masculino"))

#Transformando a variável HIV em um factor
base2$HIV = factor(base2$HIV, labels=c("Não","Sim"))

#Transformando a variável Escolaridade em um ordered
base2$Escol = ordered(base2$Escol,levels=c(0,1,2,3,4,5), labels=c("Analfabeto","Fundamental Incompleto","Fundamental Completo","Medio Completo", "Medio Incompleto","Superior"))

#Transformando a variável DST em um factor
base2$DST = factor(base2$DST, labels=c("Não","Sim"))

#Transformando a variável Tipo de DST em um factor
base2$Tipo = factor(base2$Tipo, labels=c("Sifilis","Hepatite","Outros"))


#Visualizando a (nova) base
head(base2)
summary (base2)

#IMPORTANTO csv

#Existem 2 funcoes, a read.csv e a read.csv2

#Os principais argumentos da função read.csv(…) são:
#  •file - o nome do arquivo COM A EXTENSÃO ESPECIFICADA;
#•header - se o arquivo possui o nome das variáveis (default = TRUE - possui os nomes das variáveis);
#•sep - separador das variáveis (default - ,);
#•dec - simbolo do decimal (default - .).

#Os principais argumentos da função read.csv2(…) são:
#  •file - o nome do arquivo COM A EXTENSÃO ESPECIFICADA;
#•header - se o arquivo possui o nome das variáveis (default = TRUE - possui os nomes das variáveis);
#•sep - separador das variáveis (default - ;);
#•dec - simbolo do decimal (default - ,).

#Fazendo a leitura do arquivo Base saude.csv
base3 = read.csv2("Base saude.csv", header=TRUE)
head(base3)

#IMPORTANDO XLS e XLSX

# Carregando o pacote xlsx
install.packages("xlsx")
install.packages("rJava")
library(xlsx)
install.packages("readxl")
library(readxl)

#EXPORTANTO DADOS 

# Carregando o pacote xlsx
library(xlsx)

#Exportando o arquivo em .txt
write.table(base2,"Base modificada.txt",row.names=FALSE)
#O row.names=FALSE é para nao criar uma coluna com o numero das linhas, que eh desnecessario

#Exportando o arquivo em .csv
write.csv2(base2,"Base modificada.csv",row.names=FALSE)

#Exportando o arquivo em .csv
write.xlsx(base2,"Base modificada.xlsx",row.names=FALSE)



#GRANDES BASES DE DADOS#



# Verificando o tamanho do arquivo Base modificada.csv
file.size("Base modificada.csv")

# Verificando o tamanho do arquivo Base modificada.txt
file.size("Base modificada.txt")

# Verificando o tamanho do arquivo Base modificada.xlsx
file.size("Base modificada.xlsx")


#Dependo do formato, os arquivos possuem tamanhos distintos e tempos de leituras distintos:
# Verificando o tempo para a leitura do arquivo Base modificada.csv
system.time(base.teste <- read.csv2("Base modificada.csv"))

# Verificando o tempo para a leitura do arquivo Base modificada.txt
system.time(base.teste <- read.table("Base modificada.txt"))

# Verificando o tempo para a leitura do arquivo Base modificada.xlsx
system.time(base.teste <- read.xlsx("Base modificada.xlsx", sheetIndex=1))

# Verificando o tamanho e o tempo para a leitura do arquivo Base voos.csv com a função read.csv
file.size("Base voos.csv")*1e-6
system.time(base.testeA <- read.csv2("Base voos.csv"))


# 2 SOLUCOES PARA GRANDES BASES: DATA.TABLE E ARQUIVOS RDS

install.packages("data.table")
#Carregando o pacote data.table()
library(data.table)

# Verificando o tempo para a leitura do arquivo Base boos.txt com a função fread
system.time(base.testeC <- fread("Base voos.txt"))

#Salvando a base voos
saveRDS(base.testeB, "Base voos.rds")

# Verificando o tamanho do arquivo Base voos.rds
file.size("Base voos.rds")*1e-6
