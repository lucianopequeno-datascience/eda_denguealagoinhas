Análise exploratória dos casos de dengue em Alagoinhas durante as semanas epidemiológicas (2015–2025) utilizando R
-


INTRODUÇÃO


A dengue é uma arbovirose de grande relevância para saúde pública no Brasil, com ocorrência endêmica e surtos epidêmicos recorrentes ao longo dos anos. De acordo com o Ministério da Saúde, a dengue é uma doença febril aguda, sistêmica, dinâmica, debilitante e autolimitada. A maioria dos doentes se recupera, porém, parte deles podem progredir para formas graves, inclusive virem a óbito. A quase totalidade dos óbitos por dengue é evitável e depende, na maioria das vezes, da qualidade da assistência prestada e organização da rede de serviços de saúde. No município de Alagoinhas/BA, a doença representa um importante desafio para o sistema de saúde, impactando diretamente a morbidade da população e a organização dos serviços assistenciais. Ao analisarmos o número de casos na curva de crescimento ascendente do primeiro mês de 2026, surgiu a necessidade de verificarmos o padrão histórico da arbovirose nos últimos 10 anos. Nesse contexto, a análise exploratória de dados referentes aos casos de dengue ao longo das semanas epidemiológicas entre 2015 e 2025 permite identificar padrões temporais, tendências, sazonalidades e possíveis períodos de maior risco, contribuindo para o planejamento de ações de vigilância, prevenção e controle da doença no município


METODOLOGIA E OBJETIVO



Trata-se de um estudo descritivo, de abordagem quantitativa, fundamentado em dados de casos notificados de dengue no município de Alagoinhas(BA), referentes ao período de 2015 a 2025. As informações foram obtidas a partir da plataforma InfoDengue², sendo posteriormente organizadas, tratadas e analisadas por meio da linguagem de programação R. Foram elaborados gráficos e aplicadas estatísticas descritivas com o objetivo de identificar padrões temporais, tendências e possíveis sazonalidades ao longo das semanas epidemiológicas, fundamentos essenciais no processo de análise exploratória de dados. Os procedimentos analíticos foram documentados integralmente por meio da disponibilização do código-fonte em R, organizado de forma sequencial, contemplando as etapas de importação, limpeza, análise exploratória e visualização dos dados, assegurando a reprodutibilidade do estudo


ABORDAGEM

• Análise univariada: histogramas, boxplots e gráficos de violino combinados para examinar distribuições, assimetria (skewness) e curtose de casos, temperaturas, umidade e Rt

• Análise bivariada: correlações de Pearson e Spearman (esta mais adequada para dados assimétricos), com matrizes de correlação visualizadas via ggcorrplot

• Testes de significância estatística: Avaliação de pares de variáveis com p-valor < 0,05

• Visualizações avançadas: gráficos de dispersão com curvas de suavização (LOESS), boxplots estratificados por faixas, jitter para revelar densidade real dos dados

• Séries temporais: linhas temporais, análise de sazonalidade mensal e anual, decomposição STL (Seasonal and Trend decomposition using Loess) para separar tendência, sazonalidade e resíduos

• Modelagem estatística: regressão linear simples para quantificar relações entre casos e variáveis climáticas (umidade máxima e temperatura máxima)

• Tratamento de dados: arredondamento de variáveis climáticas, identificação e substituição de outliers inconsistentes (como um valor de 173,2% de umidade), criação de faixas categóricas para análises estratificadas
