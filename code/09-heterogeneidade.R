
options(scipen = 999)

# importação da base de dados ---------------------------------------------

base_completa_filtrada <- readr::read_rds(
  here::here("dados", "dados_tratados", "rds", "base_completa_filtrada.rds")
)

base_hetero <- base_completa_filtrada |>
  dplyr::select(
    c(
      nu_ano_censo,
      co_cine_rotulo,
      co_uf,
      in_capital,
      sisu2,
      tp_categoria_administrativa,
      no_regiao,
      co_regiao,
      co_curso,
      perc_ing_feminino,
      perc_ing_0_29,
      perc_ing_nao_branca,
      perc_ing_deficiencia,
      perc_ing_escola_publica,
      perc_ing_apoio_social,
      perc_ing_25_29,
      perc_ing_18_24,
      perc_ing_0_17
    )
  ) |>
  dplyr::mutate(
    capital = in_capital,
    interior = 1 - in_capital,
    capital = ifelse(capital == 1, 1, 0),
    interior = ifelse(interior == 1, 2, 0),
    tp_categoria_administrativa = as.numeric(tp_categoria_administrativa),
    federal = tp_categoria_administrativa,
    estadual = 1 - tp_categoria_administrativa,
    federal = ifelse(federal == 1, 1, 0),
    estadual = ifelse(estadual == -1, 2, 0),
    co_regiao = as.numeric(co_regiao),
    norte = ifelse(co_regiao == 1, 1, 0),
    nordeste = ifelse(co_regiao == 2, 2, 0),
    sudeste = ifelse(co_regiao == 3, 3, 0),
    sul = ifelse(co_regiao == 4, 4, 0),
    centrooeste = ifelse(co_regiao == 5, 5, 0)
)


# heterogeneidade: CAPITAL e INTERIOR -------------------------------------

hetero_cap_fem <- plm::plm(
  perc_ing_feminino ~ sisu2 + capital,
  data = base_hetero[base_hetero$capital == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_cap_fem)

hetero_int_fem <- plm::plm(
  perc_ing_feminino ~ sisu2 + interior,
  data = base_hetero[base_hetero$interior == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_int_fem)

hetero_cap_idade_0_17 <- plm::plm(
  perc_ing_0_17 ~ sisu2 + capital,
  data = base_hetero[base_hetero$capital == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_cap_idade_0_17)

hetero_int_idade_0_17 <- plm::plm(
  perc_ing_0_17 ~ sisu2 + interior,
  data = base_hetero[base_hetero$interior == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_int_idade_0_17)

hetero_cap_idade_18_24 <- plm::plm(
  perc_ing_18_24 ~ sisu2 + capital,
  data = base_hetero[base_hetero$capital == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_cap_idade_18_24)

hetero_int_idade_18_24 <- plm::plm(
  perc_ing_18_24 ~ sisu2 + capital,
  data = base_hetero[base_hetero$interior == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_int_idade_18_24)

hetero_cap_idade_25_29 <- plm::plm(
  perc_ing_25_29 ~ sisu2 + capital,
  data = base_hetero[base_hetero$capital == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_cap_idade_25_29)

hetero_int_idade_25_29 <- plm::plm(
  perc_ing_25_29 ~ sisu2 + capital,
  data = base_hetero[base_hetero$interior == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_int_idade_25_29)

hetero_cap_naobranco <- plm::plm(
  perc_ing_nao_branca ~ sisu2 + capital,
  data = base_hetero[base_hetero$capital == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_cap_naobranco)

hetero_int_naobranco <- plm::plm(
  perc_ing_nao_branca ~ sisu2 + interior,
  data = base_hetero[base_hetero$interior == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_int_naobranco)

hetero_cap_deficiencia <- plm::plm(
  perc_ing_deficiencia ~ sisu2 + capital,
  data = base_hetero[base_hetero$capital == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_cap_deficiencia)

hetero_int_deficiencia <- plm::plm(
  perc_ing_deficiencia ~ sisu2 + interior,
  data = base_hetero[base_hetero$interior == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_int_deficiencia)

hetero_cap_escolapublica <- plm::plm(
  perc_ing_escola_publica ~ sisu2 + capital,
  data = base_hetero[base_hetero$capital == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_cap_escolapublica)

hetero_int_escolapublica <- plm::plm(
  perc_ing_escola_publica ~ sisu2 + interior,
  data = base_hetero[base_hetero$interior == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_int_escolapublica)

hetero_cap_apoiosocial <- plm::plm(
  perc_ing_apoio_social ~ sisu2 + capital,
  data = base_hetero[base_hetero$capital == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_cap_apoiosocial)

hetero_int_apoiosocial <- plm::plm(
  perc_ing_apoio_social ~ sisu2 + interior,
  data = base_hetero[base_hetero$interior == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_int_apoiosocial)

# heterogeneidade: FEDERAL ou ESTADUAL ------------------------------------

hetero_fed_fem <- plm::plm(
  perc_ing_feminino ~ sisu2 + federal,
  data = base_hetero[base_hetero$federal == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_fed_fem)

hetero_est_fem <- plm::plm(
  perc_ing_feminino ~ sisu2 + estadual,
  data = base_hetero[base_hetero$estadual == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_est_fem)

hetero_fed_idade_0_17 <- plm::plm(
  perc_ing_0_17 ~ sisu2 + federal,
  data = base_hetero[base_hetero$federal == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_fed_idade_0_17)

hetero_est_idade_0_17 <- plm::plm(
  perc_ing_0_17 ~ sisu2 + estadual,
  data = base_hetero[base_hetero$estadual == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_est_idade_0_17)

hetero_fed_idade_18_24 <- plm::plm(
  perc_ing_18_24 ~ sisu2 + federal,
  data = base_hetero[base_hetero$federal == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_fed_idade_18_24)

hetero_est_idade_18_24 <- plm::plm(
  perc_ing_18_24 ~ sisu2 + estadual,
  data = base_hetero[base_hetero$estadual == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_est_idade_18_24)

hetero_fed_idade_25_29 <- plm::plm(
  perc_ing_25_29 ~ sisu2 + federal,
  data = base_hetero[base_hetero$federal == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_fed_idade_25_29)

hetero_est_idade_25_29 <- plm::plm(
  perc_ing_25_29 ~ sisu2 + estadual,
  data = base_hetero[base_hetero$estadual == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_est_idade_25_29)

hetero_fed_naobranco <- plm::plm(
  perc_ing_nao_branca ~ sisu2 + federal,
  data = base_hetero[base_hetero$federal == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_fed_naobranco)

hetero_est_naobranco <- plm::plm(
  perc_ing_nao_branca ~ sisu2 + estadual,
  data = base_hetero[base_hetero$estadual == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_est_naobranco)

hetero_fed_deficiencia <- plm::plm(
  perc_ing_deficiencia ~ sisu2 + federal,
  data = base_hetero[base_hetero$federal == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_fed_deficiencia)

hetero_est_deficiencia <- plm::plm(
  perc_ing_deficiencia ~ sisu2 + estadual,
  data = base_hetero[base_hetero$estadual == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_est_deficiencia)

hetero_fed_escolapublica <- plm::plm(
  perc_ing_escola_publica ~ sisu2 + federal,
  data = base_hetero[base_hetero$federal == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_fed_escolapublica)

hetero_est_escolapublica <- plm::plm(
  perc_ing_escola_publica ~ sisu2 + estadual,
  data = base_hetero[base_hetero$estadual == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_est_escolapublica)

hetero_fed_apoiosocial <- plm::plm(
  perc_ing_apoio_social ~ sisu2 + federal,
  data = base_hetero[base_hetero$federal == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_fed_apoiosocial)

hetero_est_apoiosocial <- plm::plm(
  perc_ing_apoio_social ~ sisu2 + estadual,
  data = base_hetero[base_hetero$estadual == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_est_apoiosocial)

# heterogeneidade: REGIÕES BRASILEIRAS ------------------------------------

hetero_norte_fem <- plm::plm(
  perc_ing_feminino ~ sisu2 + norte,
  data = base_hetero[base_hetero$norte == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_norte_fem)

hetero_nordeste_fem <- plm::plm(
  perc_ing_feminino ~ sisu2 + nordeste,
  data = base_hetero[base_hetero$nordeste == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_nordeste_fem)

hetero_sudeste_fem <- plm::plm(
  perc_ing_feminino ~ sisu2 + sudeste,
  data = base_hetero[base_hetero$sudeste == 3,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sudeste_fem)

hetero_sul_fem <- plm::plm(
  perc_ing_feminino ~ sisu2 + sul,
  data = base_hetero[base_hetero$sul == 4,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sul_fem)

hetero_centrooeste_fem <- plm::plm(
  perc_ing_feminino ~ sisu2 + centrooeste,
  data = base_hetero[base_hetero$centrooeste == 5,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_centrooeste_fem)

hetero_norte_idade_0_17 <- plm::plm(
  perc_ing_0_17 ~ sisu2 + norte,
  data = base_hetero[base_hetero$norte == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_norte_idade_0_17)

hetero_nordeste_idade_0_17 <- plm::plm(
  perc_ing_0_17 ~ sisu2 + nordeste,
  data = base_hetero[base_hetero$nordeste == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_nordeste_idade_0_17)

hetero_sudeste_idade_0_17 <- plm::plm(
  perc_ing_0_17 ~ sisu2 + sudeste,
  data = base_hetero[base_hetero$sudeste == 3,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sudeste_idade_0_17)

hetero_sul_idade_0_17 <- plm::plm(
  perc_ing_0_17 ~ sisu2 + sul,
  data = base_hetero[base_hetero$sul == 4,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sul_idade_0_17)

hetero_centrooeste_idade_0_17 <- plm::plm(
  perc_ing_0_17 ~ sisu2 + centrooeste,
  data = base_hetero[base_hetero$centrooeste == 5,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_centrooeste_idade_0_17)

hetero_norte_idade_18_24 <- plm::plm(
  perc_ing_18_24 ~ sisu2 + norte,
  data = base_hetero[base_hetero$norte == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_norte_idade_18_24)

hetero_nordeste_idade_18_24 <- plm::plm(
  perc_ing_18_24 ~ sisu2 + nordeste,
  data = base_hetero[base_hetero$nordeste == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_nordeste_idade_18_24)

hetero_sudeste_idade_18_24 <- plm::plm(
  perc_ing_18_24 ~ sisu2 + sudeste,
  data = base_hetero[base_hetero$sudeste == 3,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sudeste_idade_18_24)
hetero_sul_idade_18_24 <- plm::plm(
  perc_ing_18_24 ~ sisu2 + sul,
  data = base_hetero[base_hetero$sul == 4,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sul_idade_18_24)

hetero_centrooeste_idade_18_24 <- plm::plm(
  perc_ing_18_24 ~ sisu2 + centrooeste,
  data = base_hetero[base_hetero$centrooeste == 5,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_centrooeste_idade_18_24)

hetero_norte_idade_25_29 <- plm::plm(
  perc_ing_25_29 ~ sisu2 + norte,
  data = base_hetero[base_hetero$norte == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_norte_idade_25_29)

hetero_nordeste_idade_25_29 <- plm::plm(
  perc_ing_25_29 ~ sisu2 + nordeste,
  data = base_hetero[base_hetero$nordeste == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_nordeste_idade_25_29)

hetero_sudeste_idade_25_29 <- plm::plm(
  perc_ing_25_29 ~ sisu2 + sudeste,
  data = base_hetero[base_hetero$sudeste == 3,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sudeste_idade_25_29)

hetero_sul_idade_25_29 <- plm::plm(
  perc_ing_25_29 ~ sisu2 + sul,
  data = base_hetero[base_hetero$sul == 4,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sul_idade_25_29)

hetero_centrooeste_idade_25_29 <- plm::plm(
  perc_ing_25_29 ~ sisu2 + centrooeste,
  data = base_hetero[base_hetero$centrooeste == 5,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_centrooeste_idade_25_29)

hetero_norte_naobranco <- plm::plm(
  perc_ing_nao_branca ~ sisu2 + norte,
  data = base_hetero[base_hetero$norte == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_norte_naobranco)

hetero_nordeste_naobranco <- plm::plm(
  perc_ing_nao_branca ~ sisu2 + nordeste,
  data = base_hetero[base_hetero$nordeste == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_nordeste_naobranco)

hetero_sudeste_naobranco <- plm::plm(
  perc_ing_nao_branca ~ sisu2 + sudeste,
  data = base_hetero[base_hetero$sudeste == 3,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sudeste_naobranco)

hetero_sul_naobranco <- plm::plm(
  perc_ing_nao_branca ~ sisu2 + sul,
  data = base_hetero[base_hetero$sul == 4,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sul_naobranco)

hetero_centrooeste_naobranco <- plm::plm(
  perc_ing_nao_branca ~ sisu2 + centrooeste,
  data = base_hetero[base_hetero$centrooeste == 5,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_centrooeste_naobranco)

hetero_norte_deficiencia <- plm::plm(
  perc_ing_deficiencia ~ sisu2 + norte,
  data = base_hetero[base_hetero$norte == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_norte_deficiencia)

hetero_nordeste_deficiencia <- plm::plm(
  perc_ing_deficiencia ~ sisu2 + nordeste,
  data = base_hetero[base_hetero$nordeste == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_nordeste_deficiencia)

hetero_sudeste_deficiencia <- plm::plm(
  perc_ing_deficiencia ~ sisu2 + sudeste,
  data = base_hetero[base_hetero$sudeste == 3,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sudeste_deficiencia)

hetero_sul_deficiencia <- plm::plm(
  perc_ing_deficiencia ~ sisu2 + sul,
  data = base_hetero[base_hetero$sul == 4,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sul_deficiencia)

hetero_centrooeste_deficiencia <- plm::plm(
  perc_ing_deficiencia ~ sisu2 + centrooeste,
  data = base_hetero[base_hetero$centrooeste == 5,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_centrooeste_deficiencia)

hetero_norte_escolapublica <- plm::plm(
  perc_ing_escola_publica ~ sisu2 + norte,
  data = base_hetero[base_hetero$norte == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_norte_escolapublica)

hetero_nordeste_escolapublica <- plm::plm(
  perc_ing_escola_publica ~ sisu2 + nordeste,
  data = base_hetero[base_hetero$nordeste == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_nordeste_escolapublica)

hetero_sudeste_escolapublica <- plm::plm(
  perc_ing_escola_publica ~ sisu2 + sudeste,
  data = base_hetero[base_hetero$sudeste == 3,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sudeste_escolapublica)

hetero_sul_escolapublica <- plm::plm(
  perc_ing_escola_publica ~ sisu2 + sul,
  data = base_hetero[base_hetero$sul == 4,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sul_escolapublica)

hetero_centrooeste_escolapublica <- plm::plm(
  perc_ing_escola_publica ~ sisu2 + centrooeste,
  data = base_hetero[base_hetero$centrooeste == 5,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_centrooeste_escolapublica)

hetero_norte_apoiosocial <- plm::plm(
  perc_ing_apoio_social ~ sisu2 + norte,
  data = base_hetero[base_hetero$norte == 1,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_norte_apoiosocial)

hetero_nordeste_apoiosocial <- plm::plm(
  perc_ing_apoio_social ~ sisu2 + nordeste,
  data = base_hetero[base_hetero$nordeste == 2,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_nordeste_apoiosocial)

hetero_sudeste_apoiosocial <- plm::plm(
  perc_ing_apoio_social ~ sisu2 + sudeste,
  data = base_hetero[base_hetero$sudeste == 3,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sudeste_apoiosocial)

hetero_sul_apoiosocial <- plm::plm(
  perc_ing_apoio_social ~ sisu2 + sul,
  data = base_hetero[base_hetero$sul == 4,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_sul_apoiosocial)

hetero_centrooeste_apoiosocial <- plm::plm(
  perc_ing_apoio_social ~ sisu2 + centrooeste,
  data = base_hetero[base_hetero$centrooeste == 5,],
  index = c("co_curso","nu_ano_censo", "co_uf"),
  model = "within"
)

summary(hetero_centrooeste_apoiosocial)
