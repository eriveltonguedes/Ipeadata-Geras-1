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

#Salvando a base voos no formato RDS (mais compacto)
saveRDS(base.testeB, "Base voos.rds")

# Verificando o tamanho do arquivo Base voos.rds
file.size("Base voos.rds")*1e-6









## AULA 3 ##
## 26/09/2017 ##








### Antes de começar, limpe sua área de trabalho

#limpar todos os objetos da memória
remove(list=ls(all=TRUE))

#Retorna o seu diretorio de trabalho corrente
getwd()

#Fixa um diretorio de trabalho (ajuste para o caminho no seu computador)
setwd("C:\\Users\\cursos\\Desktop\\Aula 03")

# Abrindo o arquivo suicidios.csv
# read.csv e read.csv2 

help ("read.csv")

# A diferença eh o separador e o decimal. Se o separador e o decimal for diferente, basta ajustar o parametro
# Para descobrir qual o separador e decimal de uma base csv, abra no bloco de notas


#criando um objeto base com o suicidios, cujo separador vimos que eh ; 

base=read.csv("suicidios.csv", sep=";")

#Transformando a variável sexo em um factor e indicando os rótulos de cada categoria
head(base)
str(base)

#Transformando a variável suicidio por arma de fogo em um factor
base$suicidio_paf = factor(base$suicidio_paf, labels=c("Não","Sim"))

#Transformando a variável Microrregiao em um factor
base$Microrregiao = factor(base$Microrregiao)

#Transformando a variável Escolaridade em um ordered
base$escolaridade = ordered(base$escolaridade,levels=c(1,2,3,4,5,6), labels=c("Analfabeto","1 a 3","4 a 7","8 a 11", "12 ou mais","Desconhecido"))

#Transformando a variável estado civil em um factor
base$estado_civil = factor(base$estado_civil, labels=c("Solteiro","União estavel","Casado","Viuvo", "Divorciado","Desconhecido"))

#Transformando a variável raca em um factor
base$raca = factor(base$raca, labels=c("Branco","Negro","Amarelo","Pardo", "Indigena","Desconhecido"))

#Transformando a variável sexo em um factor
base$sexo = factor(base$sexo, labels=c("Masculino","Feminino"))

#Transformando as variáveis trabalho armado e id_legal
base$id_legal = factor(base$id_legal, labels=c("Não","Sim"))
base$trab_armado = factor(base$trab_armado)

#Visualizando a base tratada
head(base)
str(base)
summary(base)

#Salvando a base no formato RDS (mais compacto)
saveRDS(base, "Base suicidios.rds")


## PACOTE DPLYR ##

# Carregando o pacote dplyr
install.packages("dplyr")
install.packages("DBI")
library(dplyr)

# Fazendo uma amostra #
# Selecionando 3 linhas aleatoriamente
sample_n(base,3)

#Calculando a dimensao da base
dim(base)

# FUNCAO DISTINCT - EXCLUSAO #
# excluindo linhas iguais/duplicadas #
install.packages("lazyeval")
base2=distinct(base)
dim(base2)

# excluindo linhas que possuem Microrregiao igual
base3=distinct(base,Microrregiao)
dim(base3)

# excluindo linhas que possuem idade E escolatridade iguais
base4=distinct(base,idade, escolaridade)
dim(base4)

# FUNCAO SELECT - SELECIONANDO VARIAVEIS #
# Selecionando a variavel idade e  todas as variáveis de trabalho armado até raca na base
base5=select(base,idade, trab_armado:raca)
head(base5)

# Selecionando todas as variaveis com exceção de idade e idade legal
base6=select(base,-c(idade,id_legal))
head(base6)

# Selecionando todas as variaveis cujo nome inicia com e
base7=select(base,starts_with("e"))
head(base7)
#Podem ser úteis também ends_with() e contains().#

# reorganiza o data frame, iniciando com a variável Microrregiao e depois as demais
base8=select(base,Microrregiao,everything())
head(base8)

# FUNCAO RENAME - RENOMEANDO VARIAVEIS #
# Renomeando a variável Microrregiao para micro
base9 = rename(base8,Micro = Microrregiao)
head(base9)

# FUNCAO FILTER - FILTRANDO VARIAVEIS #
# Selecionando / Filtrando somente os indivíduos do sexo masculino
base9 = filter(base, sexo == "Masculino")
head(base9)

# Selecionando somente os indivíduos do sexo masculino e branco
base10 = filter(base, sexo == "Masculino" & raca == "Branco")
head(base10)

# Selecionando somente os indivíduos com escolaridade de 1 a 3 anos e 4 a 7 anos
base11 = filter(base, escolaridade %in% c("1 a 3","4 a 7"))
head(base11)

# Selecionando indivíduos que ou são homens solteiros ou são mulheres casadas
base12 = filter(base, (estado_civil=="Solteiro" & sexo =="Masculino") | (estado_civil=="Casado" & sexo =="Feminino") )
head(base12)

base13 = filter(base, (idade>=30 &  estado_civil=="Solteiro" & id_legal=="Sim"))
head (base13)

# FUNCAO ARRANGE - ORDENANDO VARIAVEIS #
# Ordenando os dados pela variável idade de forma crescente
base13 = arrange(base, idade )
head(base13)

# Ordenando os dados pela variável idade e escolaridade
base14 = arrange(base, idade ,escolaridade)
head(base14)

# Ordenando os dados pela variável idade de forma decrescente
base15 = arrange(base, desc(idade) )
head(base15)

# FUNCAO MUTATE E TRANSMUTE - CRIANDO NOVAS VARIAVEIS #
# MUTATE ADICIONA, TRANSMUTE SUBSTITUI#

# Criando a variável Idade ao quadrado
base16 = mutate(base, idade2 = idade**2 )
head(base16)

# Criando a variável UF e a variável Grandes regiões
base17 = mutate(base, UF = substring(Microrregiao,1,2), Grandes.regioes = substring(UF,1,1) )
head(base17)

# Se você quiser somente manter as variáveis criadas
base18 = transmute(base,UF = substring(Microrregiao,1,2), Grandes.regioes = substring(UF,1,1) )
head(base18)

# Calculando a media e a mediana da variável idade
summarise(base,  media.idade = mean(idade), mediana.idade = median(idade))

summary (base)

#AGRUPANDO E RESUMINDO DADOS #
# Calculando a media da variável idade para as combinações entre sexo, escolaridade e estado civil e a frequencia de indivíduos em cada combinação
grupo = group_by(base, sexo, escolaridade, estado_civil)
resultado=summarise(grupo,  media.idade = mean(idade),frequencia=n())
resultado

# Calculando a media da variável idade para as combinações entre idade legal, escolaridade e estado civil e a frequencia de indivíduos em cada combinação
grupo = group_by(base, id_legal, escolaridade, estado_civil)
resultado=summarise(grupo,  media.idade = mean(idade),frequencia=n())
resultado

# OPERADOR PIPE : %>% ##
# Realiza múltiplas ações sem guardar os passos intermediários.

# Selecionando as variáveis idade e idade legal
base18 = base %>% select(idade,id_legal)
head(base18)

# Sem objetos intermediarios
base19 = base %>% select(-estado_civil) %>% filter(sexo=="Masculino") %>% group_by(raca,escolaridade) %>% summarise(maximo=max(idade),media=mean(idade))
head(base19 , n=10)







## AULA 4 ##
## 28/09/17##







setwd ("C:\\Users\\cursos\\Desktop\\Aula 04")
getwd ()

#Importanto bases txt, xls e csv ##
# LEMBRANDO QUE NO CASO DE TXT TEM QUE COLOCAR HEADER=TRUE PARA ELE LER A PRIMEIRA LINHA #
base.pop=read.table("Populacao por micro sexo e idade.txt", header=TRUE)
base.obitos=read.csv2("Num de obitos 2010.csv")

# Inserção manual do xls #
base.mun=Municipios_2010
rm (Municipios_2010)

# OU #

base.mun <- read_excel("C:/Users/cursos/Desktop/Aula 04/Municipios_2010.xlsx")

library(dplyr)

#AGRUPANDO E RESUMINDO DADOS com PIPE #
# criando a base base.pop2 que contenha todas as Microrregiões agrupadas com suas respectivas populações
base.pop2 = base.pop %>% group_by(Microrregiao)%>%summarise(tot=sum(tot.pop))

# criando um arquivo que contenha somente os códigos distintos das Microrregiões e seus respectivos nomes (base.mun2)
base.mun2 = base.mun %>% distinct(Microrregiao, .keep_all = TRUE) %>% select(Microrregiao, Nome_Micro)


## COMBINANDO DUAS BASES DE DADOS ##


#Criando a base b1
b1 <- data.frame(ID = c(1010, 2010, 3010, 4010, 5010),
                 W = c('a', 'b', 'c', 'd', 'e'),
                 X = c(1, 1, 0, 0, 1),
                 Y=rnorm(5))

#Criando a base b2

b2 <- data.frame(ID = c(1010, 7010, 3010, 6010, 8010),
                 A = c('z', 'b', 'k', 'd', 'l'),
                 B = c(1, 2, 3, 0, 4),
                 C =rnorm(5))

#Criando a base b3

b3 <- data.frame(Identificacao = c(1010, 5010,2541),
                 Z =rnorm(3),
                 W =c("Rio","São Paulo","Niteroi"))

# Note que as 3 bases criadas possuem alguns elementos comuns, outros não

# Função inner_join: Combina as duas bases incluindo todas as variáveis de ambas as bases e todas as linhas comuns as duas bases
merge1 = inner_join(b1,b2,by="ID")
merge1

merge2 = inner_join(b1,b3,by=c("ID"="Identificacao"))
merge2

# Função left_join: Combina as duas bases incluindo todas as variáveis de ambas as bases e todas as linhas da base a esquerda
merge3 = left_join(b1,b2,by="ID")
merge3

# Função right_join: Combina as duas bases incluindo todas as variáveis de ambas as bases e todas as linhas da base a direita
merge4 = right_join(b1,b2,by="ID")
merge4

# Função full_join: Combina as duas bases incluindo todas as variáveis de ambas as bases e todas as linhas de ambas as bases
merge5 = full_join(b1,b2,by="ID")
merge5


# Função semi_join: Combina as duas bases incluindo as variáveis da basea a esquerda e todas as linhas comuns as duas bases
merge6 = semi_join(b1,b2,by="ID")
merge6

# Função anti_join: Combina as duas bases incluindo as variáveis da base a esquerda e todas as linhas que não são comuns as duas bases
merge7 = anti_join(b1,b2,by="ID")
merge7

# Criando uma base conjugada com Microrregiao, nome da microrregiao e total
merge.aux1=inner_join(base.pop2,base.mun2,by="Microrregiao")

merge.aux2=left_join(base.obitos, base.mun, by=c("Codibge7"="codmun")) %>% select (Microrregiao, Nome_Micro, acidente, homicidio, suicidio, indeterminado, veiculos, h_legal)

base.aux=merge.aux2 %>% group_by (Microrregiao) %>% summarise(tot.acidente=sum(acidente))
                                                              
#Combinando dados verticalmente
#Criando a base d1
d1 <- data.frame(ID = c(1010, 2010, 3010, 4010, 5010),
                 W = c('a', 'b', 'a', 'b', 'e'),
                 X = c(1, 1, 0, 0, 1),
                 Y=c(3,6,3,5,7))

#Criando a base d2

d2 <- data.frame(ID = c(1010, 2010, 5010),
                 W = c('a', 'b', 'e'),
                 X = c(1, 1, 1),
                 Y=c(3,6,7))

#Criando a base d3

d3 <- data.frame(ID = c(3210, 2011, 1017),
                 W = c('b', 'e', "a"),
                 X = c(1,0,1),
                 Y=c(3,5,4))
#Criando a base d4

d4 <- data.frame(ID = c(3210, 2011, 1017),
                 idade = c(10,20,32),
                 Sexo = c(1,0,1))

#Criando uma base com as linhas comus as duas bases
intersect(d1,d2)

#Criando uma base unindo todas as linhas das duas bases
union(d1,d3)

#Criando uma base com as linhas distintas nas duas bases
setdiff(d1,d3)

#Empilhando duas bases, uma em cima da outra
rbind(d1,d3)
                                                