
# pacotes -----------------------------------------------------------------
# instalar os pacotes abaixo caso não tenha instalado

# install.packages("here")
# install.packages("tidyverse")
# install.packages("plm")


# evita a notação científica ao exibir números pequenos
# apresentando em formato decimal completo

options(scipen = 999)

# importação da base ------------------------------------------------------

base_completa_filtrada <- readr::read_rds(
  here::here("dados", "dados_tratados", "rds", "base_completa_filtrada.rds")
)

# efeito fixo de ANO, CURSO e ESTADO --------------------------------------

mod_fem_anocursouf <- plm::plm(
  perc_ing_feminino ~ sisu2,
  data = base_completa_filtrada,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_fem_anocursouf)


mod_idade_0_17 <- plm::plm(
  perc_ing_0_17 ~ sisu2,
  data = base_completa_filtrada,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_idade_0_17)


mod_idade_18_24 <- plm::plm(
  perc_ing_18_24 ~ sisu2,
  data = base_completa_filtrada,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_idade_18_24)


mod_idade_25_29 <- plm::plm(
  perc_ing_25_29 ~ sisu2,
  data = base_completa_filtrada,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_idade_25_29)


mod_nao_brancos_anocursouf <- plm::plm(
  perc_ing_nao_branca ~ sisu2,
  data = base_completa_filtrada,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_nao_brancos_anocursouf)


mod_deficiencia_anocursouf <- plm::plm(
  perc_ing_deficiencia ~ sisu2,
  data = base_completa_filtrada,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_deficiencia_anocursouf)


mod_escolapublica_anocursouf <- plm::plm(
  perc_ing_escola_publica ~ sisu2,
  data = base_completa_filtrada,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_escolapublica_anocursouf)


mod_apoiosocial_anocursouf <- plm::plm(
  perc_ing_apoio_social ~ sisu2,
  data = base_completa_filtrada,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_apoiosocial_anocursouf)


