# Analisando o painel
library(plm)
library(dplyr)
library(readxl)
library(lmtest)
library(sandwich)

# dados
df <- read_excel("C:/Users/Lucas/Desktop/Projeto TCC/dados_2.xls")
df$ypessoa<-as.numeric(gsub(",",'.', df$ypessoa))

summary(df)

# painel
# Agora, o painel:
data_panel<- pdata.frame(df, index=c('id',"ano"))

summary(data_panel)

#verificando se o painel e balanceado
pdim(data_panel)

#verificando a variacao das variaveis no tempo e individuos
pvar(data_panel)

lapply(data_panel,
       function(x) { length(which(is.na(x)))})
##################
### Pooled OLS ###
##################
modelo1 <- pggls(ypessoa ~ x5+
                 x7+
                 x8+
                 x9+
                 x10+
                 x11,
               data = data_panel,
               model = 'pooling')

summary(modelo1)
coeftest(modelo1, vcov = vcovHC(modelo1, type = "HC0"))

#######################################
### ESTIMADOR DE EFEITOS ALEATORIOS ###
#######################################
modelo2 <- pggls(ypessoa ~ x5+
                 x7+
                 x8+
                 x9+
                 x10+
                 x11,
               data = data_panel,
               model = 'random')

summary(modelo2)

coeftest(modelo2, vcov = vcovHC(modelo2, type = "HC0"))

#######################################################
### ESTIMADOR DE EFEITOS FIXOS E PRIMEIRA DIFERENCA ###
#######################################################
modelo3 <- pggls(ypessoa ~ x5+
                 x7+
                 x8+
                 x9+
                 x10+
                 x11,
               data = data_panel,
               model = 'within')

summary(modelo3)
