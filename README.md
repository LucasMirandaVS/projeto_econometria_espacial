# Analisando as relações entre renda e criminalidade em Minas Gerais

Neste projeto, fiz uso de uma análise de regressão para invetsigar as relações entre nível de renda e criminalidade nos municípios de Minas Gerais. O projeto foi realizado usando a linguagem R.

## Motivação

Há um progressivo número de indivíduos penalizado pela prática de crimes que atingem os bens materiais e as pessoas, e que grande parte dos encarceramentos no Brasil são oriundos de crimes violentos, sendo muitos desses praticados por jovens. Com essa motivação, este projeto tem como objetivo analisar a relação existente entre o nível de renda e o aumento da criminalidade em Minas Gerais nos anos de 2000 e 2010, assim como o protagonismo da população jovem.

## Objetivos do Projeto

* Analisar se o nível de pobreza afeta a criminalidade nos municípios de Minas Gerais-MG.
* Estimar uma regressão de criminalidade e seus determinantes

## Metodologia

Uma análise econométrica visa avaliar como a mudança em uma variável pode afetar outra, e pode ser realizada através de três estruturas distintas, são elas: cross-section, séries temporais e dados em painel. O primeiro considera observações de diferentes elementos por um único período de tempo; o segundo segue um elemento ao longo do tempo; e a terceira combina vários elementos e períodos de tempo. Como este trabalho tem como objetivo analisar o efeito das variáveis socioeconômicas de renda, educação e emprego se relacionam com a criminalidade ao longo do tempo, optou-se pelo modelo de dados em painel.

### Dados

Os dados utilizados no projeto foram obtidos no site da [Fundação João Pinheiro](http://fjp.mg.gov.br/), e correspondem aos 853 municípios mineiros para os
períodos de 2000 e 2010. São eles:

* **Y** -  Taxa de crimes contra a pessoa (por 100 mil habitantes) 
* **rendformal** - Rendimento Per Capita no Setor Formal
* **analfabet** - Taxa de Analfabetismo da população de 15 anos ou mais
* **taxadesocup** - Taxa de desocupação de 18 anos ou mais
* **educrenda** - Percentual de pessoas de 15 a 24 anos que não estudam, não trabalham e têm renda per capita inferior a R$255,00 na população total dessa faixa etária 
* **GINI** - Índice de Gini 
* **policia** - Razão entre o número de policiais (Civil ou Militar) lotados no município e população total

Dessa forma, a equação estimada tem a seguinte forma:
![image](https://user-images.githubusercontent.com/77032413/192069803-6a7eb6bc-a31d-4d97-ae26-105d89bf7e5c.png)

## Resultados

A estimativa de um modelo de dados em painel ocorre através de diferentes métodos. Neste trabalho, foram considerados os MQO agrupados, efeitos fixos e efeitos aleatórios. Após testar os três estimadores distintos, os resultados são apresentados na tabela abaixo:

![image](https://user-images.githubusercontent.com/77032413/192069590-8f761cbc-ccaa-4aff-bac8-f560bfae69b9.png)

O primeiro passo para escolher o modelo que melhor se adapta aos dados é verificar a robustez dos métodos ao modelo proposto é realizar um teste de Breusch-Pagan, cuja hipótese nula é que o MQO agrupado é a melhor escolha e a hipótese alternativa é que o efeito aleatório é a melhor opção. Pelo resultado, indica-se um efeito aleatório, em detrimento ao MQO agrupado, pois Prob > F = 0.0000, rejeita H0 a 1% de significância.

Em seguida foi aplicado o teste de Chow, que compara o MQO como hipótese nula com o efeito fixo sendo a hipótese alternativa. Os resultados indicaram um efeito fixo em detrimento ao MQO, pois Prob > F = 0.0000, rejeitando H0 com 1% se significância. 

Por último, foi aplicado o teste de Hausman, cuja hipótese nula é a de um efeito aleatório consistente e assintoticamente eficiente ou efeito fixo consistente (no caso, optamos por um efeito aleatório), e a hipótese alternativa é a de um efeito aleatório inconsistente ou efeito fixo consistente (optamos pelo efeito fixo). Pelo resultado, indicamos um efeito aleatório em detrimento do efeito fixo, pois Prob>chi2 = 0.1895, aceita-se H0.

Feita a escolha do modelo, resta interpretar seus resultados. Vale salientar que nessa etapa foram incluidos no modelo erros padrão robustos de modo a lidar com a heterogeneidade não observado decorrente da organização dos dados em painel. Os coeficientes com os erros padrão robusto são os que seguem:

![image](https://user-images.githubusercontent.com/77032413/192069705-a4c3de56-c718-47c1-8bbf-8ebff2279830.png)

Os resultados obtidos corroboram a hipótese que o nível de renda afeta positivamente o nível de criminalidade dos municípios, quando esses estão associados a outras variáveis de controle. Isso porque, maior rentabilidade esperada para o crime, quando se tem elevação da renda, que também pode estar associada ao custo de oportunidade de cometer-se o crime. Também é possível inferir que maiores taxas de desemprego analfabetismo também afeta positiva e estatisticamente significante os índices de violência nos municípios mineiros no período estudado.

Por outro lado, razão da força policial em relação aos habitantes evidencia reduz o nível de crimes praticados contra as pessoas, nos municípios mineiros para
os anos de 2000 e 2010. Esse resultado mostra a necessidade de investimentos em segurança pública, ao passo que um incremento dessa variável resulta em taxas de violência menores.

Ainda que o Índice de Gini e Percentual de pessoas de 15 a 24 anos que não estudam, não trabalham e têm renda per capita inferior a R$ 255,00 na população total dessa faixa etária tenham demonstrado sinais esperados em relação aos crimes cometidos contra as pessoas, tais variáveis não se mostraram significativas.

## Conclusão

Este projeto tem como objetivo analisar o tema da criminalidade urbana no estado de Minas Gerais - MG, tendo em vista a atual escalada de violência em todo o país. Os resultados dessa pesquisa sobre os indicadores de criminalidade nos revelam que as variáveis relacionadas ao nível de distribuição de renda, escolaridade, emprego e investimento em segurança pública são fatores importantes para diagnosticar o fenômeno da criminalidade no estado.

A pesquisa se mostrou relevante para entender de que forma o grau de violência afeta o cotidiano dos indivíduos, ocasionando em uma sensação de fragilidade e insegurança. Nesse momento, surge a importância do papel da segurança pública visando o controle social para melhoria do bem-estar dos indivíduos. É necessário diagnosticar o que causa esses problemas de disparidade na distribuição de renda e emprego de forma a neutralizá-los.
