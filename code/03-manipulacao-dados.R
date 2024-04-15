

# Importação das bases ----------------------------------------------------

# cursos_ies_publicas_presenciais <- readr::read_rds(
#   here::here("dados", "dados_tratados", "rds", "cursos_ies_publicas_presenciais.rds")
# )

# cursos_ies_pp <- readr::read_rds(
#   here::here("dados", "dados_tratados", "rds", "cursos_ies_publicas_presenciais_tds_variaveis.rds")
# )

cursos_ies <- readr::read_rds(
  here::here("dados", "dados_tratados", "rds", "cursos_ies_tds_variaveis.rds")
)

# dplyr::glimpse(cursos_ies_pp)

# sisu_cursos <- readr::read_rds(
#   here::here("dados", "dados_tratados", "rds", "sisu_cursos.rds")
# )

# dplyr::glimpse(sisu_cursos)

sisu_vagas_ofertadas <- readr::read_rds(
  here::here("dados", "dados_tratados", "rds", "sisu_vagas_ofertadas.rds")
)

# sisu_map <- readr::read_delim(
#   "dados/dados_tratados/csv/sisu_map.csv",
#   delim = ";", escape_double = FALSE,
#   col_types = readr::cols(
#     co_ies = readr::col_character(),
#     id_municipio = readr::col_character()
#   ),
#   trim_ws = TRUE
# )


# sisu_mapa_lat_long <- readr::read_delim(
#   "dados/dados_tratados/csv/sisu_mapa_lat_long.csv",
#   delim = ",", escape_double = FALSE, trim_ws = TRUE
# ) |>
#   dplyr::mutate(
#     # nu_ano = as.factor(nu_ano),
#     ano_min = as.factor(ano_min),
#     co_ies = as.character(co_ies),
#     co_ies_curso = as.character(co_ies_curso)
#   ) |>
#   dplyr::filter(nu_ano != "2023")


# cursos_ies_sisu <- readr::read_rds(
#   here::here("dados", "dados_tratados", "rds", "cursos_ies_sisu.rds")
# )


lat_long <- readxl::read_excel(
  "dados/dados_tratados/lat_long_faltantes.xlsx",
  col_types = c("text", "text", "text", "text", "text", "numeric", "numeric")
)


# PRIMEIRA TENTATIVA ------------------------------------------------------
# unir base cursos_ies_publicas_presenciais com sisu_cursos ---------------
# para ver cursos que possuem o sisu como forma de ingresso ---------------
# somente a partir de 2017 ------------------------------------------------
# (alternativa mais adequada, mas limitada) -------------------------------

# dplyr::left_join(
#   cursos_ies_publicas_presenciais,
#   sisu_cursos,
#   by = c(
#     "ano" = "ano",
#     # "sigla_uf" = "uf_ies",
#     # "nome" = "nome_ies",
#     # "sigla" = "sigla_ies",
#     "id_curso" = "codigo_curso"
#   )
# )


# SEGUNDA TENTATIVA -------------------------------------------------------
# criar coluna x1 quando curso possuir ingressante enem (sisu) ------------
# manter o mesmo resultado em x1 depois de x1=1 ---------------------------
# (alternativa menos adequada, mas viável) --------------------------------

# cursos_ies_pp_sisu <- cursos_ies_pp |>
#   dplyr::group_by(CO_IES, CO_CURSO) |>
#   dplyr::mutate(
#     # cria coluna (variável) com o ano mínimo de ingresso pelo enem (sisu)
#     x1 = ifelse(
#       any(QT_ING_ENEM != 0),
#       min(NU_ANO_CENSO[QT_ING_ENEM != 0]),
#       NA_integer_
#     ),
#   # x1 = min(MU_CENSO_ANO[QT_ING_ENEM != 0]),
#   # cria coluna (variável) com a informação se o curso
#   # possui ingressos pelo sisu (=1) ou não (=0)
#     sisu = ifelse((NU_ANO_CENSO - x1) >= 0, 1, 0)
#   ) |>
#   dplyr::ungroup()



# TERCEIRA TENTATIVA ------------------------------------------------------
# unir as bases cursos_ies_pp com sisu_vagas_ofertadas --------------------

sisu_ac <- sisu_vagas_ofertadas |>
    dplyr::filter(
      # exclui as cotas e a rede municipal
      # tp_modalidade == "Ampla Concorrência" |
      #   tp_modalidade == "Ampla concorrência" &
      #   ds_mod_concorrencia == "Ampla Concorrência" |
      #   ds_mod_concorrencia == "Ampla concorrência" &
        ds_categoria_adm != "Pública Municipal" &
        ds_categoria_adm != "Pública municipal"
    ) |>
    dplyr::select(
      c(
        nu_ano,
        co_ies,
        no_ies,
        sg_ies,
        ds_categoria_adm,
        ds_organizacao_academica,
        no_campus,
        ds_regiao,
        sg_uf_campus,
        no_municipio_campus,
        co_ies_curso,
        no_curso,
        ds_turno,
        tp_modalidade,
        ds_mod_concorrencia,
        qt_vagas_ofertadas
      )
    ) |>
  dplyr::group_by(co_ies, co_ies_curso) |>
  dplyr::mutate(
    ano_min = min(nu_ano)
  ) |>
  dplyr::group_by(nu_ano, co_ies, co_ies_curso) |>
  dplyr::mutate(
    qt_vagas_ofertadas_total = sum(qt_vagas_ofertadas)
  ) |>
  dplyr::ungroup() |>
    # fazer um left join com a nova base de lat long
    dplyr::left_join(
      lat_long,
      by = c(
        "co_ies" = "co_ies",
        "no_municipio_campus" = "no_municipio_campus",
        # "no_ies" = "no_ies",
        # "sg_ies" = "sg_ies",
        "sg_uf_campus" = "sg_uf_campus"
      )
    ) |>
  dplyr::rename(
    "no_ies" = "no_ies.x",
    "sg_ies" = "sg_ies.x",
  ) |>
  dplyr::select(-c("no_ies.y", "sg_ies.y")) |> 
  dplyr::filter(ds_mod_concorrencia %in% c("Ampla Concorrência", "Ampla concorrência"))


# depois fazer outro join com a base maior (cursos_ies)

base_completa <- dplyr::left_join(
  cursos_ies,
  sisu_ac,
  by = c(
    "nu_ano_censo" = "nu_ano",
    "co_ies" = "co_ies",
    "co_curso" = "co_ies_curso"
  ),
  relationship = "many-to-many"
) |>
  dplyr::filter(
    # apenas cursos presenciais
    tp_modalidade_ensino == "1" &
      # apenas cursos públicos (exclui o ano de 2013)
      # tp_rede == "1" &
      # apenas cursos de instituições públicas federais e estaduais
      tp_categoria_administrativa %in% c("1", "2") # &
      # exclui as cotas e a rede municipal
      # tp_modalidade == "Ampla Concorrência" |
      # tp_modalidade == "Ampla concorrência" &
      # ds_mod_concorrencia == "Ampla Concorrência" |
      # ds_mod_concorrencia == "Ampla concorrência"
  ) |>
  # dplyr::filter(co_ies == "582" & co_curso == "13851") |> View()
  dplyr::rename(
    "no_curso" = "no_curso.x",
    "no_ies" = "no_ies.x",
    "sg_ies" = "sg_ies.x"
  ) |>
  dplyr::mutate(
    sisu1 = ifelse(nu_ano_censo - ano_min >= 0, 1, 0),
    sisu1 = tidyr::replace_na(sisu1, 0),
    sisu2 = ifelse(is.na(qt_vagas_ofertadas), 0, 1),
    sisu3 = ifelse(nu_ano_censo - ano_min >= 0, 1, 0),
    sisu_vg_total = round(qt_vagas_ofertadas_total / qt_vg_total, 4),
    sisu_vg_total = tidyr::replace_na(sisu_vg_total, 0)
  ) |>
  dplyr::select(
    -c(no_ies.y, sg_ies.y, no_curso.y)
  ) |> 
  dplyr::distinct(nu_ano_censo, co_ies, co_curso, .keep_all = TRUE) 

# base_completa |>
#   dplyr::filter(co_curso == "13851") |> View()

# base_completa |> 
#   dplyr::filter(sg_ies == "UFMT" & co_curso == "1") |> View()

# tabela para fazer o mapa (figura 2) -------------------------------------

# ies_ingresso_sisu <- base_completa |>
#   dplyr::select(
#     c(
#       co_ies,
#       no_ies,
#       sg_ies,
#       no_uf,
#       sg_uf,
#       co_uf,
#       no_municipio,
#       co_municipio,
#       no_campus,
#       no_municipio_campus,
#       sg_uf_campus,
#       lat,
#       long,
#       ano_min
#     )
#   ) |>
#   dplyr::filter(
#     ano_min >= 2010
#   ) |>
#   dplyr::distinct(
#     co_ies,
#     .keep_all = TRUE
#   )


# ies_campus_ingresso_sisu <- base_completa |>
#   dplyr::select(
#     c(
#       co_ies,
#       no_ies,
#       sg_ies,
#       no_uf,
#       sg_uf,
#       co_uf,
#       no_municipio,
#       co_municipio,
#       no_campus,
#       no_municipio_campus,
#       sg_uf_campus,
#       lat,
#       long,
#       ano_min
#     )
#   ) |>
#   dplyr::filter(
#     ano_min >= 2010
#   ) |>
#   dplyr::distinct(
#     co_ies,
#     co_municipio,
#     .keep_all = TRUE
#   )


# limpeza da base de dados ------------------------------------------------

# dados_filtrados <- cursos_ies_pp_sisu |>
#   # excluir NAs (cursos que nunca possuíram ingressantes pelo sisu)
#   dplyr::filter(sisu != "NA") |>
#   dplyr::group_by(CO_IES) |>
#   dplyr::add_count(CO_CURSO) |>
#   dplyr::ungroup() |>
#   # exclui cursos que aparecem apenas uma vez
#   dplyr::filter(n > 1) |>
#   dplyr::group_by(CO_IES, CO_CURSO) |>
#   dplyr::mutate(
#     teve_vestibular = dplyr::case_when(
#       any(sisu == 0) ~ "sim",
#       TRUE ~ "não"
#     )
#   ) |>
#   dplyr::ungroup() |>
#   # exclui cursos que nunca tiveram vestibular
#   dplyr::filter(teve_vestibular == "sim") |>
#   dplyr::arrange(CO_IES, CO_CURSO, NU_ANO_CENSO, sisu)



base_completa_filtrada <- base_completa |>
  dplyr::group_by(co_ies) |>
  dplyr::add_count(co_curso) |>
  dplyr::ungroup() |>
  # exclui cursso que aparecem apenas uma vez
  dplyr::filter(n > 1) |>
  dplyr::group_by(co_ies, co_curso) |>
  dplyr::mutate(
    teve_vestibular = dplyr::case_when(
      any(sisu1 == 0) ~ "sim",
      TRUE ~ "não"
    )
  ) |>
  dplyr::ungroup() |>
  # dplyr::mutate(
  #   ds_mod_concorrencia = stringr::str_replace_na(ds_mod_concorrencia, "NA"),
  #   concorrencia = dplyr::case_when(
  #     ds_mod_concorrencia == "Ampla Concorrência" ~ 1,
  #     ds_mod_concorrencia == "Ampla concorrencia" ~ 1,
  #     ds_mod_concorrencia == "Ampla concorrência" ~ 1,
  #     ds_mod_concorrencia == "NA" ~ 1,
  #     TRUE ~ 0
  #   )
  # ) |> 
  # exclui os cursos que nunca tiveram vestibular
  dplyr::filter(
    teve_vestibular == "sim" 
      # & concorrencia == 1
  ) |> 
  dplyr::arrange(co_ies, co_curso, nu_ano_censo, sisu2) |>
  dplyr::group_by(nu_ano_censo, co_ies, co_curso) |>
  dplyr::mutate(
    co_cine_rotulo = stringr::str_remove_all(co_cine_rotulo, "\"\""),
    qt_total_ing_nao_branca = sum(qt_ing_preta, qt_ing_parda, qt_ing_amarela, qt_ing_indigena, na.rm = TRUE),
    qt_total_ing_0_29 = sum(qt_ing_0_17, qt_ing_18_24, qt_ing_25_29, na.rm = TRUE),
    qt_total_ing_0_34 = sum(qt_ing_0_17, qt_ing_18_24, qt_ing_25_29, qt_ing_30_34, na.rm = TRUE),
    qt_total_ing_35_60_mais = sum(qt_ing_35_39, qt_ing_40_49, qt_ing_50_59, qt_ing_60_mais, na.rm = TRUE),
    perc_ing_feminino = qt_ing_fem / qt_ing,
    perc_ing_masculino = qt_ing_masc / qt_ing,
    perc_ing_branca = qt_ing_branca / qt_ing,
    perc_ing_nao_branca = qt_total_ing_nao_branca / qt_ing,
    perc_ing_preta = qt_ing_preta / qt_ing,
    perc_ing_parda = qt_ing_parda / qt_ing,
    perc_ing_indigena = qt_ing_indigena / qt_ing,
    perc_ing_deficiencia = qt_ing_deficiente / qt_ing,
    perc_ing_apoio_social = qt_ing_apoio_social / qt_ing,
    perc_ing_escola_publica = qt_ing_procescpublica / qt_ing,
    perc_ing_0_29 = qt_total_ing_0_29 / qt_ing,
    perc_ing_0_34 = qt_total_ing_0_34 / qt_ing,
    perc_ing_35_60_mais = qt_total_ing_35_60_mais / qt_ing,
    perc_ing_0_17 = qt_ing_0_17 / qt_ing,
    perc_ing_18_24 = qt_ing_18_24 / qt_ing,
    perc_ing_25_29 = qt_ing_25_29 / qt_ing,
    perc_ing_30_34 = qt_ing_30_34 / qt_ing,
    perc_ing_35_39 = qt_ing_35_39 / qt_ing,
    perc_ing_40_49 = qt_ing_40_49 / qt_ing,
    perc_ing_50_59 = qt_ing_50_59 / qt_ing,
    perc_ing_60_mais = qt_ing_60_mais / qt_ing
  ) |>
  dplyr::ungroup() |>
  dplyr::arrange(co_ies, co_curso, nu_ano_censo, sisu2)

# base_completa_filtrada |>
#   dplyr::select(
#     c(
#       1:8,
#       co_ies,
#       co_curso,
#       sg_ies,
#       qt_ing_0_17,
#       qt_ing_18_24,
#       qt_ing_25_29,
#       qt_ing_30_34,
#       qt_ing_35_39,
#       qt_ing_40_49,
#       qt_ing_50_59,
#       qt_ing_60_mais,
#       ds_mod_concorrencia,
#       qt_vagas_ofertadas,
#       qt_vagas_ofertadas_total,
#       sisu1
#     )
#   ) |> dplyr::mutate(
#     ds_mod_concorrencia = stringr::str_replace_na(ds_mod_concorrencia, "NA"),
#     concorrencia = dplyr::case_when(
#       ds_mod_concorrencia == "Ampla Concorrência" ~ 1,
#       ds_mod_concorrencia == "Ampla concorrencia" ~ 1,
#       ds_mod_concorrencia == "NA" ~ 1,
#       TRUE ~ 0
#     )
#   ) |> View()


sisu_nunca <- base_completa |> 
  dplyr::filter(
    tp_categoria_administrativa == "1"
    & nu_ano_censo != 2009
    & tp_dimensao == "1"
  ) |>
  dplyr::group_by(co_ies) |> 
  dplyr::mutate(
    aderiu_sisu = dplyr::case_when(
      sum(sisu2 == "1") > 0 ~ "1",
      TRUE ~ "0"
    )
  ) |>
  dplyr::ungroup() |> 
  dplyr::filter(
    aderiu_sisu == "0"
  ) |>
  dplyr::distinct(nu_ano_censo, sg_ies, co_ies, .keep_all = TRUE) |>
  dplyr::select(
    c(
      nu_ano_censo,
      ano_min,
      co_ies,
      sg_ies,
      no_ies,
      no_municipio,
      sisu2,
      aderiu_sisu
    )
  ) 


# RASCUNHOS
base_completa_filtrada |>
  dplyr::filter(co_ies == "582" & co_curso == "13851") |>
  # dplyr::select(c(1:8, co_ies, co_curso, no_curso, sg_ies, ds_mod_concorrencia, qt_ing_0_17, qt_ing_18_24, qt_ing_25_29, qt_ing_30_34, qt_ing_35_39, qt_ing_40_49, qt_ing_50_59, qt_ing_60_mais, qt_total_ing_0_34, qt_total_ing_35_60_mais)) |>
  # dplyr::select(c(1:8, co_curso, no_curso, sg_ies, 290:297)) |>
  # dplyr::distinct(nu_ano_censo, co_ies, co_curso, .keep_all = TRUE) |>
  View()


base_completa |>
  dplyr::filter(co_ies == "582" & co_curso == "13851") |>
  dplyr::select(c(1:8, co_ies, co_curso, no_curso, sg_ies, ds_mod_concorrencia, qt_ing_0_17, qt_ing_18_24, qt_ing_25_29, qt_ing_30_34, qt_ing_35_39, qt_ing_40_49, qt_ing_50_59, qt_ing_60_mais, qt_total_ing_0_34, qt_total_ing_35_60_mais)) |>
  # dplyr::select(c(1:8, co_curso, no_curso, sg_ies, 290:297)) |>
  dplyr::distinct(nu_ano_censo, co_ies, co_curso, .keep_all = TRUE) |>
  View()


sisu_ac |> 
  dplyr::filter(
    co_ies == "582" 
      # & co_ies_curso == "13851"
      & co_ies_curso == "13850"
  ) |>
  # dplyr::select(c(1:8, co_ies, co_curso, no_curso, sg_ies, ds_mod_concorrencia, qt_ing_0_17, qt_ing_18_24, qt_ing_25_29, qt_ing_30_34, qt_ing_35_39, qt_ing_40_49, qt_ing_50_59, qt_ing_60_mais, qt_total_ing_0_34, qt_total_ing_35_60_mais)) |>
  # dplyr::select(c(1:8, co_curso, no_curso, sg_ies, 290:297)) |>
  # dplyr::distinct(nu_ano, co_ies, co_ies_curso, .keep_all = TRUE) |>
  View()


base_completa_filtrada |> 
  dplyr::distinct(ds_mod_concorrencia) 

sisu_vagas_ofertadas |> 
  dplyr::select(
    c(
      1:8,
      co_ies_curso,
      no_curso,
      ds_mod_concorrencia,
      tp_modalidade,
      qt_vagas_ofertadas
    )
  ) |>
  dplyr::filter(
    co_ies == "582"
      & co_ies_curso == "13851"
  ) |> 
  View()



# salvando as tabelas -----------------------------------------------------

# cursos_ies_pp_sisu ------------------------------------------------------

readr::write_rds(
  cursos_ies_pp_sisu,
  here::here("dados", "dados_tratados", "rds", "cursos_ies_pp_sisu.rds"),
  compress = "gz"
)


write.csv(
  cursos_ies_pp_sisu,
  here::here("dados", "dados_tratados", "csv", "cursos_ies_pp_sisu.csv"),
  fileEncoding = "UTF-8"
)


# dados filtrados ---------------------------------------------------------

# readr::write_rds(
#   dados_filtrados,
#   here::here("dados", "dados_tratados", "rds", "dados_filtrados.rds"),
#   compress = "gz"
# )


# write.csv(
#   dados_filtrados,
#   here::here("dados", "dados_tratados", "csv", "dados_filtrados.csv"),
#   fileEncoding = "UTF-8"
# )


# base completa ------------------------------------------------------------

readr::write_rds(
  base_completa,
  here::here("dados", "dados_tratados", "rds", "base_completa.rds"),
  compress = "gz"
)


write.csv(
  base_completa,
  here::here("dados", "dados_tratados", "csv", "base_completa.csv"),
  fileEncoding = "UTF-8"
)


# base_completa_filtrada --------------------------------------------------

readr::write_rds(
  base_completa_filtrada,
  here::here("dados", "dados_tratados", "rds", "base_completa_filtrada.rds"),
  compress = "gz"
)

write.csv(
  base_completa_filtrada,
  here::here("dados", "dados_tratados", "csv", "base_completa_filtrada.csv"),
  fileEncoding = "UTF-8"
)


# ies_ingresso_sisu -------------------------------------------------------

readr::write_rds(
  ies_ingresso_sisu,
  here::here("dados", "dados_tratados", "rds", "ies_ingresso_sisu.rds"),
  compress = "gz"
)

write.csv(
  ies_ingresso_sisu,
  here::here("dados", "dados_tratados", "csv", "ies_ingresso_sisu.csv"),
  fileEncoding = "UTF-8"
)


# ies_campus_ingresso_sisu ------------------------------------------------

readr::write_rds(
  ies_campus_ingresso_sisu,
  here::here("dados", "dados_tratados", "rds", "ies_campus_ingresso_sisu.rds"),
  compress = "gz"
)

write.csv(
  ies_campus_ingresso_sisu,
  here::here("dados", "dados_tratados", "csv", "ies_campus_ingresso_sisu.csv"),
  fileEncoding = "UTF-8"
)


# sisu_nunca --------------------------------------------------------------

readr::write_rds(
  sisu_nunca,
  here::here("dados", "dados_tratados", "rds", "sisu_nunca.rds"),
  compress = "gz"
)

write.csv(
  sisu_nunca,
  here::here("dados", "dados_tratados", "csv", "sisu_nunca.csv"),
  fileEncoding = "UTF-8"
)

# RASCUNHOS ---------------------------------------------------------------

cursos_ies_pp_sisu |>
  dplyr::select(
    c(
      NU_ANO_CENSO,
      CO_IES,
      SG_IES,
      CO_CURSO,
      NO_CURSO,
      QT_ING_ENEM,
      x1,
      sisu
    )
  ) |>
  dplyr::arrange(CO_IES, CO_CURSO, NU_ANO_CENSO, sisu) |>
  # dplyr::filter(sisu == "NA") |>
  # dplyr::filter(SG_IES == "UFSM") |>
  dplyr::filter(is.na(sisu)) |>
  dplyr::distinct(CO_IES, CO_CURSO, .keep_all = TRUE) |>
  View("universidades_cursos_que_nao_possuem_sisu")





lat_long <- sisu_ac |>
  dplyr::distinct(
    co_ies,
    sg_uf_campus,
    no_municipio_campus,
    .keep_all = TRUE
  ) |>
  dplyr::select(
    c(
      co_ies,
      no_ies,
      sg_ies,
      sg_uf_campus,
      no_municipio_campus,
      lat,
      long
    )
  )


write.csv(
  lat_long_faltantes,
  here::here("dados", "dados_tratados", "csv", "lat_long_faltantes.csv"),
  fileEncoding = "UTF-8"
)

writexl::write_xlsx(
  lat_long,
  here::here("dados", "dados_tratados", "lat_long_faltantes.xlsx")
)

