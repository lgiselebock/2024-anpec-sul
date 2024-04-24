
# pacotes -----------------------------------------------------------------
# instalar os pacotes abaixo caso não tenha instalado

# install.packages("here")
# install.packages("tidyverse")
# install.packages("janitor")

# Importação das bases ----------------------------------------------------

cursos_ies <- readr::read_rds(
  here::here("dados", "dados_tratados", "rds", "cursos_ies.rds")
)

sisu_vagas_ofertadas <- readr::read_rds(
  here::here("dados", "dados_tratados", "rds", "sisu_vagas_ofertadas.rds")
)

lat_long <- readxl::read_excel(
  here::here("dados", "lat_long.xlsx"),
  col_types = c("text", "text", "text", "text", "text", "numeric", "numeric")
)

# unir a base sisu_vagas_ofertadas com lat_long --------------------

sisu_ac <- sisu_vagas_ofertadas |>
    dplyr::filter(
      # exclui a rede municipal
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
    # fazer um left join com a base de lat long
    dplyr::left_join(
      lat_long,
      by = c(
        "co_ies" = "co_ies",
        "no_municipio_campus" = "no_municipio_campus",
        "sg_uf_campus" = "sg_uf_campus"
      )
    ) |>
  dplyr::rename(
    "no_ies" = "no_ies.x",
    "sg_ies" = "sg_ies.x",
  ) |>
  dplyr::select(-c("no_ies.y", "sg_ies.y")) |>
  dplyr::filter(
    ds_mod_concorrencia %in% c("Ampla Concorrência", "Ampla concorrência")
  )

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
      # apenas cursos de instituições públicas federais e estaduais
      tp_categoria_administrativa %in% c("1", "2")
  ) |>
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

# limpeza da base de dados ------------------------------------------------

base_completa_filtrada <- base_completa |>
  # agrupa a base por instituição
  dplyr::group_by(co_ies) |>
  # conta quantas vezes o mesmo curso da instituição aparece na base
  dplyr::add_count(co_curso) |>
  # desagrupa a base
  dplyr::ungroup() |>
  # exclui cursos que aparecem apenas uma vez
  dplyr::filter(n > 1) |>
  # agrupa a base por instituição e por curso
  dplyr::group_by(co_ies, co_curso) |>
  # cria uma variável `teve_vestibular` que indica se o curso já teve vestibular
  dplyr::mutate(
    teve_vestibular = dplyr::case_when(
      any(sisu1 == 0) ~ "sim",
      TRUE ~ "não"
    )
  ) |>
  # desagrupa a base
  dplyr::ungroup() |>
  # exclui os cursos que nunca tiveram vestibular
  dplyr::filter(teve_vestibular == "sim") |>
  # ordena a base por instituição, curso, ano do censo (2009, 2010, ... 2022)
  # e existência (sisu2 == 1) ou não (sisu2 == 0) do sisu
  dplyr::arrange(co_ies, co_curso, nu_ano_censo, sisu2) |>
  # agrupa a base por ano do censo, instituição e curso
  dplyr::group_by(nu_ano_censo, co_ies, co_curso) |>
  # cria variáveis que indicam a quantidade total de ingressantes
  # e os percentuais de alunos ingressantes (para cada perfil)
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
  # desagrupa a base
  dplyr::ungroup() |>
  # ordena por instituição, curso, ano do censo (2009, 2010, ... 2022)
  # e existência (sisu2 == 1) ou não (sisu2 == 0) do sisu
  dplyr::arrange(co_ies, co_curso, nu_ano_censo, sisu2)


# cria uma base com as instituições que nunca aderiram ao sisu (sisu2 == 0)
sisu_nunca <- base_completa |>
  # retira da base o ano de 2009
  # (antes da existência do sisu)
  dplyr::filter(nu_ano_censo != 2009) |>
  # agrupa a base por instituição
  dplyr::group_by(co_ies) |>
  # cria a variável `aderiu_sisu` que indica se o curso,
  # em algum momento, aderiu ao sisu (sisu2 == 1) ou não (sisu2 == 0)
  dplyr::mutate(
    aderiu_sisu = dplyr::case_when(
      sum(sisu2 == "1") > 0 ~ "1",
      TRUE ~ "0"
    )
  ) |>
  # desagrupa a base
  dplyr::ungroup() |>
  # mantem apenas os cursos que nunca aderiram ao sisu
  dplyr::filter(
    aderiu_sisu == "0"
  ) |>
  # remove as linhas duplicadas
  dplyr::distinct(nu_ano_censo, sg_ies, co_ies, .keep_all = TRUE) |>
  # seleciona as variáveis de interesse
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

# tabela para fazer o mapa (figura 2) -------------------------------------

ies_ingresso_sisu <- base_completa |>
  dplyr::select(
    c(
      co_ies,
      no_ies,
      sg_ies,
      no_uf,
      sg_uf,
      co_uf,
      no_municipio,
      co_municipio,
      no_campus,
      no_municipio_campus,
      sg_uf_campus,
      lat,
      long,
      ano_min
    )
  ) |>
  dplyr::filter(ano_min >= 2010) |>
  dplyr::distinct(
    co_ies,
    .keep_all = TRUE
  )

# salvando as tabelas -----------------------------------------------------

## base completa ----------------------------------------------------------

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

## base_completa_filtrada -------------------------------------------------

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

## ies_ingresso_sisu ------------------------------------------------------

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

## sisu_nunca -------------------------------------------------------------

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

# RASCUNHOS

# base_completa_filtrada |>
#   dplyr::filter(co_ies == "582" & co_curso == "13851") |>
#   dplyr::select(
#     c(
#       1:8,
#       co_ies,
#       co_curso,
#       no_curso,
#       sg_ies,
#       ds_mod_concorrencia,
#       qt_ing_0_17,
#       qt_ing_18_24,
#       qt_ing_25_29,
#       qt_ing_30_34,
#       qt_ing_35_39,
#       qt_ing_40_49,
#       qt_ing_50_59,
#       qt_ing_60_mais,
#       qt_total_ing_0_34,
#       qt_total_ing_35_60_mais
#     )
#   ) |>
#   dplyr::distinct(nu_ano_censo, co_ies, co_curso, .keep_all = TRUE) |>
#   View()

# base_completa |>
#   dplyr::filter(co_ies == "582" & co_curso == "13851") |>
#   dplyr::select(
#     c(
#       1:8,
#       co_ies,
#       co_curso,
#       no_curso,
#       sg_ies,
#       ds_mod_concorrencia,
#       qt_ing_0_17,
#       qt_ing_18_24,
#       qt_ing_25_29,
#       qt_ing_30_34,
#       qt_ing_35_39,
#       qt_ing_40_49,
#       qt_ing_50_59,
#       qt_ing_60_mais
#     )
#   ) |>
#   dplyr::distinct(nu_ano_censo, co_ies, co_curso, .keep_all = TRUE) |>
#   View()

# sisu_ac |>
#   dplyr::filter(
#     co_ies == "582"
#     # & co_ies_curso == "13851"
#     & co_ies_curso == "13850"
#   ) |>
#   dplyr::select(
#     c(
#       1:8,
#       co_ies,
#       co_curso,
#       no_curso,
#       sg_ies,
#       ds_mod_concorrencia,
#       qt_ing_0_17,
#       qt_ing_18_24,
#       qt_ing_25_29,
#       qt_ing_30_34,
#       qt_ing_35_39,
#       qt_ing_40_49,
#       qt_ing_50_59,
#       qt_ing_60_mais,
#       qt_total_ing_0_34,
#       qt_total_ing_35_60_mais
#     )
#   ) |>
#   dplyr::select(c(1:8, co_curso, no_curso, sg_ies, 290:297)) |>
#   dplyr::distinct(nu_ano, co_ies, co_ies_curso, .keep_all = TRUE) |>
#   View()

# sisu_vagas_ofertadas |>
#   dplyr::select(
#     c(
#       1:8,
#       co_ies_curso,
#       no_curso,
#       ds_mod_concorrencia,
#       tp_modalidade,
#       qt_vagas_ofertadas
#     )
#   ) |>
#   dplyr::filter(co_ies == "582" & co_ies_curso == "13851") |>
#   View()
