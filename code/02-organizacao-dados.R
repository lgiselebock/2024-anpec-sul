
# pacotes -----------------------------------------------------------------
# instalar os pacotes abaixo caso não tenha instalado

# install.packages("here")
# install.packages("tidyverse")
# install.packages("janitor")

# importação dos dados brutos ---------------------------------------------

## censo do ensino superior -----------------------------------------------

censo_ensino_superior <- list.files(
  here::here("dados", "dados_brutos", "rds", "censo_ensino_superior"),
  full.names = TRUE,
  pattern = ".rds"
) |>
  purrr:::map(
    ~ readr::read_rds(.x)
  )

cursos_2009 <- censo_ensino_superior[[5]]
cursos_2010 <- censo_ensino_superior[[6]]
cursos_2011 <- censo_ensino_superior[[7]]
cursos_2012 <- censo_ensino_superior[[8]]
cursos_2013 <- censo_ensino_superior[[9]]
cursos_2014 <- censo_ensino_superior[[10]]
cursos_2015 <- censo_ensino_superior[[11]]
cursos_2016 <- censo_ensino_superior[[12]]
cursos_2017 <- censo_ensino_superior[[13]]
cursos_2018 <- censo_ensino_superior[[14]]
cursos_2019 <- censo_ensino_superior[[15]]
cursos_2020 <- censo_ensino_superior[[16]]
cursos_2021 <- censo_ensino_superior[[17]]
cursos_2022 <- censo_ensino_superior[[18]]

ies_2009 <- censo_ensino_superior[[23]]
ies_2010 <- censo_ensino_superior[[24]]
ies_2011 <- censo_ensino_superior[[25]]
ies_2012 <- censo_ensino_superior[[26]]
ies_2013 <- censo_ensino_superior[[27]]
ies_2014 <- censo_ensino_superior[[28]]
ies_2015 <- censo_ensino_superior[[29]]
ies_2016 <- censo_ensino_superior[[30]]
ies_2017 <- censo_ensino_superior[[31]]
ies_2018 <- censo_ensino_superior[[32]]
ies_2019 <- censo_ensino_superior[[33]]
ies_2020 <- censo_ensino_superior[[34]]
ies_2021 <- censo_ensino_superior[[35]]
ies_2022 <- censo_ensino_superior[[36]]

## chamada regular do sisu ------------------------------------------------

chamada_regular_sisu <- list.files(
  here::here("dados", "dados_brutos", "rds", "chamada_regular_sisu"),
  full.names = TRUE,
  pattern = ".rds"
) |>
  purrr:::map(
    ~ readr::read_rds(.x)
  )

sisu_2017_1 <- chamada_regular_sisu[[1]]
sisu_2017_2 <- chamada_regular_sisu[[2]]
sisu_2018_1 <- chamada_regular_sisu[[3]]
sisu_2018_2 <- chamada_regular_sisu[[4]]
sisu_2019_1 <- chamada_regular_sisu[[5]]
sisu_2019_2 <- chamada_regular_sisu[[6]]
sisu_2020_1 <- chamada_regular_sisu[[7]]
sisu_2020_2 <- chamada_regular_sisu[[8]]
sisu_2021_1 <- chamada_regular_sisu[[9]]
sisu_2021_2 <- chamada_regular_sisu[[10]]
sisu_2022_1 <- chamada_regular_sisu[[11]]
sisu_2022_2 <- chamada_regular_sisu[[12]]

## vagas ofertadas do sisu ------------------------------------------------

vagas_ofertadas_sisu <- list.files(
  here::here("dados", "dados_brutos", "rds", "vagas_ofertadas_sisu"),
  full.names = TRUE,
  pattern = ".rds"
) |>
  purrr:::map(
    ~ readr::read_rds(.x)
  )

vagas_ofertadas_2010_2018 <- vagas_ofertadas_sisu[[1]]
vagas_ofertadas_2019_1 <- vagas_ofertadas_sisu[[2]]
vagas_ofertadas_2019_2 <- vagas_ofertadas_sisu[[3]]
vagas_ofertadas_2020_1 <- vagas_ofertadas_sisu[[4]]
vagas_ofertadas_2020_2 <- vagas_ofertadas_sisu[[5]]
vagas_ofertadas_2021_1 <- vagas_ofertadas_sisu[[6]]
vagas_ofertadas_2021_2 <- vagas_ofertadas_sisu[[7]]
vagas_ofertadas_2022_1 <- vagas_ofertadas_sisu[[8]]
vagas_ofertadas_2022_2 <- vagas_ofertadas_sisu[[9]]


# organização e união dos dados brutos ------------------------------------
# (censo do ensino superior) em uma tabela --------------------------------

## ano de 2022 ------------------------------------------------------------

cursos_ies_2022 <- dplyr::left_join(
  cursos_2022,
  ies_2022,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA)
  )

## ano de 2021 ------------------------------------------------------------

cursos_ies_2021 <- dplyr::left_join(
  cursos_2021,
  ies_2021,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA)
  )

## ano de 2020 ------------------------------------------------------------

cursos_ies_2020 <- dplyr::left_join(
  cursos_2020,
  ies_2020,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::rename(
    "CO_CINE_ROTULO" = "CO_CINE_ROTULO2"
  ) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )

## ano de 2019 ------------------------------------------------------------

cursos_ies_2019 <- dplyr::left_join(
  cursos_2019,
  ies_2019,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )


# ano de 2018 -------------------------------------------------------------

cursos_ies_2018 <- dplyr::left_join(
  cursos_2018,
  ies_2018,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )


# ano de 2017 -------------------------------------------------------------

cursos_ies_2017 <- dplyr::left_join(
  cursos_2017,
  ies_2017,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )


# ano de 2016 -------------------------------------------------------------

cursos_ies_2016 <- dplyr::left_join(
  cursos_2016,
  ies_2016,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )


# ano de 2015 -------------------------------------------------------------

cursos_ies_2015 <- dplyr::left_join(
  cursos_2015,
  ies_2015,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )


# ano de 2014 -------------------------------------------------------------

cursos_ies_2014 <- dplyr::left_join(
  cursos_2014,
  ies_2014,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )

# ano de 2013 -------------------------------------------------------------

cursos_ies_2013 <- dplyr::left_join(
  cursos_2013,
  ies_2013,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )

# ano de 2012 -------------------------------------------------------------

cursos_ies_2012 <- dplyr::left_join(
  cursos_2012,
  ies_2012,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )

# ano de 2011 -------------------------------------------------------------

cursos_ies_2011 <- dplyr::left_join(
  cursos_2011,
  ies_2011,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )


# ano de 2010 -------------------------------------------------------------

cursos_ies_2010 <- dplyr::left_join(
  cursos_2010,
  ies_2010,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )

# ano de 2009 -------------------------------------------------------------

cursos_ies_2009 <- dplyr::left_join(
  cursos_2009,
  ies_2009,
  by = c(
    "NU_ANO_CENSO" = "NU_ANO_CENSO",
    "TP_ORGANIZACAO_ACADEMICA" = "TP_ORGANIZACAO_ACADEMICA",
    "TP_CATEGORIA_ADMINISTRATIVA" = "TP_CATEGORIA_ADMINISTRATIVA",
    "CO_IES" = "CO_IES"
  )
) |>
  dplyr::rename(
    "QT_DOC_TOTAL" = "QT_DOCENTE_TOTAL",
    "QT_DOC_EXE" = "QT_DOCENTE_EXE",
    "QT_DOC_EX_FEMI" = "DOC_EX_FEMI",
    "QT_DOC_EX_MASC" = "DOC_EX_MASC",
    "QT_DOC_EX_SEM_GRAD" = "DOC_EX_SEM_GRAD",
    "QT_DOC_EX_GRAD" = "DOC_EX_GRAD",
    "QT_DOC_EX_ESP" = "DOC_EX_ESP",
    "QT_DOC_EX_MEST" = "DOC_EX_MEST",
    "QT_DOC_EX_DOUT" = "DOC_EX_DOUT",
    "QT_DOC_EX_INT"  = "DOC_EX_INT",
    "QT_DOC_EX_INT_DE" = "DOC_EX_INT_DE",
    "QT_DOC_EX_INT_SEM_DE" = "DOC_EX_INT_SEM_DE",
    "QT_DOC_EX_PARC" = "DOC_EX_PARC",
    "QT_DOC_EX_HOR" = "DOC_EX_HOR",
    "QT_DOC_EX_0_29" = "DOC_EX_0_29",
    "QT_DOC_EX_30_34" = "DOC_EX_30_34",
    "QT_DOC_EX_35_39" = "DOC_EX_35_39",
    "QT_DOC_EX_40_44" = "DOC_EX_40_44",
    "QT_DOC_EX_45_49" = "DOC_EX_45_49",
    "QT_DOC_EX_50_54" = "DOC_EX_50_54",
    "QT_DOC_EX_55_59" = "DOC_EX_55_59",
    "QT_DOC_EX_60_MAIS" = "DOC_EX_60_MAIS",
    "QT_DOC_EX_BRANCA" = "DOC_EX_BRANCA",
    "QT_DOC_EX_PRETA" = "DOC_EX_PRETA",
    "QT_DOC_EX_PARDA" = "DOC_EX_PARDA",
    "QT_DOC_EX_AMARELA" = "DOC_EX_AMARELA",
    "QT_DOC_EX_INDIGENA" = "DOC_EX_INDIGENA",
    "QT_DOC_EX_COR_ND" = "DOC_EX_COR_ND",
    "QT_DOC_EX_BRA" = "DOC_EX_BRA",
    "QT_DOC_EX_EST" = "DOC_EX_EST",
    "QT_DOC_EX_COM_DEFICIENCIA" = "DOC_EX_COM_DEFICIENCIA",
  ) |>
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )

# união das bases cursos_ies (2009 a 2022) em uma só ----------------------

cursos_ies <- dplyr::bind_rows(
  cursos_ies_2009,
  cursos_ies_2010,
  cursos_ies_2011,
  cursos_ies_2012,
  cursos_ies_2013,
  cursos_ies_2014,
  cursos_ies_2015,
  cursos_ies_2016,
  cursos_ies_2017,
  cursos_ies_2018,
  cursos_ies_2019,
  cursos_ies_2020,
  cursos_ies_2021,
  cursos_ies_2022
) |>
  janitor::clean_names()

# filtrando apenas cursos presenciais de instituições públicas -------------

cursos_ies_publicas_presenciais <- cursos_ies |>
  dplyr::filter(
    # apenas cursos presenciais
    tp_modalidade_ensino == "1" &
      # apenas cursos públicos
      tp_rede == "1" &
      # apenas cursos de instituições públicas federais e estaduais
      tp_categoria_administrativa %in% c("1", "2")
  )

# organização e união dos dados brutos ------------------------------------
# (chamada regular do sisu) em uma tabela ---------------------------------

## ano de 2022 ------------------------------------------------------------

sisu_2022 <- dplyr::bind_rows(
  sisu_2022_1,
  sisu_2022_2
) |>
  janitor::clean_names() |>
  dplyr::select(
    c(
      ano,
      edicao,
      codigo_ies,
      nome_ies,
      sigla_ies,
      uf_ies,
      codigo_curso,
      nome_curso
    )
  )

## ano de 2021 ------------------------------------------------------------

sisu_2021 <- dplyr::bind_rows(
  dplyr::rename(
    sisu_2021_1,
    "ANO" = "NU_ANO",
    "EDICAO" = "NU_EDICAO",
    "CODIGO_IES" = "CO_IES",
    "NOME_IES" = "NO_IES",
    "UF_IES" = "SG_UF_IES",
    "CODIGO_CURSO" = "CO_IES_CURSO",
    "NOME_CURSO" = "NO_CURSO"
  ) |>
    dplyr::select(
      c(
        ANO,
        EDICAO,
        CODIGO_IES,
        NOME_IES,
        SIGLA_IES,
        UF_IES,
        CODIGO_CURSO,
        NOME_CURSO
      )
    ),
  dplyr::select(
    sisu_2021_2,
    c(
      ANO,
      EDICAO,
      CODIGO_IES,
      NOME_IES,
      SIGLA_IES,
      UF_IES,
      CODIGO_CURSO,
      NOME_CURSO
    )
  )
) |>
  janitor::clean_names()

## ano de 2020 ------------------------------------------------------------

sisu_2020 <- dplyr::bind_rows(
  dplyr::select(
    sisu_2020_1,
    c(
      NU_ANO,
      NU_EDICAO,
      CO_IES,
      NO_IES,
      SIGLA_IES,
      SG_UF_IES,
      CO_IES_CURSO,
      NO_CURSO
    )
  ),
  dplyr::select(
    sisu_2020_2,
    c(
      NU_ANO,
      NU_EDICAO,
      CO_IES,
      NO_IES,
      SIGLA_IES,
      SG_UF_IES,
      CO_IES_CURSO,
      NO_CURSO
    )
  )
) |>
  dplyr::rename(
    "ano" = "NU_ANO",
    "edicao" = "NU_EDICAO",
    "codigo_ies" = "CO_IES",
    "nome_ies" = "NO_IES",
    "sigla_ies" = "SIGLA_IES",
    "uf_ies" = "SG_UF_IES",
    "codigo_curso" = "CO_IES_CURSO",
    "nome_curso" = "NO_CURSO"
  )

## ano de 2019 ------------------------------------------------------------

sisu_2019 <- dplyr::bind_rows(
  sisu_2019_1,
  sisu_2019_2
) |>
  dplyr::select(
    c(
      NU_ANO,
      NU_EDICAO,
      CO_IES,
      NO_IES,
      SIGLA_IES,
      SG_UF_IES,
      CO_IES_CURSO,
      NO_CURSO
    )
  ) |>
  dplyr::rename(
    "ano" = "NU_ANO",
    "edicao" = "NU_EDICAO",
    "codigo_ies" = "CO_IES",
    "nome_ies" = "NO_IES",
    "sigla_ies" = "SIGLA_IES",
    "uf_ies" = "SG_UF_IES",
    "codigo_curso" = "CO_IES_CURSO",
    "nome_curso" = "NO_CURSO"
  )

## ano de 2018 ------------------------------------------------------------

sisu_2018 <- dplyr::bind_rows(
  dplyr::select(
    sisu_2018_1,
    c(
      ANO,
      EDICAO,
      CODIGO_IES,
      NOME_IES,
      SIGLA_IES,
      UF_IES,
      CODIGO_CURSO,
      NOME_CURSO
    )
  ),
  dplyr::rename(
    sisu_2018_2,
    c(
      "ANO" = "NU_ANO",
      "EDICAO" = "NU_EDICAO",
      "CODIGO_IES" = "CO_IES",
      "NOME_IES" = "NO_IES",
      "UF_IES" = "SG_UF_IES",
      "CODIGO_CURSO" = "CO_IES_CURSO",
      "NOME_CURSO" = "NO_CURSO"
    )
  ) |>
  dplyr::select(
    c(
      ANO,
      EDICAO,
      CODIGO_IES,
      NOME_IES,
      SIGLA_IES,
      UF_IES,
      CODIGO_CURSO,
      NOME_CURSO
    )
  )
) |>
  janitor::clean_names()

## ano de 2017 ------------------------------------------------------------

sisu_2017 <- dplyr::bind_rows(
  dplyr::select(
    sisu_2017_1,
    c(
      NU_ANO,
      NU_EDICAO,
      CO_IES,
      NO_IES,
      SIGLA_IES,
      SG_UF_IES,
      CO_IES_CURSO,
      NO_CURSO
    )
  ),
  dplyr::select(
    sisu_2017_2,
    c(
      NU_ANO,
      NU_EDICAO,
      CO_IES,
      NO_IES,
      SIGLA_IES,
      SG_UF_IES,
      CO_IES_CURSO,
      NO_CURSO
    )
  )
) |>
  dplyr::rename(
    "ano" = "NU_ANO",
    "edicao" = "NU_EDICAO",
    "codigo_ies" = "CO_IES",
    "nome_ies" = "NO_IES",
    "sigla_ies" = "SIGLA_IES",
    "uf_ies" = "SG_UF_IES",
    "codigo_curso" = "CO_IES_CURSO",
    "nome_curso" = "NO_CURSO"
  )

## união das bases sisu (2017 a 2022) em uma só ---------------------------

sisu <- dplyr::bind_rows(
  sisu_2017,
  sisu_2018,
  sisu_2019,
  sisu_2020,
  sisu_2021,
  sisu_2022
) |>
  dplyr::mutate(
    codigo_ies = as.character(codigo_ies),
    codigo_curso = as.character(codigo_curso),
    sisu = as.integer(1)
  )


sisu_cursos <- sisu |>
  dplyr::distinct(
    ano,
    edicao,
    codigo_ies,
    nome_ies,
    sigla_ies,
    uf_ies,
    codigo_curso,
    nome_curso,
    sisu
  )

# organização e união dos dados brutos ------------------------------------
# (vagas ofertadas do sisu) em uma tabela ---------------------------------

## ano de 2022 ------------------------------------------------------------

sisu_vagas_ofertadas_2022 <- dplyr::bind_rows(
  vagas_ofertadas_2022_1,
  dplyr::mutate(
    vagas_ofertadas_2022_2,
    QT_SEMESTRE = as.numeric(QT_SEMESTRE)
  )
) |>
  dplyr::rename(
    "QT_VAGAS_OFERTADAS" = "QT_VAGAS_CONCORRENCIA"
  )

## ano de 2021 ------------------------------------------------------------

sisu_vagas_ofertadas_2021 <- dplyr::bind_rows(
  vagas_ofertadas_2021_1,
  dplyr::mutate(
  vagas_ofertadas_2021_2,
  NU_PERCENTUAL_BONUS = as.numeric(NU_PERCENTUAL_BONUS)
  )
)

## ano de 2020 ------------------------------------------------------------

sisu_vagas_ofertadas_2020 <- dplyr::bind_rows(
  dplyr::mutate(
    vagas_ofertadas_2020_1,
    PESO_REDACAO = as.numeric(PESO_REDACAO),
    PESO_LINGUAGENS = as.numeric(PESO_LINGUAGENS),
    PESO_MATEMATICA = as.numeric(PESO_MATEMATICA),
    PESO_CIENCIAS_HUMANAS = as.numeric(PESO_CIENCIAS_HUMANAS),
    PESO_CIENCIAS_NATUREZA = as.numeric(PESO_CIENCIAS_NATUREZA),
  ),
  dplyr::rename(
    vagas_ofertadas_2020_2,
    "QT_VAGAS_OFERTADAS" = "QT_VAGAS_CONCORRENCIA",
    "NOTA_MINIMA_REDACAO" = "NOTA_MI\u008dNIMA_REDACAO"
  )
)

## ano de 2019 ------------------------------------------------------------

sisu_vagas_ofertadas_2019 <- dplyr::bind_rows(
  vagas_ofertadas_2019_1,
  vagas_ofertadas_2019_2
) |>
  dplyr::rename(
    "QT_VAGAS_OFERTADAS" = "QT_VAGAS_CONCORRENCIA"
  )

## ano de 2010 a 2018 -----------------------------------------------------

sisu_vagas_ofertadas_2010_2018 <- vagas_ofertadas_2010_2018 |>
  tidyr::separate(
    col = "EDIÇÃO",
    into = c("NU_ANO", "NU_EDICAO"),
    sep = "/"
  ) |>
  dplyr::mutate(
    NU_ANO = as.numeric(NU_ANO),
    NU_EDICAO = as.numeric(NU_EDICAO)
  ) |>
  dplyr::rename(
    "CO_IES" = "CÓD. IES",
    "NO_IES" = "NOME IES",
    "SG_IES" = "SIGLA IES",
    "DS_ORGANIZACAO_ACADEMICA" = "ORGANIZAÇÃO ACADÊMICA",
    "DS_CATEGORIA_ADM" = "CATEGORIA ADMINISTRATIVA",
    "NO_CAMPUS" = "CAMPUS",
    "NO_MUNICIPIO_CAMPUS" = "MUNICÍPIO CAMPUS",
    "SG_UF_CAMPUS" = "SIGLA UF CAMPUS",
    "DS_REGIAO" = "REGIÃO CAMPUS",
    "CO_IES_CURSO" = "CÓD CURSO",
    "NO_CURSO" = "NOME CURSO",
    "DS_GRAU" = "GRAU",
    "DS_TURNO" = "TURNO",
    "QT_VAGAS_OFERTADAS" = "QT. VAGAS",
    "NU_PERCENTUAL_BONUS" = "PERCENTUAL DE BÔNUS",
    "TP_MODALIDADE" = "TIPO MODALIDADE",
    "DS_MOD_CONCORRENCIA" = "MODALIDADE CONCORRÊNCIA"
  )

# união das bases de vagas ofertadas sisu (2010 a 2022) em uma só ---------

sisu_vagas_ofertadas <- dplyr::bind_rows(
  sisu_vagas_ofertadas_2010_2018,
  sisu_vagas_ofertadas_2019,
  sisu_vagas_ofertadas_2020,
  sisu_vagas_ofertadas_2021,
  sisu_vagas_ofertadas_2022,
) |>
  dplyr::mutate(
    NU_ANO = as.integer(NU_ANO),
    NU_EDICAO = as.character(NU_EDICAO),
    CO_IES = as.character(CO_IES),
    CO_IES_CURSO = as.character(CO_IES_CURSO)
  ) |>
  janitor::clean_names()

# salvando a base em formato RDS ------------------------------------------

readr::write_rds(
  cursos_ies,
  here::here("dados", "dados_tratados", "rds", "cursos_ies.rds"),
  compress = "gz"
)

readr::write_rds(
  cursos_ies_publicas_presenciais,
  here::here("dados", "dados_tratados", "rds", "cursos_ies_publicas_presenciais.rds"),
  compress = "gz"
)

readr::write_rds(
  sisu,
  here::here("dados", "dados_tratados", "rds", "sisu.rds"),
  compress = "gz"
)

readr::write_rds(
  sisu_cursos,
  here::here("dados", "dados_tratados", "rds", "sisu_cursos.rds"),
  compress = "gz"
)

readr::write_rds(
  sisu_vagas_ofertadas,
  here::here("dados", "dados_tratados", "rds", "sisu_vagas_ofertadas.rds"),
  compress = "gz"
)


# salvando a base em formato CSV ------------------------------------------

write.csv(
  cursos_ies,
  here::here("dados", "dados_tratados", "csv", "cursos_ies.csv"),
  fileEncoding = "UTF-8"
)

write.csv(
  cursos_ies_publicas_presenciais,
  here::here("dados", "dados_tratados", "csv", "cursos_ies_publicas_presenciais.csv"),
  fileEncoding = "UTF-8"
)

write.csv(
  sisu,
  here::here("dados", "dados_tratados", "csv", "sisu.csv"),
  fileEncoding = "UTF-8"
)

write.csv(
  sisu_cursos,
  here::here("dados", "dados_tratados", "csv", "sisu_cursos.csv"),
  fileEncoding = "UTF-8"
)

write.csv(
  sisu_vagas_ofertadas,
  here::here("dados", "dados_tratados", "csv", "sisu_vagas_ofertadas.csv"),
  fileEncoding = "UTF-8"
)
