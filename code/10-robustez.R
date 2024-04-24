
options(scipen = 999)

# importação da base de dados ---------------------------------------------

base <- readr::read_rds(
  here::here("dados", "dados_tratados", "rds", "base_completa_filtrada.rds")
)

base_ufano <- base |>
  dplyr::mutate(
    uf_ano = paste0(co_uf, nu_ano_censo)
  )

base_controle <- base |>
  dplyr::group_by(nu_ano_censo, co_ies, co_curso) |>
  dplyr::mutate(
    perc_doc_ex_femi = qt_doc_ex_femi / qt_doc_exe,
    perc_doc_ex_mest = qt_doc_ex_mest / qt_doc_exe,
    perc_doc_ex_dout = qt_doc_ex_dout / qt_doc_exe,
    perc_doc_ex_int_de = qt_doc_ex_int_de / qt_doc_exe
  ) |>
  dplyr::ungroup()


# com efeitos fixos de ANO, CURSO e ÁREA DETALHADA ------------------------

mod_rob_fem_2 <- plm::plm(
  perc_ing_feminino ~ sisu2,
  data = base,
  index = c("co_curso", "nu_ano_censo", "co_cine_area_detalhada"),
  model = "within"
)

summary(mod_rob_fem_2)

mod_rob_idade_0_17_2 <- plm::plm(
  perc_ing_0_17 ~ sisu2,
  data = base,
  index = c("co_curso", "nu_ano_censo", "co_cine_area_detalhada"),
  model = "within"
)

summary(mod_rob_idade_0_17_2)

mod_rob_idade_18_24_2 <- plm::plm(
  perc_ing_18_24 ~ sisu2,
  data = base,
  index = c("co_curso", "nu_ano_censo", "co_cine_area_detalhada"),
  model = "within"
)

summary(mod_rob_idade_18_24_2)

mod_rob_idade_25_29_2 <- plm::plm(
  perc_ing_25_29 ~ sisu2,
  data = base,
  index = c("co_curso", "nu_ano_censo", "co_cine_area_detalhada"),
  model = "within"
)

summary(mod_rob_idade_25_29_2)

mod_rob_naobrancos_2 <- plm::plm(
  perc_ing_nao_branca ~ sisu2,
  data = base,
  index = c("co_curso", "nu_ano_censo", "co_cine_area_detalhada"),
  model = "within"
)

summary(mod_rob_naobrancos_2)

mod_rob_deficiencia_2 <- plm::plm(
  perc_ing_deficiencia ~ sisu2,
  data = base,
  index = c("co_curso", "nu_ano_censo", "co_cine_area_detalhada"),
  model = "within"
)

summary(mod_rob_deficiencia_2)

mod_rob_escolapublica_2 <- plm::plm(
  perc_ing_escola_publica ~ sisu2,
  data = base,
  index = c("co_curso", "nu_ano_censo", "co_cine_area_detalhada"),
  model = "within"
)

summary(mod_rob_escolapublica_2)

mod_rob_apoiosocial_2 <- plm::plm(
  perc_ing_apoio_social ~ sisu2,
  data = base,
  index = c("co_curso", "nu_ano_censo", "co_cine_area_detalhada"),
  model = "within"
)

summary(mod_rob_apoiosocial_2)


# com efeitos fixos de ANO, CURSO e UF X ANO ------------------------------

mod_rob_fem_3 <- plm::plm(
  perc_ing_feminino ~ sisu2,
  data = base_ufano,
  index = c("co_curso", "nu_ano_censo", "uf_ano"),
  model = "within"
)

summary(mod_rob_fem_3)

mod_rob_idade_0_17_3 <- plm::plm(
  perc_ing_0_17 ~ sisu2,
  data = base_ufano,
  index = c("co_curso", "nu_ano_censo", "uf_ano"),
  model = "within"
)

summary(mod_rob_idade_0_17_3)

mod_rob_idade_18_24_3 <- plm::plm(
  perc_ing_18_24 ~ sisu2,
  data = base_ufano,
  index = c("co_curso", "nu_ano_censo", "uf_ano"),
  model = "within"
)

summary(mod_rob_idade_18_24_3)

mod_rob_idade_25_29_3 <- plm::plm(
  perc_ing_25_29 ~ sisu2,
  data = base_ufano,
  index = c("co_curso", "nu_ano_censo", "uf_ano"),
  model = "within"
)

summary(mod_rob_idade_25_29_3)

mod_rob_naobrancos_3 <- plm::plm(
  perc_ing_nao_branca ~ sisu2,
  data = base_ufano,
  index = c("co_curso", "nu_ano_censo", "uf_ano"),
  model = "within"
)

summary(mod_rob_naobrancos_3)

mod_rob_deficiencia_3 <- plm::plm(
  perc_ing_deficiencia ~ sisu2,
  data = base_ufano,
  index = c("co_curso", "nu_ano_censo", "uf_ano"),
  model = "within"
)

summary(mod_rob_deficiencia_3)

mod_rob_escolapublica_3 <- plm::plm(
  perc_ing_escola_publica ~ sisu2,
  data = base_ufano,
  index = c("co_curso", "nu_ano_censo", "uf_ano"),
  model = "within"
)

summary(mod_rob_escolapublica_3)

mod_rob_apoiosocial_3 <- plm::plm(
  perc_ing_apoio_social ~ sisu2,
  data = base_ufano,
  index = c("co_curso", "nu_ano_censo", "uf_ano"),
  model = "within"
)

summary(mod_rob_apoiosocial_3)


# com efeitos fixos de ANO, CURSO e UF + CONTROLES ------------------------

mod_rob_fem_4 <- plm::plm(
  perc_ing_feminino ~ sisu2 + perc_doc_ex_femi + perc_doc_ex_dout + perc_doc_ex_int_de,
  data = base_controle,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_rob_fem_4)

mod_rob_idade_0_17_4 <- plm::plm(
  perc_ing_0_17 ~ sisu2 + perc_doc_ex_femi + perc_doc_ex_dout + perc_doc_ex_int_de,
  data = base_controle,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_rob_idade_0_17_4)

mod_rob_idade_18_24_4 <- plm::plm(
  perc_ing_18_24 ~ sisu2 + perc_doc_ex_femi + perc_doc_ex_dout + perc_doc_ex_int_de,
  data = base_controle,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_rob_idade_18_24_4)

mod_rob_idade_25_29_4 <- plm::plm(
  perc_ing_25_29 ~ sisu2 + perc_doc_ex_femi + perc_doc_ex_dout + perc_doc_ex_int_de,
  data = base_controle,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_rob_idade_25_29_4)

mod_rob_naobrancos_4 <- plm::plm(
  perc_ing_nao_branca ~ sisu2 + perc_doc_ex_femi + perc_doc_ex_dout + perc_doc_ex_int_de,
  data = base_controle,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_rob_naobrancos_4)

mod_rob_deficiencia_4 <- plm::plm(
  perc_ing_deficiencia ~ sisu2 + perc_doc_ex_femi + perc_doc_ex_dout + perc_doc_ex_int_de,
  data = base_controle,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_rob_deficiencia_4)

mod_rob_escolapublica_4 <- plm::plm(
  perc_ing_escola_publica ~ sisu2 + perc_doc_ex_femi + perc_doc_ex_dout + perc_doc_ex_int_de,
  data = base_controle,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_rob_escolapublica_4)

mod_rob_apoiosocial_4 <- plm::plm(
  perc_ing_apoio_social ~ sisu2 + perc_doc_ex_femi + perc_doc_ex_dout + perc_doc_ex_int_de,
  data = base_controle,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

summary(mod_rob_apoiosocial_4)



