

## ANÁLISE EXPLORATÓRIA DE DADOS - 
## REGISTRO EPIDEMIOLÓGICO DE DENGUE EM ALAGOINHAS 2015-2025



## 1 IMPORTANDO A BASE DE DADOS E PACOTES

library(readr)
library(ggplot2)
library(e1071)


dengue_alagoinhas_2015_2025 <- read_csv("~/BASE DE DADOS/dengue_alagoinhas_2015_2025.csv")
View(dengue_alagoinhas_2015_2025) #visualizando dataset



# - - - - - - - - - - - - - - - - 1.1 INSPECIONANDO TIPOS DE DADOS

str(dengue_alagoinhas_2015_2025) #visualizando tipos de dados

dengue_alagoinhas_2015_2025 <- read_csv("~/BASE DE DADOS/dengue_alagoinhas_2015_2025.csv")
View(dengue_alagoinhas_2015_2025) #visualizando dataset


## 2 TRATAMENTO DE DADOS


# - - - - - - - - - - - - - - - - 2.1 convertendo tipos de dados


# 2.1.1 temperatura -> inteiro

dengue_alagoinhas_2015_2025$tempmed_int <- as.integer(
  dengue_alagoinhas_2015_2025$tempmed
)

dengue_alagoinhas_2015_2025$tempmax_int <- as.integer(
  dengue_alagoinhas_2015_2025$tempmax
)

dengue_alagoinhas_2015_2025$tempmin_int <- as.integer(
  dengue_alagoinhas_2015_2025$tempmin
)


# 2.1.2 úmidade -> inteiro

dengue_alagoinhas_2015_2025$umidmed_int <- as.integer(
  dengue_alagoinhas_2015_2025$umidmed
)
dengue_alagoinhas_2015_2025$umidmax_int <- as.integer(
  dengue_alagoinhas_2015_2025$umidmax
)
dengue_alagoinhas_2015_2025$umidmin_int <- as.integer(
  dengue_alagoinhas_2015_2025$umidmin
)



## 3 ANÁLISE EXPLORATÓRIA DOS DADOS


# - - - - - - - - - - - - - - - - 3.1 verificando a distribuição dos dados

skewness(dengue_alagoinhas_2015_2025$casos, na.rm = TRUE)

# Resultado = [1] 2.947004, curva assimétrica à esquerda


# - - - - - - - - - - - - - - - - 3.2 histograma dos dados

ggplot(dengue_alagoinhas_2015_2025, aes(
  x = casos
)) +
  geom_histogram(binwidth = 10)

ggplot(dengue_alagoinhas_2015_2025, aes(x = casos)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
  labs(title = "Distribuição de casos de dengue", 
       x = "Número de casos", 
       y = "Frequência") +
  theme_light()




# gráfico temporal - temperatura vs casos

ggplot(dengue_alagoinhas_2015_2025, aes(x = data_iniSE)) +
  geom_line(aes(y = tempmax_int, color = "Máxima")) +
  geom_line(aes(y = tempmin_int, color = "Mínima")) +
  geom_line(aes(y = tempmed_int, color = "Média")) +
  geom_line(aes(y = casos, color = "CASOS"))
  labs(
    x = "Data",
    y = "Temperatura (°C)",
    color = "Tipo de temperatura",
    title = "Temperatura em Alagoinhas (2015–2025)"
  )



## medidas de casos

  
media_casos <- mean(dengue_alagoinhas_2015_2025$casos)
mediana_casos <- median(dengue_alagoinhas_2015_2025$casos)
min_casos <- min(dengue_alagoinhas_2015_2025$casos)
max_casos <- max(dengue_alagoinhas_2015_2025$casos)
sd_casos <- sd(dengue_alagoinhas_2015_2025$casos)


medidas_casos <- data.frame(
  mediana_casos, mediana_casos, min_casos, max_casos, sd_casos
)

head(dados)
View(dados)

#GRÁFICOS COM GGPLOT2

#1 gráfico de calor - concentração de casos
## suacização da curva com loess

ggplot(dengue_alagoinhas_2015_2025, aes(
  x = data_iniSE,
  y = casos
)) +
  ggtitle("Gráfico da concentração de casos estimados de dengue em Alagoinhas/BA",
  subtitle = "Linha de tendência ascendente 2015-2025") +
  xlab("DATA (ÍNICIO DA SEMANA EPIDEMIOLÓGICA") +
  ylab("CASOS ESTIMADOS") +
  geom_bin_2d() +
  geom_smooth(method = "loess",
              size = 0.5) +
  theme_light()


#gráfico de dispersão de casos estimados

ggplot(dengue_alagoinhas_2015_2025, aes(
  x = data_iniSE,
  y = casos_est
)) +
  labs(
    title = ("DISPERSÃO DE CASOS ESTIMADOS DE DENGUE EM ALAGOINHAS"),
    subtitle = "2015/2025",
    xlab = "CASOS ESTIMADOS",
    ylab = "DATA (SEMANA EPIDEMIOLÓGICA)",
  ) +
  geom_jitter() +
  geom_smooth(method = "loess") +
  theme_light()



library(ggplot2)

ggplot(dengue_alagoinhas_2015_2025, aes(x = casos)) +
  geom_histogram(aes(y = ..density..), binwidth = 10, fill = "skyblue", color = "black") +
  geom_density(color = "red", size = 1.2) +
  geom_vline(aes(xintercept = mean(casos, na.rm = TRUE)), 
             color = "blue", 
             linetype = "dashed", 
             size = 1) +
  geom_vline(aes(xintercept = median(casos, na.rm = TRUE)), 
             color = "green", 
             linetype = "dotted", size = 1) +
  labs(title = "Distribuição de casos de dengue (assimétrica à direita)",
       x = "Número de casos",
       y = "Densidade") +
  annotate("text", x = mean(dengue_alagoinhas_2015_2025$casos, na.rm = TRUE)+5, 
           y = 0.02, label = "Média", color = "blue") +
  annotate("text", x = median(dengue_alagoinhas_2015_2025$casos, na.rm = TRUE)-5, 
           y = 0.02, label = "Mediana", color = "green")

 
# boxplot dos casos

ggplot(dengue_alagoinhas_2015_2025, aes(
  y = casos
)) +
  geom_boxplot()

# base de dados contém outliers que afetam visualmente o boxplot

mean(dengue_alagoinhas_2015_2025$casos)
median(dengue_alagoinhas_2015_2025$casos)
min(dengue_alagoinhas_2015_2025$casos)
max(dengue_alagoinhas_2015_2025$casos)


# linha temporal dos casos

ggplot(dengue_alagoinhas_2015_2025, aes(
  x = data_iniSE,y = casos
)) +
  geom_line()+
  geom_smooth(method = "lm")



##

ggplot(dengue_alagoinhas_2015_2025, aes(x = data_iniSE)) +
  geom_line(aes(y = casos_est)) +
  geom_line(aes(y = casos_est_max), linetype = "dashed") +
  geom_line(aes(y = casos_est_min), linetype = "dotted") +
  labs(
    title = "Casos estimados de dengue",
    subtitle = "Estimativa, mínimo e máximo (2015–2025)",
    x = "DATA (INÍCIO DA SEMANA EPIDEMIOLÓGICA)",
    y = "CASOS ESTIMADOS"
  ) 

##

ggplot(dengue_alagoinhas_2015_2025, aes(
  x = data_iniSE,
  y = nivel,
)) +
  geom_jitter() +
  geom_smooth(method = "loess")



# correlações entre variáveis observadas


# - - - - - - - - - - - - - - - -  1.1 CORRELAÇÃO ENTRE CASOS E NÍVEL

cor(dengue_alagoinhas_2015_2025$casos,
    dengue_alagoinhas_2015_2025$nivel,
    use = "complete.obs")
## [1] 0.778478 (correlação forte positiva)

## vizualização 

ggplot(dengue_alagoinhas_2015_2025, aes(
  x = casos,
  y = nivel
)) +
  geom_smooth(method = "lm", se = TRUE) +
  geom_jitter(alpha = 0.5) +
  labs(title = "Correlação entre Casos X Nível",
       subtitle = "Correlação de Pearson 0.77",
       caption = "Correlação positiva forte entre casos e nível R=0.77")

# - - - - - - - - - - - - - - - - -  1.2 CORRELAÇÃO ENTRE CASOS E RECEPTIVO

cor(dengue_alagoinhas_2015_2025$casos,
    dengue_alagoinhas_2015_2025$receptivo)
## [1] 0.2337897 (correlação fraca positiva)

## vizualiação

ggplot(dengue_alagoinhas_2015_2025, aes(
  x = casos,
  y = receptivo
)) +
  geom_smooth(method = "loess", se = TRUE) +
  geom_jitter()

# - - - - - - - - - - - - - - - - - 1.3 CORRELAÇÃO ENTRE CASOS E TRANSMISSÃO

cor(dengue_alagoinhas_2015_2025$casos,
    dengue_alagoinhas_2015_2025$transmissao)
##[1] 0.4007114

# 1.4 CORRELAÇÃO ENTRE TEMEPERATURA MÉXIMA E CASOS

cor(dengue_alagoinhas_2015_2025$tempmax,
    dengue_alagoinhas_2015_2025$casos,
    use = "complete.obs")
#


# CORRELAÇÃO ENTRE 


cor(dengue_alagoinhas_2015_2025$nivel,
    dengue_alagoinhas_2015_2025$umidmax,
    use = "complete.obs")

# coeficiente de correlação de pearson [1] 0.3307489
# correlação

ggplot(dengue_alagoinhas_2015_2025, aes(
  x = nivel,
  y = umidmax,
)) +
  geom_smooth() +
  geom_jitter() +
  labs(
    title = "Correlação entre nível e umidade máxima",
    subtitle = "Correlação ponto bisserial 0.3307",
    caption = "Correlação fraca positiva, demonstrando haver pouca ou
    nenhuma associação entre nível critico epidemiológico e nível"
  )




### correlação entre rt e casos 

cor(dengue_alagoinhas_2015_2025$Rt,
    dengue_alagoinhas_2015_2025$casos,
    method = "spearman")
cor(dengue_alagoinhas_2015_2025$Rt,
    dengue_alagoinhas_2015_2025$casos,
    method = "pearson")
cor(dengue_alagoinhas_2015_2025$Rt,
    dengue_alagoinhas_2015_2025$casos,
    method = "kendall")

# [1] 0.6361502 SPEARMAN
# [1] -0.01393375 PEARSON
# [1] 0.4623474 KENDALL

ggplot(dengue_alagoinhas_2015_2025, aes(
  x = Rt,
  y = casos
)) + geom_jitter() +
  geom_smooth(method = "loess")

ggplot(dengue_alagoinhas_2015_2025, aes(
  x = Rt,
  y = casos
)) + geom_jitter() +
  geom_smooth(method = "lm")


correlacao_df <- data.frame(
  metodo = c("Spearman", "Pearson", "Kendall"),
  r = c(0.6361502, -0.01393375, 0.4623474)
)


  
  
  
    

  
  
    
  
