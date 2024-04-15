

# importação dos dados brutos ---------------------------------------------


# censo do ensino superior ------------------------------------------------

censo_ensino_superior <- list.files(
  here::here("dados", "dados_brutos", "rds", "censo_ensino_superior"),
  full.names = TRUE,
  pattern = ".rds"
) |> 
  purrr:::map(
    ~ readr::read_rds(.x)
  )
  
# cursos_2005 <- censo_ensino_superior[[1]]
# cursos_2006 <- censo_ensino_superior[[2]]
# cursos_2007 <- censo_ensino_superior[[3]]
# cursos_2008 <- censo_ensino_superior[[4]]
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
# ies_2005 <- censo_ensino_superior[[19]]
# # ies_2006 <- censo_ensino_superior[[20]]
# ies_2007 <- censo_ensino_superior[[21]]
# ies_2008 <- censo_ensino_superior[[22]]
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



# chamada regular do sisu -------------------------------------------------

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



# vagas ofertadas do sisu -------------------------------------------------

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
# vagas_ofertadas_2023_1 <- vagas_ofertadas_sisu[[10]]
# vagas_ofertadas_2023_2 <- vagas_ofertadas_sisu[[11]]



# organização e união dos dados brutos ------------------------------------
# (censo do ensino superior) em uma tabela --------------------------------

# AS IDENTIFICAÇÕES DAS IES MUDAM DE UM ANO PARA O OUTRO
# POR EXEMPLO, O CÓDIGO DE IDENTIFICAÇÃO DA UFSM (582) CORRESPONDE
# A UMA UNIVERSIDADE LOCALIZADA EM LAURO DE FREITAS (BA) EM 2007, 
# A UMA UNIVERSIDADE LOCALIZADA EM GOIANIA (GO) EM 2006 E A UMA
# UNIVERSIDADE LOCALIZADA EM CAMPO GRANDE (MS) EM 2005.


# anos de 2009 a 2021 -----------------------------------------------------

# cursos_ies_2009_2021 <- dplyr::left_join(
#   cursos_2009_2021,
#   ies_2009_2021,
#   by = c(
#     "ano" = "ano",
#     "sigla_uf" = "sigla_uf",
#     "id_municipio" = "id_municipio",
#     "id_ies" = "id_ies",
#     "tipo_organizacao_academica" = "tipo_organizacao_academica"
#   )
# ) |> 
#   dplyr::select(
#     c(
#       ano, sigla_uf, id_municipio, tipo_modalidade_ensino,
#       tipo_categoria_administrativa, rede, id_ies, nome_curso, id_curso,
#       nome_area_geral, id_area_geral, nome_area_especifica, id_area_especifica, 
#       nome_area_detalhada, id_area_detalhada, nome, sigla,
#       quantidade_ingressantes, quantidade_ingressantes_feminino,
#       quantidade_ingressantes_masculino, quantidade_ingressantes_diurno,
#       quantidade_ingressantes_noturno, quantidade_ingressantes_vestibular,
#       quantidade_ingressantes_enem, quantidade_ingressantes_avaliacao_seriada,
#       quantidade_ingressantes_0_17, quantidade_ingressantes_18_24,
#       quantidade_ingressantes_25_29, quantidade_ingressantes_30_34,
#       quantidade_ingressantes_35_39, quantidade_ingressantes_40_49,
#       quantidade_ingressantes_50_59, quantidade_ingressantes_60_mais,
#       quantidade_ingressantes_branca, quantidade_ingressantes_preta,
#       quantidade_ingressantes_parda, quantidade_ingressantes_amarela,
#       quantidade_ingressantes_indigena, quantidade_ingressantes_cor_nao_declarada,
#       quantidade_ingressantes_brasileiro, quantidade_ingressantes_estrangeiro,
#       quantidade_ingressantes_deficiencia, quantidade_concluintes, 
#       quantidade_concluintes_feminino, quantidade_concluintes_masculino,
#       quantidade_concluintes_diurno, quantidade_concluintes_noturno,
#       quantidade_concluintes_0_17, quantidade_concluintes_18_24,
#       quantidade_concluintes_25_29, quantidade_concluintes_30_34,
#       quantidade_concluintes_35_39, quantidade_concluintes_40_49,
#       quantidade_concluintes_50_59, quantidade_concluintes_60_mais,
#       quantidade_concluintes_branca, quantidade_concluintes_preta,
#       quantidade_concluintes_parda, quantidade_concluintes_amarela,
#       quantidade_concluintes_indigena, quantidade_concluintes_cor_nao_declarada,
#       quantidade_concluintes_brasileiro, quantidade_concluintes_estrangeiro,
#       quantidade_concluintes_deficiencia
#     )
#   )# |> 
#   # tidyr::drop_na(nome, sigla)



# ano de 2022 -------------------------------------------------------------

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
#   dplyr::select(
#     c(
#       NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
#       TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
#       NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
#       CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
#       NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
#       QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
#       QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
#       QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
#       QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
#       QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
#       QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
#       QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
#       QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
#       QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
#       QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
#       DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
#       NO_BAIRRO_IES, NU_CEP_IES
#     )
#   ) |> 
#   # renomeia as colunas
#   dplyr::rename(
#     "ano" = "NU_ANO_CENSO",                                                                   
#     "sigla_uf" = "SG_UF_IES",
#     "id_municipio" = "CO_MUNICIPIO_IES",
#     "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
#     # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
#     "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
#     "rede" = "TP_REDE",
#     "id_ies" = "CO_IES",
#     "nome_curso" = "NO_CURSO",
#     "id_curso" = "CO_CURSO",    
#     "nome_area_geral" = "NO_CINE_AREA_GERAL",
#     "id_area_geral" = "CO_CINE_AREA_GERAL",
#     "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
#     "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
#     "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
#     "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
#     "nome" = "NO_IES",                                                                  
#     "sigla" = "SG_IES",
#     "quantidade_ingressantes" = "QT_ING",
#     "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
#     "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
#     "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
#     "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
#     "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
#     "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
#     "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
#     "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
#     "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
#     "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
#     "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
#     "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
#     "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
#     "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
#     "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
#     "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
#     "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
#     "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
#     "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
#     "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
#     "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
#     "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
#     "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
#     "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
#     "quantidade_concluintes" = "QT_CONC",                                                
#     "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
#     "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
#     "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
#     "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
#     "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
#     "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
#     "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
#     "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
#     "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
#     "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
#     "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
#     "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
#     "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
#     "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
#     "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
#     "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
#     "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
#     "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
#     "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
#     "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
#     "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
#     "endereco" = "DS_ENDERECO_IES",
#     "numero" = "DS_NUMERO_ENDERECO_IES",
#     "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
#     "bairro" = "NO_BAIRRO_IES",
#     "cep" = "NU_CEP_IES"
#   ) |> 
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA)
  )


# ano de 2021 -------------------------------------------------------------

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
  # dplyr::select(
  #   c(
  #     NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
  #     TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
  #     NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
  #     CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
  #     NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
  #     QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
  #     QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
  #     QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
  #     QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
  #     QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
  #     QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
  #     QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
  #     QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
  #     QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
  #     QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
  #     DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
  #     NO_BAIRRO_IES, NU_CEP_IES
  #   )
  # ) |> 
  # # renomeia as colunas
  # dplyr::rename(
  #   "ano" = "NU_ANO_CENSO",                                                                   
  #   "sigla_uf" = "SG_UF_IES",
  #   "id_municipio" = "CO_MUNICIPIO_IES",
  #   "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
  #   # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
  #   "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
  #   "rede" = "TP_REDE",
  #   "id_ies" = "CO_IES",
  #   "nome_curso" = "NO_CURSO",
  #   "id_curso" = "CO_CURSO",    
  #   "nome_area_geral" = "NO_CINE_AREA_GERAL",
  #   "id_area_geral" = "CO_CINE_AREA_GERAL",
  #   "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
  #   "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
  #   "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
  #   "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
  #   "nome" = "NO_IES",                                                                  
  #   "sigla" = "SG_IES",
  #   "quantidade_ingressantes" = "QT_ING",
  #   "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
  #   "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
  #   "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
  #   "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
  #   "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
  #   "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
  #   "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
  #   "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
  #   "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
  #   "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
  #   "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
  #   "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
  #   "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
  #   "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
  #   "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
  #   "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
  #   "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
  #   "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
  #   "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
  #   "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
  #   "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
  #   "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
  #   "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
  #   "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
  #   "quantidade_concluintes" = "QT_CONC",                                                
  #   "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
  #   "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
  #   "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
  #   "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
  #   "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
  #   "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
  #   "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
  #   "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
  #   "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
  #   "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
  #   "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
  #   "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
  #   "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
  #   "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
  #   "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
  #   "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
  #   "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
  #   "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
  #   "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
  #   "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
  #   "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
  #   "endereco" = "DS_ENDERECO_IES",
  #   "numero" = "DS_NUMERO_ENDERECO_IES",
  #   "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
  #   "bairro" = "NO_BAIRRO_IES",
  #   "cep" = "NU_CEP_IES"
  # ) |> 
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA)
  )


# ano de 2020 -------------------------------------------------------------

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
  # dplyr::select(
  #   c(
  #     NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
  #     TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
  #     NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
  #     CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
  #     NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
  #     QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
  #     QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
  #     QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
  #     QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
  #     QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
  #     QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
  #     QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
  #     QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
  #     QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
  #     QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
  #     DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
  #     NO_BAIRRO_IES, NU_CEP_IES
  #   )
  # ) |> 
  # # renomeia as colunas
  # dplyr::rename(
  #   "ano" = "NU_ANO_CENSO",                                                                   
  #   "sigla_uf" = "SG_UF_IES",
  #   "id_municipio" = "CO_MUNICIPIO_IES",
  #   "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
  #   # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
  #   "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
  #   "rede" = "TP_REDE",
  #   "id_ies" = "CO_IES",
  #   "nome_curso" = "NO_CURSO",
  #   "id_curso" = "CO_CURSO",    
  #   "nome_area_geral" = "NO_CINE_AREA_GERAL",
  #   "id_area_geral" = "CO_CINE_AREA_GERAL",
  #   "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
  #   "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
  #   "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
  #   "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
  #   "nome" = "NO_IES",                                                                  
  #   "sigla" = "SG_IES",
  #   "quantidade_ingressantes" = "QT_ING",
  #   "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
  #   "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
  #   "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
  #   "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
  #   "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
  #   "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
  #   "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
  #   "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
  #   "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
  #   "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
  #   "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
  #   "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
  #   "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
  #   "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
  #   "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
  #   "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
  #   "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
  #   "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
  #   "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
  #   "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
  #   "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
  #   "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
  #   "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
  #   "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
  #   "quantidade_concluintes" = "QT_CONC",                                                
  #   "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
  #   "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
  #   "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
  #   "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
  #   "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
  #   "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
  #   "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
  #   "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
  #   "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
  #   "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
  #   "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
  #   "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
  #   "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
  #   "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
  #   "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
  #   "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
  #   "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
  #   "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
  #   "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
  #   "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
  #   "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
  #   "endereco" = "DS_ENDERECO_IES",
  #   "numero" = "DS_NUMERO_ENDERECO_IES",
  #   "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
  #   "bairro" = "NO_BAIRRO_IES",
  #   "cep" = "NU_CEP_IES"
  # ) |> 
  dplyr::rename(
    "CO_CINE_ROTULO" = "CO_CINE_ROTULO2"
  ) |> 
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )


# ano de 2019 -------------------------------------------------------------

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
  # dplyr::select(
  #   c(
  #     NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
  #     TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
  #     NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
  #     CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
  #     NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
  #     QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
  #     QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
  #     QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
  #     QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
  #     QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
  #     QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
  #     QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
  #     QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
  #     QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
  #     QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
  #     DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
  #     NO_BAIRRO_IES, NU_CEP_IES
  #   )
  # ) |> 
  # # renomeia as colunas
  # dplyr::rename(
  #   "ano" = "NU_ANO_CENSO",                                                                   
  #   "sigla_uf" = "SG_UF_IES",
  #   "id_municipio" = "CO_MUNICIPIO_IES",
  #   "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
  #   # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
  #   "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
  #   "rede" = "TP_REDE",
  #   "id_ies" = "CO_IES",
  #   "nome_curso" = "NO_CURSO",
  #   "id_curso" = "CO_CURSO",    
  #   "nome_area_geral" = "NO_CINE_AREA_GERAL",
  #   "id_area_geral" = "CO_CINE_AREA_GERAL",
  #   "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
  #   "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
  #   "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
  #   "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
  #   "nome" = "NO_IES",                                                                  
  #   "sigla" = "SG_IES",
  #   "quantidade_ingressantes" = "QT_ING",
  #   "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
  #   "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
  #   "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
  #   "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
  #   "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
  #   "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
  #   "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
  #   "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
  #   "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
  #   "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
  #   "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
  #   "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
  #   "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
  #   "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
  #   "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
  #   "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
  #   "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
  #   "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
  #   "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
  #   "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
  #   "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
  #   "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
  #   "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
  #   "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
  #   "quantidade_concluintes" = "QT_CONC",                                                
  #   "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
  #   "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
  #   "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
  #   "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
  #   "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
  #   "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
  #   "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
  #   "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
  #   "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
  #   "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
  #   "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
  #   "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
  #   "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
  #   "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
  #   "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
  #   "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
  #   "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
  #   "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
  #   "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
  #   "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
  #   "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
  #   "endereco" = "DS_ENDERECO_IES",
  #   "numero" = "DS_NUMERO_ENDERECO_IES",
  #   "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
  #   "bairro" = "NO_BAIRRO_IES",
  #   "cep" = "NU_CEP_IES"
  # ) |> 
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
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
  # dplyr::select(
  #   c(
  #     NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
  #     TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
  #     NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
  #     CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
  #     NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
  #     QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
  #     QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
  #     QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
  #     QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
  #     QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
  #     QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
  #     QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
  #     QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
  #     QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
  #     QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
  #     DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
  #     NO_BAIRRO_IES, NU_CEP_IES
  #   )
  # ) |> 
  # # renomeia as colunas
  # dplyr::rename(
  #   "ano" = "NU_ANO_CENSO",                                                                   
  #   "sigla_uf" = "SG_UF_IES",
  #   "id_municipio" = "CO_MUNICIPIO_IES",
  #   "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
  #   # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
  #   "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
  #   "rede" = "TP_REDE",
  #   "id_ies" = "CO_IES",
  #   "nome_curso" = "NO_CURSO",
  #   "id_curso" = "CO_CURSO",    
  #   "nome_area_geral" = "NO_CINE_AREA_GERAL",
  #   "id_area_geral" = "CO_CINE_AREA_GERAL",
  #   "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
  #   "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
  #   "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
  #   "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
  #   "nome" = "NO_IES",                                                                  
  #   "sigla" = "SG_IES",
  #   "quantidade_ingressantes" = "QT_ING",
  #   "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
  #   "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
  #   "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
  #   "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
  #   "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
  #   "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
  #   "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
  #   "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
  #   "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
  #   "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
  #   "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
  #   "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
  #   "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
  #   "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
  #   "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
  #   "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
  #   "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
  #   "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
  #   "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
  #   "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
  #   "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
  #   "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
  #   "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
  #   "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
  #   "quantidade_concluintes" = "QT_CONC",                                                
  #   "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
  #   "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
  #   "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
  #   "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
  #   "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
  #   "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
  #   "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
  #   "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
  #   "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
  #   "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
  #   "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
  #   "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
  #   "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
  #   "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
  #   "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
  #   "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
  #   "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
  #   "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
  #   "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
  #   "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
  #   "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
  #   "endereco" = "DS_ENDERECO_IES",
  #   "numero" = "DS_NUMERO_ENDERECO_IES",
  #   "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
  #   "bairro" = "NO_BAIRRO_IES",
  #   "cep" = "NU_CEP_IES"
  # ) |> 
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
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
  # dplyr::select(
  #   c(
  #     NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
  #     TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
  #     NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
  #     CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
  #     NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
  #     QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
  #     QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
  #     QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
  #     QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
  #     QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
  #     QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
  #     QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
  #     QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
  #     QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
  #     QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
  #     DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
  #     NO_BAIRRO_IES, NU_CEP_IES
  #   )
  # ) |> 
  # # renomeia as colunas
  # dplyr::rename(
  #   "ano" = "NU_ANO_CENSO",                                                                   
  #   "sigla_uf" = "SG_UF_IES",
  #   "id_municipio" = "CO_MUNICIPIO_IES",
  #   "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
  #   # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
  #   "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
  #   "rede" = "TP_REDE",
  #   "id_ies" = "CO_IES",
  #   "nome_curso" = "NO_CURSO",
  #   "id_curso" = "CO_CURSO",    
  #   "nome_area_geral" = "NO_CINE_AREA_GERAL",
  #   "id_area_geral" = "CO_CINE_AREA_GERAL",
  #   "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
  #   "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
  #   "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
  #   "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
  #   "nome" = "NO_IES",                                                                  
  #   "sigla" = "SG_IES",
  #   "quantidade_ingressantes" = "QT_ING",
  #   "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
  #   "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
  #   "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
  #   "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
  #   "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
  #   "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
  #   "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
  #   "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
  #   "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
  #   "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
  #   "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
  #   "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
  #   "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
  #   "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
  #   "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
  #   "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
  #   "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
  #   "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
  #   "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
  #   "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
  #   "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
  #   "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
  #   "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
  #   "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
  #   "quantidade_concluintes" = "QT_CONC",                                                
  #   "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
  #   "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
  #   "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
  #   "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
  #   "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
  #   "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
  #   "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
  #   "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
  #   "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
  #   "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
  #   "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
  #   "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
  #   "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
  #   "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
  #   "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
  #   "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
  #   "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
  #   "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
  #   "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
  #   "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
  #   "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
  #   "endereco" = "DS_ENDERECO_IES",
  #   "numero" = "DS_NUMERO_ENDERECO_IES",
  #   "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
  #   "bairro" = "NO_BAIRRO_IES",
  #   "cep" = "NU_CEP_IES"
  # ) |> 
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
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
  # dplyr::select(
  #   c(
  #     NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
  #     TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
  #     NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
  #     CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
  #     NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
  #     QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
  #     QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
  #     QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
  #     QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
  #     QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
  #     QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
  #     QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
  #     QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
  #     QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
  #     QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
  #     DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
  #     NO_BAIRRO_IES, NU_CEP_IES
  #   )
  # ) |> 
  # # renomeia as colunas
  # dplyr::rename(
  #   "ano" = "NU_ANO_CENSO",                                                                   
  #   "sigla_uf" = "SG_UF_IES",
  #   "id_municipio" = "CO_MUNICIPIO_IES",
  #   "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
  #   # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
  #   "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
  #   "rede" = "TP_REDE",
  #   "id_ies" = "CO_IES",
  #   "nome_curso" = "NO_CURSO",
  #   "id_curso" = "CO_CURSO",    
  #   "nome_area_geral" = "NO_CINE_AREA_GERAL",
  #   "id_area_geral" = "CO_CINE_AREA_GERAL",
  #   "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
  #   "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
  #   "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
  #   "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
  #   "nome" = "NO_IES",                                                                  
  #   "sigla" = "SG_IES",
  #   "quantidade_ingressantes" = "QT_ING",
  #   "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
  #   "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
  #   "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
  #   "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
  #   "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
  #   "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
  #   "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
  #   "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
  #   "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
  #   "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
  #   "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
  #   "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
  #   "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
  #   "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
  #   "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
  #   "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
  #   "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
  #   "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
  #   "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
  #   "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
  #   "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
  #   "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
  #   "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
  #   "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
  #   "quantidade_concluintes" = "QT_CONC",                                                
  #   "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
  #   "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
  #   "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
  #   "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
  #   "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
  #   "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
  #   "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
  #   "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
  #   "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
  #   "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
  #   "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
  #   "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
  #   "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
  #   "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
  #   "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
  #   "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
  #   "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
  #   "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
  #   "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
  #   "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
  #   "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
  #   "endereco" = "DS_ENDERECO_IES",
  #   "numero" = "DS_NUMERO_ENDERECO_IES",
  #   "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
  #   "bairro" = "NO_BAIRRO_IES",
  #   "cep" = "NU_CEP_IES"
  # ) |> 
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
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
  # dplyr::select(
  #   c(
  #     NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
  #     TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
  #     NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
  #     CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
  #     NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
  #     QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
  #     QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
  #     QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
  #     QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
  #     QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
  #     QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
  #     QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
  #     QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
  #     QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
  #     QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
  #     DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
  #     NO_BAIRRO_IES, NU_CEP_IES
  #   )
  # ) |> 
  # # renomeia as colunas
  # dplyr::rename(
  #   "ano" = "NU_ANO_CENSO",                                                                   
  #   "sigla_uf" = "SG_UF_IES",
  #   "id_municipio" = "CO_MUNICIPIO_IES",
  #   "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
  #   # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
  #   "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
  #   "rede" = "TP_REDE",
  #   "id_ies" = "CO_IES",
  #   "nome_curso" = "NO_CURSO",
  #   "id_curso" = "CO_CURSO",    
  #   "nome_area_geral" = "NO_CINE_AREA_GERAL",
  #   "id_area_geral" = "CO_CINE_AREA_GERAL",
  #   "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
  #   "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
  #   "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
  #   "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
  #   "nome" = "NO_IES",                                                                  
  #   "sigla" = "SG_IES",
  #   "quantidade_ingressantes" = "QT_ING",
  #   "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
  #   "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
  #   "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
  #   "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
  #   "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
  #   "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
  #   "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
  #   "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
  #   "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
  #   "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
  #   "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
  #   "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
  #   "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
  #   "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
  #   "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
  #   "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
  #   "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
  #   "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
  #   "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
  #   "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
  #   "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
  #   "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
  #   "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
  #   "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
  #   "quantidade_concluintes" = "QT_CONC",                                                
  #   "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
  #   "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
  #   "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
  #   "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
  #   "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
  #   "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
  #   "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
  #   "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
  #   "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
  #   "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
  #   "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
  #   "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
  #   "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
  #   "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
  #   "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
  #   "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
  #   "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
  #   "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
  #   "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
  #   "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
  #   "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
  #   "endereco" = "DS_ENDERECO_IES",
  #   "numero" = "DS_NUMERO_ENDERECO_IES",
  #   "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
  #   "bairro" = "NO_BAIRRO_IES",
  #   "cep" = "NU_CEP_IES"
  # ) |> 
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
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
  # dplyr::select(
  #   c(
  #     NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
  #     TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
  #     NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
  #     CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
  #     NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
  #     QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
  #     QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
  #     QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
  #     QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
  #     QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
  #     QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
  #     QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
  #     QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
  #     QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
  #     QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
  #     DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
  #     NO_BAIRRO_IES, NU_CEP_IES
  #   )
  # ) |> 
  # # renomeia as colunas
  # dplyr::rename(
  #   "ano" = "NU_ANO_CENSO",                                                                   
  #   "sigla_uf" = "SG_UF_IES",
  #   "id_municipio" = "CO_MUNICIPIO_IES",
  #   "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
  #   # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
  #   "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
  #   "rede" = "TP_REDE",
  #   "id_ies" = "CO_IES",
  #   "nome_curso" = "NO_CURSO",
  #   "id_curso" = "CO_CURSO",    
  #   "nome_area_geral" = "NO_CINE_AREA_GERAL",
  #   "id_area_geral" = "CO_CINE_AREA_GERAL",
  #   "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
  #   "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
  #   "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
  #   "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
  #   "nome" = "NO_IES",                                                                  
  #   "sigla" = "SG_IES",
  #   "quantidade_ingressantes" = "QT_ING",
  #   "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
  #   "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
  #   "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
  #   "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
  #   "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
  #   "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
  #   "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
  #   "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
  #   "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
  #   "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
  #   "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
  #   "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
  #   "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
  #   "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
  #   "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
  #   "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
  #   "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
  #   "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
  #   "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
  #   "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
  #   "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
  #   "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
  #   "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
  #   "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
  #   "quantidade_concluintes" = "QT_CONC",                                                
  #   "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
  #   "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
  #   "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
  #   "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
  #   "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
  #   "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
  #   "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
  #   "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
  #   "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
  #   "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
  #   "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
  #   "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
  #   "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
  #   "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
  #   "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
  #   "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
  #   "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
  #   "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
  #   "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
  #   "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
  #   "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
  #   "endereco" = "DS_ENDERECO_IES",
  #   "numero" = "DS_NUMERO_ENDERECO_IES",
  #   "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
  #   "bairro" = "NO_BAIRRO_IES",
  #   "cep" = "NU_CEP_IES"
  # ) |> 
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
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
  # dplyr::select(
  #   c(
  #     NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
  #     TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
  #     NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
  #     CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
  #     NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
  #     QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
  #     QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
  #     QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
  #     QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
  #     QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
  #     QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
  #     QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
  #     QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
  #     QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
  #     QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
  #     DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
  #     NO_BAIRRO_IES, NU_CEP_IES
  #   )
  # ) |> 
  # # renomeia as colunas
  # dplyr::rename(
  #   "ano" = "NU_ANO_CENSO",                                                                   
  #   "sigla_uf" = "SG_UF_IES",
  #   "id_municipio" = "CO_MUNICIPIO_IES",
  #   "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
  #   # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
  #   "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
  #   "rede" = "TP_REDE",
  #   "id_ies" = "CO_IES",
  #   "nome_curso" = "NO_CURSO",
  #   "id_curso" = "CO_CURSO",    
  #   "nome_area_geral" = "NO_CINE_AREA_GERAL",
  #   "id_area_geral" = "CO_CINE_AREA_GERAL",
  #   "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
  #   "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
  #   "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
  #   "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
  #   "nome" = "NO_IES",                                                                  
  #   "sigla" = "SG_IES",
  #   "quantidade_ingressantes" = "QT_ING",
  #   "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
  #   "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
  #   "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
  #   "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
  #   "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
  #   "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
  #   "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
  #   "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
  #   "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
  #   "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
  #   "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
  #   "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
  #   "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
  #   "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
  #   "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
  #   "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
  #   "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
  #   "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
  #   "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
  #   "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
  #   "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
  #   "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
  #   "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
  #   "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
  #   "quantidade_concluintes" = "QT_CONC",                                                
  #   "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
  #   "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
  #   "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
  #   "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
  #   "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
  #   "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
  #   "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
  #   "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
  #   "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
  #   "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
  #   "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
  #   "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
  #   "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
  #   "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
  #   "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
  #   "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
  #   "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
  #   "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
  #   "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
  #   "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
  #   "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
  #   "endereco" = "DS_ENDERECO_IES",
  #   "numero" = "DS_NUMERO_ENDERECO_IES",
  #   "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
  #   "bairro" = "NO_BAIRRO_IES",
  #   "cep" = "NU_CEP_IES"
  # ) |> 
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
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
  # dplyr::select(
  #   c(
  #     NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
  #     TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
  #     NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
  #     CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
  #     NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
  #     QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
  #     QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
  #     QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
  #     QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
  #     QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
  #     QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
  #     QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
  #     QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
  #     QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
  #     QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
  #     DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
  #     NO_BAIRRO_IES, NU_CEP_IES
  #   )
  # ) |> 
  # # renomeia as colunas
  # dplyr::rename(
  #   "ano" = "NU_ANO_CENSO",                                                                   
  #   "sigla_uf" = "SG_UF_IES",
  #   "id_municipio" = "CO_MUNICIPIO_IES",
  #   "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
  #   # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
  #   "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
  #   "rede" = "TP_REDE",
  #   "id_ies" = "CO_IES",
  #   "nome_curso" = "NO_CURSO",
  #   "id_curso" = "CO_CURSO",    
  #   "nome_area_geral" = "NO_CINE_AREA_GERAL",
  #   "id_area_geral" = "CO_CINE_AREA_GERAL",
  #   "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
  #   "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
  #   "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
  #   "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
  #   "nome" = "NO_IES",                                                                  
  #   "sigla" = "SG_IES",
  #   "quantidade_ingressantes" = "QT_ING",
  #   "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
  #   "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
  #   "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
  #   "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
  #   "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
  #   "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
  #   "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
  #   "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
  #   "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
  #   "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
  #   "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
  #   "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
  #   "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
  #   "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
  #   "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
  #   "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
  #   "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
  #   "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
  #   "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
  #   "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
  #   "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
  #   "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
  #   "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
  #   "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
  #   "quantidade_concluintes" = "QT_CONC",                                                
  #   "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
  #   "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
  #   "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
  #   "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
  #   "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
  #   "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
  #   "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
  #   "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
  #   "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
  #   "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
  #   "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
  #   "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
  #   "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
  #   "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
  #   "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
  #   "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
  #   "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
  #   "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
  #   "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
  #   "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
  #   "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
  #   "endereco" = "DS_ENDERECO_IES",
  #   "numero" = "DS_NUMERO_ENDERECO_IES",
  #   "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
  #   "bairro" = "NO_BAIRRO_IES",
  #   "cep" = "NU_CEP_IES"
  # ) |> 
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
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
  # dplyr::select(
  #   c(
  #     NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
  #     TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
  #     NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
  #     CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
  #     NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
  #     QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
  #     QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
  #     QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
  #     QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
  #     QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
  #     QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
  #     QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
  #     QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
  #     QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
  #     QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
  #     DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
  #     NO_BAIRRO_IES, NU_CEP_IES
  #   )
  # ) |> 
  # # renomeia as colunas
  # dplyr::rename(
  #   "ano" = "NU_ANO_CENSO",                                                                   
  #   "sigla_uf" = "SG_UF_IES",
  #   "id_municipio" = "CO_MUNICIPIO_IES",
  #   "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
  #   # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
  #   "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
  #   "rede" = "TP_REDE",
  #   "id_ies" = "CO_IES",
  #   "nome_curso" = "NO_CURSO",
  #   "id_curso" = "CO_CURSO",    
  #   "nome_area_geral" = "NO_CINE_AREA_GERAL",
  #   "id_area_geral" = "CO_CINE_AREA_GERAL",
  #   "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
  #   "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
  #   "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
  #   "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
  #   "nome" = "NO_IES",                                                                  
  #   "sigla" = "SG_IES",
  #   "quantidade_ingressantes" = "QT_ING",
  #   "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
  #   "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
  #   "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
  #   "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
  #   "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
  #   "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
  #   "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
  #   "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
  #   "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
  #   "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
  #   "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
  #   "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
  #   "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
  #   "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
  #   "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
  #   "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
  #   "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
  #   "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
  #   "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
  #   "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
  #   "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
  #   "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
  #   "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
  #   "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
  #   "quantidade_concluintes" = "QT_CONC",                                                
  #   "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
  #   "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
  #   "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
  #   "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
  #   "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
  #   "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
  #   "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
  #   "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
  #   "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
  #   "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
  #   "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
  #   "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
  #   "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
  #   "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
  #   "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
  #   "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
  #   "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
  #   "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
  #   "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
  #   "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
  #   "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
  #   "endereco" = "DS_ENDERECO_IES",
  #   "numero" = "DS_NUMERO_ENDERECO_IES",
  #   "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
  #   "bairro" = "NO_BAIRRO_IES",
  #   "cep" = "NU_CEP_IES"
  # ) |> 
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
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
  # dplyr::select(
  #   c(
  #     NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
  #     TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
  #     NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
  #     CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
  #     NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
  #     QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
  #     QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
  #     QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
  #     QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
  #     QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
  #     QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
  #     QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
  #     QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
  #     QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
  #     QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
  #     DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
  #     NO_BAIRRO_IES, NU_CEP_IES
  #   )
  # ) |> 
  # # renomeia as colunas
  # dplyr::rename(
  #   "ano" = "NU_ANO_CENSO",                                                                   
  #   "sigla_uf" = "SG_UF_IES",
  #   "id_municipio" = "CO_MUNICIPIO_IES",
  #   "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
  #   # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
  #   "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
  #   "rede" = "TP_REDE",
  #   "id_ies" = "CO_IES",
  #   "nome_curso" = "NO_CURSO",
  #   "id_curso" = "CO_CURSO",    
  #   "nome_area_geral" = "NO_CINE_AREA_GERAL",
  #   "id_area_geral" = "CO_CINE_AREA_GERAL",
  #   "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
  #   "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
  #   "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
  #   "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
  #   "nome" = "NO_IES",                                                                  
  #   "sigla" = "SG_IES",
  #   "quantidade_ingressantes" = "QT_ING",
  #   "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
  #   "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
  #   "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
  #   "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
  #   "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
  #   "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
  #   "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
  #   "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
  #   "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
  #   "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
  #   "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
  #   "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
  #   "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
  #   "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
  #   "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
  #   "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
  #   "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
  #   "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
  #   "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
  #   "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
  #   "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
  #   "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
  #   "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
  #   "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
  #   "quantidade_concluintes" = "QT_CONC",                                                
  #   "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
  #   "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
  #   "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
  #   "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
  #   "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
  #   "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
  #   "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
  #   "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
  #   "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
  #   "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
  #   "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
  #   "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
  #   "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
  #   "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
  #   "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
  #   "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
  #   "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
  #   "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
  #   "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
  #   "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
  #   "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
  #   "endereco" = "DS_ENDERECO_IES",
  #   "numero" = "DS_NUMERO_ENDERECO_IES",
  #   "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
  #   "bairro" = "NO_BAIRRO_IES",
  #   "cep" = "NU_CEP_IES"
  # ) |> 
  dplyr::mutate(
    # altera a classe de algumas variáveis
    NU_ANO_CENSO = as.integer(NU_ANO_CENSO),
    CO_MUNICIPIO = as.character(CO_MUNICIPIO),
    TP_MODALIDADE_ENSINO = as.character(TP_MODALIDADE_ENSINO),
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
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
  # dplyr::select(
  #   c(
  #     NU_ANO_CENSO, SG_UF_IES, CO_MUNICIPIO_IES, TP_MODALIDADE_ENSINO, 
  #     TP_CATEGORIA_ADMINISTRATIVA, TP_REDE, CO_IES, NO_CURSO, CO_CURSO, 
  #     NO_CINE_AREA_GERAL, CO_CINE_AREA_GERAL, NO_CINE_AREA_ESPECIFICA, 
  #     CO_CINE_AREA_ESPECIFICA, CO_CINE_AREA_DETALHADA, NO_CINE_AREA_DETALHADA,
  #     NO_IES, SG_IES, QT_ING, QT_ING_FEM, QT_ING_MASC, QT_ING_DIURNO, 
  #     QT_ING_NOTURNO, QT_ING_VESTIBULAR, QT_ING_ENEM, QT_ING_AVALIACAO_SERIADA,
  #     QT_ING_0_17, QT_ING_18_24, QT_ING_25_29, QT_ING_30_34, QT_ING_35_39,
  #     QT_ING_40_49, QT_ING_50_59, QT_ING_60_MAIS, QT_ING_BRANCA,
  #     QT_ING_PRETA, QT_ING_PARDA, QT_ING_AMARELA, QT_ING_INDIGENA,
  #     QT_ING_CORND, QT_ING_NACBRAS, QT_ING_NACESTRANG, QT_ING_DEFICIENTE,
  #     QT_CONC, QT_CONC_FEM, QT_CONC_MASC, QT_CONC_DIURNO, QT_CONC_NOTURNO,
  #     QT_CONC_0_17, QT_CONC_18_24, QT_CONC_25_29, QT_CONC_30_34, QT_CONC_35_39,
  #     QT_CONC_40_49, QT_CONC_50_59, QT_CONC_60_MAIS, QT_CONC_BRANCA,
  #     QT_CONC_PRETA, QT_CONC_PARDA, QT_CONC_AMARELA, QT_CONC_INDIGENA,
  #     QT_CONC_CORND, QT_CONC_NACBRAS, QT_CONC_NACESTRANG, QT_CONC_DEFICIENTE,
  #     DS_ENDERECO_IES, DS_NUMERO_ENDERECO_IES, DS_COMPLEMENTO_ENDERECO_IES,
  #     NO_BAIRRO_IES, NU_CEP_IES
  #   )
  # ) |> 
  # # renomeia as colunas
  # dplyr::rename(
  #   "ano" = "NU_ANO_CENSO",                                                                   
  #   "sigla_uf" = "SG_UF_IES",
  #   "id_municipio" = "CO_MUNICIPIO_IES",
  #   "tipo_modalidade_ensino" = "TP_MODALIDADE_ENSINO",                                                        
  #   # "tipo_organizacao_academica" = "TP_ORGANIZACAO_ACADEMICA",
  #   "tipo_categoria_administrativa" = "TP_CATEGORIA_ADMINISTRATIVA",
  #   "rede" = "TP_REDE",
  #   "id_ies" = "CO_IES",
  #   "nome_curso" = "NO_CURSO",
  #   "id_curso" = "CO_CURSO",    
  #   "nome_area_geral" = "NO_CINE_AREA_GERAL",
  #   "id_area_geral" = "CO_CINE_AREA_GERAL",
  #   "nome_area_especifica" = "NO_CINE_AREA_ESPECIFICA", 
  #   "id_area_especifica" = "CO_CINE_AREA_ESPECIFICA",
  #   "id_area_detalhada" = "CO_CINE_AREA_DETALHADA",
  #   "nome_area_detalhada" = "NO_CINE_AREA_DETALHADA",
  #   "nome" = "NO_IES",                                                                  
  #   "sigla" = "SG_IES",
  #   "quantidade_ingressantes" = "QT_ING",
  #   "quantidade_ingressantes_feminino" = "QT_ING_FEM",                                      
  #   "quantidade_ingressantes_masculino" = "QT_ING_MASC",                                    
  #   "quantidade_ingressantes_diurno" = "QT_ING_DIURNO",                                        
  #   "quantidade_ingressantes_noturno" = "QT_ING_NOTURNO", 
  #   "quantidade_ingressantes_vestibular" = "QT_ING_VESTIBULAR",                                    
  #   "quantidade_ingressantes_enem" = "QT_ING_ENEM",                                        
  #   "quantidade_ingressantes_avaliacao_seriada" = "QT_ING_AVALIACAO_SERIADA",
  #   "quantidade_ingressantes_0_17" = "QT_ING_0_17",                                          
  #   "quantidade_ingressantes_18_24" = "QT_ING_18_24",                                         
  #   "quantidade_ingressantes_25_29" = "QT_ING_25_29",                                        
  #   "quantidade_ingressantes_30_34" = "QT_ING_30_34",                                         
  #   "quantidade_ingressantes_35_39" = "QT_ING_35_39",                                        
  #   "quantidade_ingressantes_40_49" = "QT_ING_40_49",                                         
  #   "quantidade_ingressantes_50_59" = "QT_ING_50_59",                                         
  #   "quantidade_ingressantes_60_mais" = "QT_ING_60_MAIS",                                       
  #   "quantidade_ingressantes_branca" = "QT_ING_BRANCA",                                        
  #   "quantidade_ingressantes_preta" = "QT_ING_PRETA",                                         
  #   "quantidade_ingressantes_parda" = "QT_ING_PARDA",                                         
  #   "quantidade_ingressantes_amarela" = "QT_ING_AMARELA",                                      
  #   "quantidade_ingressantes_indigena" = "QT_ING_INDIGENA",                                      
  #   "quantidade_ingressantes_cor_nao_declarada" = "QT_ING_CORND", 
  #   "quantidade_ingressantes_brasileiro" = "QT_ING_NACBRAS",                                    
  #   "quantidade_ingressantes_estrangeiro" = "QT_ING_NACESTRANG", 
  #   "quantidade_ingressantes_deficiencia" = "QT_ING_DEFICIENTE",  
  #   "quantidade_concluintes" = "QT_CONC",                                                
  #   "quantidade_concluintes_feminino" = "QT_CONC_FEM",                                      
  #   "quantidade_concluintes_masculino" = "QT_CONC_MASC",                                      
  #   "quantidade_concluintes_diurno" = "QT_CONC_DIURNO",                                         
  #   "quantidade_concluintes_noturno" = "QT_CONC_NOTURNO",                                        
  #   "quantidade_concluintes_0_17" = "QT_CONC_0_17",                                           
  #   "quantidade_concluintes_18_24" = "QT_CONC_18_24",                                          
  #   "quantidade_concluintes_25_29" = "QT_CONC_25_29",                                          
  #   "quantidade_concluintes_30_34" = "QT_CONC_30_34",                                          
  #   "quantidade_concluintes_35_39" = "QT_CONC_35_39",                                          
  #   "quantidade_concluintes_40_49" = "QT_CONC_40_49",                                          
  #   "quantidade_concluintes_50_59" = "QT_CONC_50_59",                                          
  #   "quantidade_concluintes_60_mais" = "QT_CONC_60_MAIS",                                        
  #   "quantidade_concluintes_branca" = "QT_CONC_BRANCA",                                         
  #   "quantidade_concluintes_preta" = "QT_CONC_PRETA",                                          
  #   "quantidade_concluintes_parda" = "QT_CONC_PARDA",                                          
  #   "quantidade_concluintes_amarela" = "QT_CONC_AMARELA",                                        
  #   "quantidade_concluintes_indigena" = "QT_CONC_INDIGENA",                                      
  #   "quantidade_concluintes_cor_nao_declarada" = "QT_CONC_CORND",                              
  #   "quantidade_concluintes_brasileiro" = "QT_CONC_NACBRAS",                                     
  #   "quantidade_concluintes_estrangeiro" = "QT_CONC_NACESTRANG",                                    
  #   "quantidade_concluintes_deficiencia" = "QT_CONC_DEFICIENTE",
  #   "endereco" = "DS_ENDERECO_IES",
  #   "numero" = "DS_NUMERO_ENDERECO_IES",
  #   "complemento" = "DS_COMPLEMENTO_ENDERECO_IES",
  #   "bairro" = "NO_BAIRRO_IES",
  #   "cep" = "NU_CEP_IES"
  # ) |> 
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
    # tipo_organizacao_academica = as.character(tipo_organizacao_academica),
    TP_CATEGORIA_ADMINISTRATIVA = as.character(TP_CATEGORIA_ADMINISTRATIVA),
    TP_REDE = as.character(TP_REDE),
    CO_IES = as.character(CO_IES),
    CO_CURSO = as.character(CO_CURSO),
    CO_CINE_AREA_GERAL = as.character(CO_CINE_AREA_GERAL),
    CO_CINE_AREA_ESPECIFICA = as.character(CO_CINE_AREA_ESPECIFICA),
    CO_CINE_AREA_DETALHADA = as.character(CO_CINE_AREA_DETALHADA),
    NU_CEP_IES = as.character(NU_CEP_IES)
  )


# ano de 2008 -------------------------------------------------------------

# INGRESSANTES

# Para encontrar quantidade de Ingressantes nos cursos de graduação presencial, 
# somar os quadros Q15, Q16, Q17, Q18 e Q19.

# Ingressantes por vestibular : Somar em cada quadro, (vestibular e vestibular mais enem). 
# Estas somas serão para o 1o e 2o semestres.

# Ingressantes outras opções : Somar em cada quadro, (Exame Nacional do ensino médio(Enem), 
# Avaliação Seriada no Ensino Médio e Outros tipos de seleção). 
# Estas somas serão para o 1o e 2o semestres.

# Ingressantes Outras Formas: Somar o quadro Q20 e Q21. 
# Estas somas serão para o 1o e 2o semestres.

# Ingressantes por Faixa etária: Somar apenas o quadro Q22.


# CONCLUINTES

# Para encontrar quantidade de alunos concluintes nos 
# cursos de graduação presencial, somar o quadro Q28.


# cursos_ies_2008_1 <- dplyr::left_join(
#   cursos_2008,
#   ies_2008,
#   by = c(
#     "ANO" = "ANO",
#     "IES" = "IES",
#     "EH_CAPITAL" = "EH_CAPITAL",
#     "COD_UF" = "COD_UF",
#     "CODMUNIC" = "CODMUNIC",
#     "CO_ORG" = "CO_ORG",
#     "CATEGADM" = "CATEGADM",
#     "REDE" = "REDE",
#     "NOME_UF" = "NOME_UF",
#     "SIGLA_UF" = "SIGLA_UF",
#     "REGIAO" = "REGIAO",
#     "NOMEORG" = "NOMEORG",
#     "CO_REDE" = "CO_REDE",
#     "CO_DEP" = "CO_DEP",
#     "NOMEDEP" = "NOMEDEP",
#     "CATADMPARTSE" = "CATADMPARTSE",
#     "CATADMCOMUN" = "CATADMCOMUN",
#     "CATADMCONFESS" = "CATADMCONFESS",
#     "CATADMFILANT" = "CATADMFILANT",
#     "NOME_MUNICIPIO" = "NOME_MUNICIPIO"
#   )
# ) |> 
#   # altera a classificação das colunas
#   dplyr::mutate_if(is.logical, as.numeric) 


# seleciona as variáveis (colunas) de interesse ---------------------------
# para o cálculo de novas variáveis ---------------------------------------

# qt_ingressantes_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C72011:C7640))
# 
# qt_ingressantes_feminino_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(
#     c(C72011, C72013, C72021, C72023, C72031, C72033, C72041, C72043,
#       C72051, C72053, C72061, C72063, C72071, C72073, C72081, C72083,
#       C72091, C72093, C72101, C72103, C73011, C73013, C73021, C73023,
#       C73031, C73033, C73041, C73043, C73051, C73053, C73061, C73063,
#       C73071, C73073, C73081, C73083, C73091, C73093, C73101, C73103, 
#       C7401, C7403, C7405, C7407, C7409, C7411, C7413, C7415, C7417,
#       C7419, C7421, C7423, C7425, C7427, C7429, C7431, C7433, C7435,
#       C7437, C7439, C7501, C7503, C7505, C7507, C7509, C7511, C7513,
#       C7515, C7517, C7519, C7521, C7523, C7525, C7527, C7529, C7531,
#       C7533, C7535, C7537, C7539, C7601, C7603, C7605, C7607, C7609,
#       C7611, C7613, C7615, C7617, C7619, C7621, C7623, C7625, C7627,
#       C7629, C7631, C7633, C7635, C7637, C7639)
#   )
# 
# qt_ingressantes_masculino_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(
#     c(C72012, C72014, C72022, C72024, C72032, C72034, C72042, C72044,
#       C72052, C72054, C72062, C72064, C72072, C72074, C72082, C72084,
#       C72092, C72094, C72102, C72104, C73012, C73014, C73022, C73024,
#       C73032, C73034, C73042, C73044, C73052, C73054, C73062, C73064,
#       C73072, C73074, C73082, C73084, C73092, C73094, C73102, C73104,
#       C7402, C7404, C7406, C7408, C7410, C7412, C7414, C7416, C7418,
#       C7420, C7422, C7424, C7426, C7428, C7430, C7432, C7434, C7436,
#       C7438, C7440, C7502, C7504, C7506, C7508, C7510, C7512, C7514,
#       C7516, C7518, C7520, C7522, C7524, C7526, C7528, C7530, C7532,
#       C7534, C7536, C7538, C7540, C7602, C7604, C7606, C7608, C7610,
#       C7612, C7614, C7616, C7618, C7620, C7622, C7624, C7626, C7628,
#       C7630, C7632, C7634, C7636, C7638, C7640)
#   )
# 
# qt_ingressantes_diurno_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(
#     c(C72011, C72012, C72021, C72022, C72031, C72032, C72041, C72042,
#       C72051, C72052, C72061, C72062, C72071, C72072, C72081, C72082,
#       C72091, C72092, C72101, C72102, C73011, C73012, C73021, C73022,
#       C73031, C73032, C73041, C73042, C73051, C73052, C73061, C73062,
#       C73071, C73072, C73081, C73082, C73091, C73092, C73101, C73102,
#       C7401, C7402, C7405, C7406, C7409, C7410, C7413, C7414, C7417, C7418,
#       C7421, C7422, C7425, C7426, C7429, C7430, C7433, C7434, C7437, C7438,
#       C7501, C7502, C7505, C7506, C7509, C7510, C7513, C7514, C7517, C7518,
#       C7521, C7522, C7525, C7526, C7529, C7530, C7533, C7534, C7537, C7538,
#       C7601, C7602, C7605, C7606, C7609, C7610, C7613, C7614, C7617, C7618,
#       C7621, C7622, C7625, C7626, C7629, C7630, C7633, C7634, C7637, C7638)
#   )
# 
# qt_ingressantes_noturno_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(
#     c(C72013, C72014, C72023, C72024, C72033, C72034, C72043, C72044,
#       C72053, C72054, C72063, C72064, C72073, C72074, C72083, C72084,
#       C72093, C72094, C72103, C72104, C73013, C73014, C73023, C73024,
#       C73033, C73034, C73043, C73044, C73053, C73054, C73063, C73064,
#       C73073, C73074, C73083, C73084, C73093, C73094, C73103, C73104,
#       C7403, C7404, C7407, C7408, C7411, C7412, C7415, C7416, C7419, C7420,
#       C7423, C7424, C7427, C7428, C7431, C7432, C7435, C7436, C7439, C7440,
#       C7503, C7504, C7507, C7508, C7511, C7512, C7515, C7516, C7519, C7520,
#       C7523, C7524, C7527, C7528, C7531, C7532, C7535, C7536, C7539, C7540,
#       C7603, C7604, C7607, C7608, C7611, C7612, C7615, C7616, C7619, C7620,
#       C7623, C7624, C7627, C7628, C7631, C7632, C7635, C7636, C7639, C7640)
#   )
# 
# qt_ingressantes_vestibular_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(
#     c(C72011:C72014, C72041:C72044, C72061:C72064, C72091:C72094,
#       C73011:C73014, C73041:C73044, C73061:C73064, C73091:C73094,
#       C7401:C7404, C7413:C7416, C7421:C7424, C7433:C7436,
#       C7501:C7504, C7513:C7516, C7521:C7524, C7533:C7536,
#       C7601:C7604, C7613:C7616, C7621:C7624, C7633:C7636)
#   )
# 
# qt_ingressantes_enem_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(
#     c(C72021:C72024, C72071:C72074, C73021:C73024, C73071:C73074, C7405:C7408, 
#       C7425:C7428, C7505:C7508, C7525:C7528, C7605:C7608, C7625:C7628)
#   )
# 
# qt_ingressantes_avaliacao_seriada_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(
#     c(C72031:C72034, C72081:C72084, C73031:C73034, C73081:C73084,
#       C7409:C7412, C7429:C7432, C7509:C7512, C7529:C7532, C7609:C7612, 
#       C7629:C7632)
#   )
# 
# qt_ingressantes_0_17_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C09011, C09012, C09121, C09122))
# 
# qt_ingressantes_18_24_2008 <- cursos_ies_2008_1 |>
#   dplyr::select(c(C09021, C09022, C09131, C09132))
# 
# qt_ingressantes_25_29_2008 <- cursos_ies_2008_1 |>
#   dplyr::select(c(C09031, C09032, C09141, C09142))
# 
# qt_ingressantes_30_34_2008 <- cursos_ies_2008_1 |>
#   dplyr::select(c(C09041, C09042, C09151, C09152))
# 
# qt_ingressantes_35_39_2008 <- cursos_ies_2008_1 |>
#   dplyr::select(c(C09051, C09052, C09161, C09162))
# 
# qt_ingressantes_40_49_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C09061:C09072, C09171:C09182))
# 
# qt_ingressantes_50_59_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C09081:C09092, C09191:C09202))
# 
# qt_ingressantes_60_mais_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C09101:C09112, C09211:C09222))
# 
# # apenas para o primeiro semestre
# qt_ingressantes_preta_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C138014, C138015, C138024, C138025))
# 
# # apenas para o primeiro semestre
# qt_ingressantes_parda_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C138034, C138035, C138044, C138045))
# 
# # foi considerado como índios e remanescentes de quilombolas
# # apenas para o primeiro semestre
# qt_ingressantes_indigena_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C138054:C138055, C138064:C138065, C138074:C138075, C138084:C138085))
# 
# # apenas para o primeiro semestre
# qt_ingressantes_deficiencia_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C138094, C138095, C138104, C138105))
# 
# qt_concluintes_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C8111:C8124))
# 
# qt_concluintes_feminino_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C8111, C8113, C8121, C8123))
# 
# qt_concluintes_masculino_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C8112, C8114, C8122, C8124))
# 
# qt_concluintes_diurno_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C8111, C8112, C8121, C8122))
# 
# qt_concluintes_noturno_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C8113, C8114, C8123, C8124))
# 
# # apenas para o primeiro semestre
# qt_concluintes_preta_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C138016, C138017, C138026, C138027))
# 
# # apenas para o primeiro semestre
# qt_concluintes_parda_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C138036, C138037, C138046, C138047))
# 
# # foi considerado como índios e remanescentes de quilombolas
# # apenas para o primeiro semestre
# qt_concluintes_indigena_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C138056:C138057, C138066:C138067, C138076:C138077, C138086:C138087))
# 
# # apenas para o primeiro semestre
# qt_concluintes_deficiencia_2008 <- cursos_ies_2008_1 |> 
#   dplyr::select(c(C138096, C138097, C138106, C138107))
# 
# 
# cursos_ies_2008_2 <-  cursos_ies_2008_1 |> 
#   dplyr::select(
#     c(
#       ANO, SIGLA_UF, MOD_PRESENC, CATEGADM, REDE, IES, 
#       NOME_CURSO, CURSO, NOMEAREAGERAL, CODAREAGERAL, NOMEAREAESPECIFICA, 
#       CODAREAESPECIFICA, NOMEAREADETALHADA, CODAREADETALHADA
#     )
#   ) |> 
#   dplyr::mutate(
#     quantidade_ingressantes = rowSums(qt_ingressantes_2008, na.rm = TRUE),
#     quantidade_ingressantes_feminino = rowSums(qt_ingressantes_feminino_2008, na.rm = TRUE),
#     quantidade_ingressantes_masculino = rowSums(qt_ingressantes_masculino_2008, na.rm = TRUE),
#     quantidade_ingressantes_diurno = rowSums(qt_ingressantes_diurno_2008, na.rm = TRUE),
#     quantidade_ingressantes_noturno = rowSums(qt_ingressantes_noturno_2008, na.rm = TRUE),
#     quantidade_ingressantes_vestibular = rowSums(qt_ingressantes_vestibular_2008, na.rm = TRUE),
#     quantidade_ingressantes_enem = rowSums(qt_ingressantes_enem_2008, na.rm = TRUE),
#     quantidade_ingressantes_avaliacao_seriada = rowSums(qt_ingressantes_avaliacao_seriada_2008, na.rm = TRUE),
#     quantidade_ingressantes_0_17 = rowSums(qt_ingressantes_0_17_2008, na.rm = TRUE),
#     quantidade_ingressantes_18_24 = rowSums(qt_ingressantes_18_24_2008, na.rm = TRUE),
#     quantidade_ingressantes_25_29 = rowSums(qt_ingressantes_25_29_2008, na.rm = TRUE),
#     quantidade_ingressantes_30_34 = rowSums(qt_ingressantes_30_34_2008, na.rm = TRUE),
#     quantidade_ingressantes_35_39 = rowSums(qt_ingressantes_35_39_2008, na.rm = TRUE),
#     quantidade_ingressantes_40_49 = rowSums(qt_ingressantes_40_49_2008, na.rm = TRUE),
#     quantidade_ingressantes_50_59 = rowSums(qt_ingressantes_50_59_2008, na.rm = TRUE),
#     quantidade_ingressantes_60_mais = rowSums(qt_ingressantes_60_mais_2008, na.rm = TRUE),
#     quantidade_ingressantes_branca = NA,
#     quantidade_ingressantes_preta = rowSums(qt_ingressantes_preta_2008, na.rm = TRUE),
#     quantidade_ingressantes_parda = rowSums(qt_ingressantes_parda_2008, na.rm = TRUE),
#     quantidade_ingressantes_amarela = NA,
#     quantidade_ingressantes_indigena = rowSums(qt_ingressantes_indigena_2008, na.rm = TRUE),
#     quantidade_ingressantes_nao_declarada = NA,
#     quantidade_ingressantes_brasileiro = NA,
#     quantidade_ingressantes_estrangeiro = NA,
#     quantidade_ingressantes_deficiencia = rowSums(qt_ingressantes_deficiencia_2008, na.rm = TRUE),
#     quantidade_concluintes = rowSums(qt_concluintes_2008, na.rm = TRUE),
#     quantidade_concluintes_feminino = rowSums(qt_concluintes_feminino_2008, na.rm = TRUE),
#     quantidade_concluintes_masculino = rowSums(qt_concluintes_masculino_2008, na.rm = TRUE),
#     quantidade_concluintes_diurno = rowSums(qt_concluintes_diurno_2008, na.rm = TRUE),
#     quantidade_concluintes_noturno = rowSums(qt_concluintes_noturno_2008, na.rm = TRUE),
#     quantidade_concluintes_0_17 = NA,
#     quantidade_concluintes_18_24 = NA,
#     quantidade_concluintes_25_29 = NA,
#     quantidade_concluintes_30_34 = NA,
#     quantidade_concluintes_35_39 = NA,
#     quantidade_concluintes_40_49 = NA,
#     quantidade_concluintes_50_59 = NA,
#     quantidade_concluintes_60_mais = NA,
#     quantidade_concluintes_branca = NA,
#     quantidade_concluintes_preta = rowSums(qt_concluintes_preta_2008, na.rm = TRUE),
#     quantidade_concluintes_parda = rowSums(qt_concluintes_parda_2008, na.rm = TRUE),
#     quantidade_concluintes_amarela = NA,
#     quantidade_concluintes_indigena = rowSums(qt_concluintes_indigena_2008, na.rm = TRUE),
#     quantidade_concluintes_nao_declarada = NA,
#     quantidade_concluintes_brasileiro = NA,
#     quantidade_concluintes_estrangeiro = NA,
#     quantidade_concluintes_deficiencia = rowSums(qt_concluintes_deficiencia_2008, na.rm = TRUE),
#   ) 


# para incluir o id_municipio, nome e sigla das instituições --------------
# selecionei as colunas referentes a partir de cursos_ies -----------------

# municipio_ies <- cursos_ies_09_22 |> 
#   dplyr::select(c(id_ies, id_municipio, nome, sigla)) |>
#   dplyr::distinct(id_ies, .keep_all = TRUE)
# 
# cursos_ies_2008 <- cursos_ies_2008_2 |> 
#   dplyr::left_join(
#     municipio_ies,
#     by = c("IES" = "id_ies")
#   ) |> 
#   dplyr::relocate(id_municipio, .after = SIGLA_UF) |> 
#   dplyr::relocate(nome, .after = CODAREAESPECIFICA) |> 
#   dplyr::relocate(sigla, .after = nome) |> 
#   dplyr::mutate(
#     MOD_PRESENC = dplyr::case_when(
#       MOD_PRESENC == "S" ~ "1",
#       TRUE ~ "2"
#     ),
#     REDE = dplyr::case_when(
#       REDE == "Publica" ~ "1",
#       REDE == "Privada" ~ "2"
#     ),
#     CATEGADM = dplyr::case_when(
#       CATEGADM == "FEDERAL" ~ "1",
#       CATEGADM == "ESTADUAL" ~ "2",
#       CATEGADM == "MUNICIPAL" ~ "3",
#       CATEGADM == "PRIVADA" ~ "4"
#     )
#   ) |> 
#   dplyr::rename(
#     "ano" = "ANO",
#     "sigla_uf" = "SIGLA_UF",
#     "tipo_modalidade_ensino" = "MOD_PRESENC",
#     "tipo_categoria_administrativa" = "CATEGADM",
#     "rede" = "REDE",
#     "id_ies" = "IES",
#     "nome_curso" = "NOME_CURSO",
#     "id_curso" = "CURSO",
#     "nome_area_geral" = "NOMEAREAGERAL",
#     "id_area_geral" = "CODAREAGERAL",
#     "nome_area_especifica" = "NOMEAREAESPECIFICA",
#     "id_area_especifica" = "CODAREAESPECIFICA",
#     "nome_area_detalhada" = "NOMEAREADETALHADA",
#     "id_area_detalhada" = "CODAREADETALHADA"
#   )



# ano de 2007 -------------------------------------------------------------

# AS IDENTIFICAÇÕES DAS IES (MASCARA) MUDAM DE UM ANO PARA O OUTRO.
# POR EXEMPLO, O CÓDIGO DE IDENTIFICAÇÃO DA UFSM (582) CORRESPONDE
# A UMA UNIVERSIDADE LOCALIZADA EM LAURO DE FREITAS (BA) EM 2007, 
# A UMA UNIVERSIDADE LOCALIZADA EM GOIANIA (GO) EM 2006 E A UMA
# UNIVERSIDADE LOCALIZADA EM CAMPO GRANDE (MS) EM 2005.

# cursos_ies_2007_1 <- dplyr::left_join(
#   cursos_2007,
#   ies_2007,
#   by = c(
#     "MASCARA" = "MASCARA", # corresponde a instituição de ensino
#     "ANO" = "ANO",
#     "EH_CAPITAL" = "EH_CAPITAL",
#     "COD_UF" = "COD_UF",
#     "CODMUNIC" = "CODMUNIC",
#     "CO_ORG" = "CO_ORG",
#     "CATEGADM" = "CATEGADM",
#     "REDE" = "REDE",
#     "NOME_UF" = "NOME_UF",
#     "SIGLA_UF" = "SIGLA_UF",
#     "REGIAO" = "REGIAO",
#     "NOMEORG" = "NOMEORG",
#     "CO_REDE" = "CO_REDE",
#     "CO_DEP" = "CO_DEP",
#     "NOMEDEP" = "NOMEDEP",
#     "CATADMPARTSE" = "CATADMPARTSE",
#     "CATADMCOMUN" = "CATADMCOMUN",
#     "CATADMCONFESS" = "CATADMCONFESS",
#     "CATADMFILANT" = "CATADMFILANT",
#     "NOME_MUNICIPIO" = "NOME_MUNICIPIO"
#   )
# ) |>
#   # altera a classificação das colunas
#   dplyr::mutate_if(is.logical, as.numeric)


# seleciona as variáveis (colunas) de interesse ---------------------------
# para o cálculo de novas variáveis ---------------------------------------

# qt_ingressantes_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C72011:C7640))
# 
# qt_ingressantes_feminino_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(
#     c(C72011, C72013, C72021, C72023, C72031, C72033, C72041, C72043,
#       C72051, C72053, C72061, C72063, C72071, C72073, C72081, C72083,
#       C72091, C72093, C72101, C72103, C73011, C73013, C73021, C73023,
#       C73031, C73033, C73041, C73043, C73051, C73053, C73061, C73063,
#       C73071, C73073, C73081, C73083, C73091, C73093, C73101, C73103, 
#       C7401, C7403, C7405, C7407, C7409, C7411, C7413, C7415, C7417,
#       C7419, C7421, C7423, C7425, C7427, C7429, C7431, C7433, C7435,
#       C7437, C7439, C7501, C7503, C7505, C7507, C7509, C7511, C7513,
#       C7515, C7517, C7519, C7521, C7523, C7525, C7527, C7529, C7531,
#       C7533, C7535, C7537, C7539, C7601, C7603, C7605, C7607, C7609,
#       C7611, C7613, C7615, C7617, C7619, C7621, C7623, C7625, C7627,
#       C7629, C7631, C7633, C7635, C7637, C7639)
#   )
# 
# qt_ingressantes_masculino_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(
#     c(C72012, C72014, C72022, C72024, C72032, C72034, C72042, C72044,
#       C72052, C72054, C72062, C72064, C72072, C72074, C72082, C72084,
#       C72092, C72094, C72102, C72104, C73012, C73014, C73022, C73024,
#       C73032, C73034, C73042, C73044, C73052, C73054, C73062, C73064,
#       C73072, C73074, C73082, C73084, C73092, C73094, C73102, C73104,
#       C7402, C7404, C7406, C7408, C7410, C7412, C7414, C7416, C7418,
#       C7420, C7422, C7424, C7426, C7428, C7430, C7432, C7434, C7436,
#       C7438, C7440, C7502, C7504, C7506, C7508, C7510, C7512, C7514,
#       C7516, C7518, C7520, C7522, C7524, C7526, C7528, C7530, C7532,
#       C7534, C7536, C7538, C7540, C7602, C7604, C7606, C7608, C7610,
#       C7612, C7614, C7616, C7618, C7620, C7622, C7624, C7626, C7628,
#       C7630, C7632, C7634, C7636, C7638, C7640)
#   )
# 
# qt_ingressantes_diurno_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(
#     c(C72011, C72012, C72021, C72022, C72031, C72032, C72041, C72042,
#       C72051, C72052, C72061, C72062, C72071, C72072, C72081, C72082,
#       C72091, C72092, C72101, C72102, C73011, C73012, C73021, C73022,
#       C73031, C73032, C73041, C73042, C73051, C73052, C73061, C73062,
#       C73071, C73072, C73081, C73082, C73091, C73092, C73101, C73102,
#       C7401, C7402, C7405, C7406, C7409, C7410, C7413, C7414, C7417, C7418,
#       C7421, C7422, C7425, C7426, C7429, C7430, C7433, C7434, C7437, C7438,
#       C7501, C7502, C7505, C7506, C7509, C7510, C7513, C7514, C7517, C7518,
#       C7521, C7522, C7525, C7526, C7529, C7530, C7533, C7534, C7537, C7538,
#       C7601, C7602, C7605, C7606, C7609, C7610, C7613, C7614, C7617, C7618,
#       C7621, C7622, C7625, C7626, C7629, C7630, C7633, C7634, C7637, C7638)
#   )
# 
# qt_ingressantes_noturno_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(
#     c(C72013, C72014, C72023, C72024, C72033, C72034, C72043, C72044,
#       C72053, C72054, C72063, C72064, C72073, C72074, C72083, C72084,
#       C72093, C72094, C72103, C72104, C73013, C73014, C73023, C73024,
#       C73033, C73034, C73043, C73044, C73053, C73054, C73063, C73064,
#       C73073, C73074, C73083, C73084, C73093, C73094, C73103, C73104,
#       C7403, C7404, C7407, C7408, C7411, C7412, C7415, C7416, C7419, C7420,
#       C7423, C7424, C7427, C7428, C7431, C7432, C7435, C7436, C7439, C7440,
#       C7503, C7504, C7507, C7508, C7511, C7512, C7515, C7516, C7519, C7520,
#       C7523, C7524, C7527, C7528, C7531, C7532, C7535, C7536, C7539, C7540,
#       C7603, C7604, C7607, C7608, C7611, C7612, C7615, C7616, C7619, C7620,
#       C7623, C7624, C7627, C7628, C7631, C7632, C7635, C7636, C7639, C7640)
#   )
# 
# qt_ingressantes_vestibular_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(
#     c(C72011:C72014, C72041:C72044, C72061:C72064, C72091:C72094,
#       C73011:C73014, C73041:C73044, C73061:C73064, C73091:C73094,
#       C7401:C7404, C7413:C7416, C7421:C7424, C7433:C7436,
#       C7501:C7504, C7513:C7516, C7521:C7524, C7533:C7536,
#       C7601:C7604, C7613:C7616, C7621:C7624, C7633:C7636)
#   )
# 
# qt_ingressantes_enem_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(
#     c(C72021:C72024, C72071:C72074, C73021:C73024, C73071:C73074, C7405:C7408, 
#       C7425:C7428, C7505:C7508, C7525:C7528, C7605:C7608, C7625:C7628)
#   )
# 
# qt_ingressantes_avaliacao_seriada_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(
#     c(C72031:C72034, C72081:C72084, C73031:C73034, C73081:C73084,
#       C7409:C7412, C7429:C7432, C7509:C7512, C7529:C7532, C7609:C7612, 
#       C7629:C7632)
#   )
# 
# qt_ingressantes_0_17_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C09011, C09012, C09121, C09122))
# 
# qt_ingressantes_18_24_2007 <- cursos_ies_2007_1 |>
#   dplyr::select(c(C09021, C09022, C09131, C09132))
# 
# qt_ingressantes_25_29_2007 <- cursos_ies_2007_1 |>
#   dplyr::select(c(C09031, C09032, C09141, C09142))
# 
# qt_ingressantes_30_34_2007 <- cursos_ies_2007_1 |>
#   dplyr::select(c(C09041, C09042, C09151, C09152))
# 
# qt_ingressantes_35_39_2007 <- cursos_ies_2007_1 |>
#   dplyr::select(c(C09051, C09052, C09161, C09162))
# 
# qt_ingressantes_40_49_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C09061:C09072, C09171:C09182))
# 
# qt_ingressantes_50_59_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C09081:C09092, C09191:C09202))
# 
# qt_ingressantes_60_mais_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C09101:C09112, C09211:C09222))
# 
# # apenas para o primeiro semestre
# qt_ingressantes_preta_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C138014, C138015, C138024, C138025))
# 
# # apenas para o primeiro semestre
# qt_ingressantes_parda_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C138034, C138035, C138044, C138045))
# 
# # foi considerado como índios e remanescentes de quilombolas
# # apenas para o primeiro semestre
# qt_ingressantes_indigena_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C138054:C138055, C138064:C138065, C138074:C138075, C138084:C138085))
# 
# # apenas para o primeiro semestre
# qt_ingressantes_deficiencia_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C138094, C138095, C138104, C138105))
# 
# qt_concluintes_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C8111:C8124))
# 
# qt_concluintes_feminino_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C8111, C8113, C8121, C8123))
# 
# qt_concluintes_masculino_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C8112, C8114, C8122, C8124))
# 
# qt_concluintes_diurno_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C8111, C8112, C8121, C8122))
# 
# qt_concluintes_noturno_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C8113, C8114, C8123, C8124))
# 
# # apenas para o primeiro semestre
# qt_concluintes_preta_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C138016, C138017, C138026, C138027))
# 
# # apenas para o primeiro semestre
# qt_concluintes_parda_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C138036, C138037, C138046, C138047))
# 
# # foi considerado como índios e remanescentes de quilombolas
# # apenas para o primeiro semestre
# qt_concluintes_indigena_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C138056:C138057, C138066:C138067, C138076:C138077, C138086:C138087))
# 
# # apenas para o primeiro semestre
# qt_concluintes_deficiencia_2007 <- cursos_ies_2007_1 |> 
#   dplyr::select(c(C138096, C138097, C138106, C138107))
# 
# 
# cursos_ies_2007_2 <- cursos_ies_2007_1 |> 
#   dplyr::select(
#     c(
#       ANO, SIGLA_UF, CODMUNIC, MOD_PRESENC, CATEGADM, REDE, MASCARA, 
#       NOME_CURSO, CURSO, NOMEAREAGERAL, CODAREAGERAL, NOMEAREAESPECIFICA, 
#       CODAREAESPECIFICA, NOMEAREADETALHADA, CODAREADETALHADA
#     )
#   ) |> 
#   dplyr::mutate(
#     quantidade_ingressantes = rowSums(qt_ingressantes_2007, na.rm = TRUE),
#     quantidade_ingressantes_feminino = rowSums(qt_ingressantes_feminino_2007, na.rm = TRUE),
#     quantidade_ingressantes_masculino = rowSums(qt_ingressantes_masculino_2007, na.rm = TRUE),
#     quantidade_ingressantes_diurno = rowSums(qt_ingressantes_diurno_2007, na.rm = TRUE),
#     quantidade_ingressantes_noturno = rowSums(qt_ingressantes_noturno_2007, na.rm = TRUE),
#     quantidade_ingressantes_vestibular = rowSums(qt_ingressantes_vestibular_2007, na.rm = TRUE),
#     quantidade_ingressantes_enem = rowSums(qt_ingressantes_enem_2007, na.rm = TRUE),
#     quantidade_ingressantes_avaliacao_seriada = rowSums(qt_ingressantes_avaliacao_seriada_2007, na.rm = TRUE),
#     quantidade_ingressantes_0_17 = rowSums(qt_ingressantes_0_17_2007, na.rm = TRUE),
#     quantidade_ingressantes_18_24 = rowSums(qt_ingressantes_18_24_2007, na.rm = TRUE),
#     quantidade_ingressantes_25_29 = rowSums(qt_ingressantes_25_29_2007, na.rm = TRUE),
#     quantidade_ingressantes_30_34 = rowSums(qt_ingressantes_30_34_2007, na.rm = TRUE),
#     quantidade_ingressantes_35_39 = rowSums(qt_ingressantes_35_39_2007, na.rm = TRUE),
#     quantidade_ingressantes_40_49 = rowSums(qt_ingressantes_40_49_2007, na.rm = TRUE),
#     quantidade_ingressantes_50_59 = rowSums(qt_ingressantes_50_59_2007, na.rm = TRUE),
#     quantidade_ingressantes_60_mais = rowSums(qt_ingressantes_60_mais_2007, na.rm = TRUE),
#     quantidade_ingressantes_branca = NA,
#     quantidade_ingressantes_preta = rowSums(qt_ingressantes_preta_2007, na.rm = TRUE),
#     quantidade_ingressantes_parda = rowSums(qt_ingressantes_parda_2007, na.rm = TRUE),
#     quantidade_ingressantes_amarela = NA,
#     quantidade_ingressantes_indigena = rowSums(qt_ingressantes_indigena_2007, na.rm = TRUE),
#     quantidade_ingressantes_nao_declarada = NA,
#     quantidade_ingressantes_brasileiro = NA,
#     quantidade_ingressantes_estrangeiro = NA,
#     quantidade_ingressantes_deficiencia = rowSums(qt_ingressantes_deficiencia_2007, na.rm = TRUE),
#     quantidade_concluintes = rowSums(qt_concluintes_2007, na.rm = TRUE),
#     quantidade_concluintes_feminino = rowSums(qt_concluintes_feminino_2007, na.rm = TRUE),
#     quantidade_concluintes_masculino = rowSums(qt_concluintes_masculino_2007, na.rm = TRUE),
#     quantidade_concluintes_diurno = rowSums(qt_concluintes_diurno_2007, na.rm = TRUE),
#     quantidade_concluintes_noturno = rowSums(qt_concluintes_noturno_2007, na.rm = TRUE),
#     quantidade_concluintes_0_17 = NA,
#     quantidade_concluintes_18_24 = NA,
#     quantidade_concluintes_25_29 = NA,
#     quantidade_concluintes_30_34 = NA,
#     quantidade_concluintes_35_39 = NA,
#     quantidade_concluintes_40_49 = NA,
#     quantidade_concluintes_50_59 = NA,
#     quantidade_concluintes_60_mais = NA,
#     quantidade_concluintes_branca = NA,
#     quantidade_concluintes_preta = rowSums(qt_concluintes_preta_2007, na.rm = TRUE),
#     quantidade_concluintes_parda = rowSums(qt_concluintes_parda_2007, na.rm = TRUE),
#     quantidade_concluintes_amarela = NA,
#     quantidade_concluintes_indigena = rowSums(qt_concluintes_indigena_2007, na.rm = TRUE),
#     quantidade_concluintes_nao_declarada = NA,
#     quantidade_concluintes_brasileiro = NA,
#     quantidade_concluintes_estrangeiro = NA,
#     quantidade_concluintes_deficiencia = rowSums(qt_concluintes_deficiencia_2007, na.rm = TRUE),
#   )
# 
# 
# cursos_ies_2007 <- cursos_ies_2007_2 |> 
#   dplyr::mutate(
#     MOD_PRESENC = dplyr::case_when(
#       MOD_PRESENC == "S" ~ "1",
#       TRUE ~ "2"
#     ),
#     REDE = dplyr::case_when(
#       REDE == "Publica" ~ "1",
#       REDE == "Privada" ~ "2"
#     ),
#     CATEGADM = dplyr::case_when(
#       CATEGADM == "FEDERAL" ~ "1",
#       CATEGADM == "ESTADUAL" ~ "2",
#       CATEGADM == "MUNICIPAL" ~ "3",
#       CATEGADM == "PRIVADA" ~ "4"
#     ),
#     nome = NA,
#     sigla = NA,
#     MASCARA = as.character(MASCARA)
#   ) |> 
#   dplyr::rename(
#     "ano" = "ANO",
#     "sigla_uf" = "SIGLA_UF",
#     "id_municipio" = "CODMUNIC",
#     "tipo_modalidade_ensino" = "MOD_PRESENC",
#     "tipo_categoria_administrativa" = "CATEGADM",
#     "rede" = "REDE",
#     "id_ies" = "MASCARA",
#     "nome_curso" = "NOME_CURSO",
#     "id_curso" = "CURSO",
#     "nome_area_geral" = "NOMEAREAGERAL",
#     "id_area_geral" = "CODAREAGERAL",
#     "nome_area_especifica" = "NOMEAREAESPECIFICA",
#     "id_area_especifica" = "CODAREAESPECIFICA",
#     "nome_area_detalhada" = "NOMEAREADETALHADA",
#     "id_area_detalhada" = "CODAREADETALHADA"
#   ) |> 
#   dplyr::relocate(nome, sigla, .after = id_area_especifica)



# ano de 2006 -------------------------------------------------------------

# AS IDENTIFICAÇÕES DAS IES (MASCARA) MUDAM DE UM ANO PARA O OUTRO.
# POR EXEMPLO, O CÓDIGO DE IDENTIFICAÇÃO DA UFSM (582) CORRESPONDE
# A UMA UNIVERSIDADE LOCALIZADA EM LAURO DE FREITAS (BA) EM 2007, 
# A UMA UNIVERSIDADE LOCALIZADA EM GOIANIA (GO) EM 2006 E A UMA
# UNIVERSIDADE LOCALIZADA EM CAMPO GRANDE (MS) EM 2005.

# cursos_ies_2006_1 <- dplyr::left_join(
#   cursos_2006,
#   ies_2006,
#   by = c(
#     "MASCARA" = "MASCARA", # corresponde a instituição de ensino
#     "ANO" = "ANO",
#     "EH_CAPITAL" = "EH_CAPITAL",
#     "COD_UF" = "COD_UF",
#     "CODMUNIC" = "CODMUNIC",
#     "ORDEMORGACAD" = "ORDEMORGACAD",
#     "CATEGADM" = "CATEGADM",
#     # "REDE" = "REDE",
#     "SIGLA_UF_CURSO" = "SIGLA",
#     "REGIAO" = "REGIAO",
#     "NOMEORGACAD" = "NOMEORGACAD",
#     # "CO_REDE" = "CO_REDE",
#     # "CO_DEP" = "CO_DEP",
#     # "NOMEDEP" = "NOMEDEP",
#     "CATADMPARTSE" = "CATADMPARTSE",
#     "CATADMCOMUN" = "CATADMCOMUN",
#     "CATADMCONFESS" = "CATADMCONFESS",
#     "CATADMFILANT" = "CATADMFILANT",
#     "MUNICIPIO" = "MUNICIPIO",
#     "COD_DEP" = "COD_DEP",
#     "CATADM" = "CATADM"
#   )
# ) # |> 
#   # altera a classificação das colunas
#   # dplyr::mutate_if(is.logical, as.numeric) 


# seleciona as variáveis (colunas) de interesse ---------------------------
# para o cálculo de novas variáveis ---------------------------------------

# qt_ingressantes_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C72011:C7640))
# 
# qt_ingressantes_feminino_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(
#     c(C72011, C72013, C72021, C72023, C72031, C72033, C72041, C72043,
#       C72051, C72053, C72061, C72063, C72071, C72073, C72081, C72083,
#       C72091, C72093, C72101, C72103, C73011, C73013, C73021, C73023,
#       C73031, C73033, C73041, C73043, C73051, C73053, C73061, C73063,
#       C73071, C73073, C73081, C73083, C73091, C73093, C73101, C73103, 
#       C7401, C7403, C7405, C7407, C7409, C7411, C7413, C7415, C7417,
#       C7419, C7421, C7423, C7425, C7427, C7429, C7431, C7433, C7435,
#       C7437, C7439, C7501, C7503, C7505, C7507, C7509, C7511, C7513,
#       C7515, C7517, C7519, C7521, C7523, C7525, C7527, C7529, C7531,
#       C7533, C7535, C7537, C7539, C7601, C7603, C7605, C7607, C7609,
#       C7611, C7613, C7615, C7617, C7619, C7621, C7623, C7625, C7627,
#       C7629, C7631, C7633, C7635, C7637, C7639)
#   )
# 
# qt_ingressantes_masculino_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(
#     c(C72012, C72014, C72022, C72024, C72032, C72034, C72042, C72044,
#       C72052, C72054, C72062, C72064, C72072, C72074, C72082, C72084,
#       C72092, C72094, C72102, C72104, C73012, C73014, C73022, C73024,
#       C73032, C73034, C73042, C73044, C73052, C73054, C73062, C73064,
#       C73072, C73074, C73082, C73084, C73092, C73094, C73102, C73104,
#       C7402, C7404, C7406, C7408, C7410, C7412, C7414, C7416, C7418,
#       C7420, C7422, C7424, C7426, C7428, C7430, C7432, C7434, C7436,
#       C7438, C7440, C7502, C7504, C7506, C7508, C7510, C7512, C7514,
#       C7516, C7518, C7520, C7522, C7524, C7526, C7528, C7530, C7532,
#       C7534, C7536, C7538, C7540, C7602, C7604, C7606, C7608, C7610,
#       C7612, C7614, C7616, C7618, C7620, C7622, C7624, C7626, C7628,
#       C7630, C7632, C7634, C7636, C7638, C7640)
#   )
# 
# qt_ingressantes_diurno_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(
#     c(C72011, C72012, C72021, C72022, C72031, C72032, C72041, C72042,
#       C72051, C72052, C72061, C72062, C72071, C72072, C72081, C72082,
#       C72091, C72092, C72101, C72102, C73011, C73012, C73021, C73022,
#       C73031, C73032, C73041, C73042, C73051, C73052, C73061, C73062,
#       C73071, C73072, C73081, C73082, C73091, C73092, C73101, C73102,
#       C7401, C7402, C7405, C7406, C7409, C7410, C7413, C7414, C7417, C7418,
#       C7421, C7422, C7425, C7426, C7429, C7430, C7433, C7434, C7437, C7438,
#       C7501, C7502, C7505, C7506, C7509, C7510, C7513, C7514, C7517, C7518,
#       C7521, C7522, C7525, C7526, C7529, C7530, C7533, C7534, C7537, C7538,
#       C7601, C7602, C7605, C7606, C7609, C7610, C7613, C7614, C7617, C7618,
#       C7621, C7622, C7625, C7626, C7629, C7630, C7633, C7634, C7637, C7638)
#   )
# 
# qt_ingressantes_noturno_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(
#     c(C72013, C72014, C72023, C72024, C72033, C72034, C72043, C72044,
#       C72053, C72054, C72063, C72064, C72073, C72074, C72083, C72084,
#       C72093, C72094, C72103, C72104, C73013, C73014, C73023, C73024,
#       C73033, C73034, C73043, C73044, C73053, C73054, C73063, C73064,
#       C73073, C73074, C73083, C73084, C73093, C73094, C73103, C73104,
#       C7403, C7404, C7407, C7408, C7411, C7412, C7415, C7416, C7419, C7420,
#       C7423, C7424, C7427, C7428, C7431, C7432, C7435, C7436, C7439, C7440,
#       C7503, C7504, C7507, C7508, C7511, C7512, C7515, C7516, C7519, C7520,
#       C7523, C7524, C7527, C7528, C7531, C7532, C7535, C7536, C7539, C7540,
#       C7603, C7604, C7607, C7608, C7611, C7612, C7615, C7616, C7619, C7620,
#       C7623, C7624, C7627, C7628, C7631, C7632, C7635, C7636, C7639, C7640)
#   )
# 
# qt_ingressantes_vestibular_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(
#     c(C72011:C72014, C72041:C72044, C72061:C72064, C72091:C72094,
#       C73011:C73014, C73041:C73044, C73061:C73064, C73091:C73094,
#       C7401:C7404, C7413:C7416, C7421:C7424, C7433:C7436,
#       C7501:C7504, C7513:C7516, C7521:C7524, C7533:C7536,
#       C7601:C7604, C7613:C7616, C7621:C7624, C7633:C7636)
#   )
# 
# qt_ingressantes_enem_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(
#     c(C72021:C72024, C72071:C72074, C73021:C73024, C73071:C73074, C7405:C7408, 
#       C7425:C7428, C7505:C7508, C7525:C7528, C7605:C7608, C7625:C7628)
#   )
# 
# qt_ingressantes_avaliacao_seriada_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(
#     c(C72031:C72034, C72081:C72084, C73031:C73034, C73081:C73084,
#       C7409:C7412, C7429:C7432, C7509:C7512, C7529:C7532, C7609:C7612, 
#       C7629:C7632)
#   )
# 
# qt_ingressantes_0_17_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C09011, C09012, C09121, C09122))
# 
# qt_ingressantes_18_24_2006 <- cursos_ies_2006_1 |>
#   dplyr::select(c(C09021, C09022, C09131, C09132))
# 
# qt_ingressantes_25_29_2006 <- cursos_ies_2006_1 |>
#   dplyr::select(c(C09031, C09032, C09141, C09142))
# 
# qt_ingressantes_30_34_2006 <- cursos_ies_2006_1 |>
#   dplyr::select(c(C09041, C09042, C09151, C09152))
# 
# qt_ingressantes_35_39_2006 <- cursos_ies_2006_1 |>
#   dplyr::select(c(C09051, C09052, C09161, C09162))
# 
# qt_ingressantes_40_49_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C09061:C09072, C09171:C09182))
# 
# qt_ingressantes_50_59_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C09081:C09092, C09191:C09202))
# 
# qt_ingressantes_60_mais_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C09101:C09112, C09211:C09222))
# 
# # apenas para o primeiro semestre
# qt_ingressantes_preta_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C138014, C138015, C138024, C138025))
# 
# # apenas para o primeiro semestre
# qt_ingressantes_parda_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C138034, C138035, C138044, C138045))
# 
# # foi considerado como índios e remanescentes de quilombolas
# # apenas para o primeiro semestre
# qt_ingressantes_indigena_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C138054:C138055, C138064:C138065, C138074:C138075, C138084:C138085))
# 
# # apenas para o primeiro semestre
# qt_ingressantes_deficiencia_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C138094, C138095, C138104, C138105))
# 
# qt_concluintes_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C8111:C8124))
# 
# qt_concluintes_feminino_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C8111, C8113, C8121, C8123))
# 
# qt_concluintes_masculino_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C8112, C8114, C8122, C8124))
# 
# qt_concluintes_diurno_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C8111, C8112, C8121, C8122))
# 
# qt_concluintes_noturno_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C8113, C8114, C8123, C8124))
# 
# # apenas para o primeiro semestre
# qt_concluintes_preta_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C138016, C138017, C138026, C138027))
# 
# # apenas para o primeiro semestre
# qt_concluintes_parda_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C138036, C138037, C138046, C138047))
# 
# # foi considerado como índios e remanescentes de quilombolas
# # apenas para o primeiro semestre
# qt_concluintes_indigena_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C138056:C138057, C138066:C138067, C138076:C138077, C138086:C138087))
# 
# # apenas para o primeiro semestre
# qt_concluintes_deficiencia_2006 <- cursos_ies_2006_1 |> 
#   dplyr::select(c(C138096, C138097, C138106, C138107))
# 
# 
# cursos_ies_2006_2 <- cursos_ies_2006_1 |> 
#   dplyr::select(
#     c(
#       ANO, SIGLA_UF_CURSO, CODMUNIC, MOD_PRESENC, CATEGADM, MASCARA, 
#       NOMEDOCURSO, CURSO, NOMEAREAGERAL, CODAREAGERAL, NOMEAREAESPECIFICA, 
#       CODAREAESPECIFICA, NOMEAREADETALHADA, CODAREADETALHADA,
#     )
#   ) |> 
#   dplyr::mutate(
#     quantidade_ingressantes = rowSums(qt_ingressantes_2006, na.rm = TRUE),
#     quantidade_ingressantes_feminino = rowSums(qt_ingressantes_feminino_2006, na.rm = TRUE),
#     quantidade_ingressantes_masculino = rowSums(qt_ingressantes_masculino_2006, na.rm = TRUE),
#     quantidade_ingressantes_diurno = rowSums(qt_ingressantes_diurno_2006, na.rm = TRUE),
#     quantidade_ingressantes_noturno = rowSums(qt_ingressantes_noturno_2006, na.rm = TRUE),
#     quantidade_ingressantes_vestibular = rowSums(qt_ingressantes_vestibular_2006, na.rm = TRUE),
#     quantidade_ingressantes_enem = rowSums(qt_ingressantes_enem_2006, na.rm = TRUE),
#     quantidade_ingressantes_avaliacao_seriada = rowSums(qt_ingressantes_avaliacao_seriada_2006, na.rm = TRUE),
#     quantidade_ingressantes_0_17 = rowSums(qt_ingressantes_0_17_2006, na.rm = TRUE),
#     quantidade_ingressantes_18_24 = rowSums(qt_ingressantes_18_24_2006, na.rm = TRUE),
#     quantidade_ingressantes_25_29 = rowSums(qt_ingressantes_25_29_2006, na.rm = TRUE),
#     quantidade_ingressantes_30_34 = rowSums(qt_ingressantes_30_34_2006, na.rm = TRUE),
#     quantidade_ingressantes_35_39 = rowSums(qt_ingressantes_35_39_2006, na.rm = TRUE),
#     quantidade_ingressantes_40_49 = rowSums(qt_ingressantes_40_49_2006, na.rm = TRUE),
#     quantidade_ingressantes_50_59 = rowSums(qt_ingressantes_50_59_2006, na.rm = TRUE),
#     quantidade_ingressantes_60_mais = rowSums(qt_ingressantes_60_mais_2006, na.rm = TRUE),
#     quantidade_ingressantes_branca = NA,
#     quantidade_ingressantes_preta = rowSums(qt_ingressantes_preta_2006, na.rm = TRUE),
#     quantidade_ingressantes_parda = rowSums(qt_ingressantes_parda_2006, na.rm = TRUE),
#     quantidade_ingressantes_amarela = NA,
#     quantidade_ingressantes_indigena = rowSums(qt_ingressantes_indigena_2006, na.rm = TRUE),
#     quantidade_ingressantes_nao_declarada = NA,
#     quantidade_ingressantes_brasileiro = NA,
#     quantidade_ingressantes_estrangeiro = NA,
#     quantidade_ingressantes_deficiencia = rowSums(qt_ingressantes_deficiencia_2006, na.rm = TRUE),
#     quantidade_concluintes = rowSums(qt_concluintes_2006, na.rm = TRUE),
#     quantidade_concluintes_feminino = rowSums(qt_concluintes_feminino_2006, na.rm = TRUE),
#     quantidade_concluintes_masculino = rowSums(qt_concluintes_masculino_2006, na.rm = TRUE),
#     quantidade_concluintes_diurno = rowSums(qt_concluintes_diurno_2006, na.rm = TRUE),
#     quantidade_concluintes_noturno = rowSums(qt_concluintes_noturno_2006, na.rm = TRUE),
#     quantidade_concluintes_0_17 = NA,
#     quantidade_concluintes_18_24 = NA,
#     quantidade_concluintes_25_29 = NA,
#     quantidade_concluintes_30_34 = NA,
#     quantidade_concluintes_35_39 = NA,
#     quantidade_concluintes_40_49 = NA,
#     quantidade_concluintes_50_59 = NA,
#     quantidade_concluintes_60_mais = NA,
#     quantidade_concluintes_branca = NA,
#     quantidade_concluintes_preta = rowSums(qt_concluintes_preta_2006, na.rm = TRUE),
#     quantidade_concluintes_parda = rowSums(qt_concluintes_parda_2006, na.rm = TRUE),
#     quantidade_concluintes_amarela = NA,
#     quantidade_concluintes_indigena = rowSums(qt_concluintes_indigena_2006, na.rm = TRUE),
#     quantidade_concluintes_nao_declarada = NA,
#     quantidade_concluintes_brasileiro = NA,
#     quantidade_concluintes_estrangeiro = NA,
#     quantidade_concluintes_deficiencia = rowSums(qt_concluintes_deficiencia_2006, na.rm = TRUE),
#   )
# 
# 
# cursos_ies_2006 <- cursos_ies_2006_2 |> 
#   dplyr::mutate(
#     MOD_PRESENC = dplyr::case_when(
#       MOD_PRESENC == "S" ~ "1",
#       TRUE ~ "2"
#     ),
#     REDE = dplyr::case_when(
#       CATEGADM == "PRIVADA" ~ "2",
#       TRUE ~ "1"
#     ),
#     CATEGADM = dplyr::case_when(
#       CATEGADM == "FEDERAL" ~ "1",
#       CATEGADM == "ESTADUAL" ~ "2",
#       CATEGADM == "MUNICIPAL" ~ "3",
#       CATEGADM == "PRIVADA" ~ "4"
#     ),
#     nome = NA,
#     sigla = NA,
#     MASCARA = as.character(MASCARA)
#   ) |> 
#   dplyr::rename(
#     "ano" = "ANO",
#     "sigla_uf" = "SIGLA_UF_CURSO",
#     "id_municipio" = "CODMUNIC",
#     "tipo_modalidade_ensino" = "MOD_PRESENC",
#     "tipo_categoria_administrativa" = "CATEGADM",
#     "rede" = "REDE",
#     "id_ies" = "MASCARA",
#     "nome_curso" = "NOMEDOCURSO",
#     "id_curso" = "CURSO",
#     "nome_area_geral" = "NOMEAREAGERAL",
#     "id_area_geral" = "CODAREAGERAL",
#     "nome_area_especifica" = "NOMEAREAESPECIFICA",
#     "id_area_especifica" = "CODAREAESPECIFICA",
#     "nome_area_detalhada" = "NOMEAREADETALHADA",
#     "id_area_detalhada" = "CODAREADETALHADA"
#   ) |> 
#   dplyr::relocate(nome, sigla, .after = id_area_especifica) |> 
#   dplyr::relocate(rede, .after = tipo_categoria_administrativa)



# ano de 2005 -------------------------------------------------------------

# AS IDENTIFICAÇÕES DAS IES (MASCARA) MUDAM DE UM ANO PARA O OUTRO.
# POR EXEMPLO, O CÓDIGO DE IDENTIFICAÇÃO DA UFSM (582) CORRESPONDE
# A UMA UNIVERSIDADE LOCALIZADA EM LAURO DE FREITAS (BA) EM 2007, 
# A UMA UNIVERSIDADE LOCALIZADA EM GOIANIA (GO) EM 2006 E A UMA
# UNIVERSIDADE LOCALIZADA EM CAMPO GRANDE (MS) EM 2005.


# cursos_ies_2005_1 <- dplyr::left_join(
#   cursos_2005,
#   ies_2005,
#   by = c(
#     "MASCARA" = "MASCARA", # corresponde a instituição de ensino
#     "ANO" = "ANO",
#     "EH_CAPITAL" = "EH_CAPITAL",
#     "COD_UF" = "COD_UF",
#     "CODMUNIC" = "CODMUNIC",
#     "ORDEMORGACAD" = "ORDEMORGACAD",
#     "CATEGADM" = "CATEGADM",
#     # "REDE" = "REDE",
#     "SIGLA_UF_CURSO" = "SIGLA",
#     "REGIAO" = "REGIAO",
#     "NOMEORGACAD" = "NOMEORGACAD",
#     # "CO_REDE" = "CO_REDE",
#     # "CO_DEP" = "CO_DEP",
#     # "NOMEDEP" = "NOMEDEP",
#     "CATADMPARTSE" = "CATADMPARTSE",
#     "CATADMCOMUN" = "CATADMCOMUN",
#     "CATADMCONFESS" = "CATADMCONFESS",
#     "CATADMFILANT" = "CATADMFILANT",
#     "MUNICIPIO" = "MUNICIPIO",
#     "COD_DEP" = "COD_DEP",
#     "CATADM" = "CATADM"
#   )
# ) |> 
# # altera a classificação das colunas
# dplyr::mutate_if(is.logical, as.numeric)


# seleciona as variáveis (colunas) de interesse ---------------------------
# para o cálculo de novas variáveis ---------------------------------------

# qt_ingressantes_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C72011:C7640))
# 
# qt_ingressantes_feminino_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(
#     c(C72011, C72013, C72021, C72023, C72031, C72033, C72041, C72043,
#       C72051, C72053, C72061, C72063, C72071, C72073, C72081, C72083,
#       C72091, C72093, C72101, C72103, C73011, C73013, C73021, C73023,
#       C73031, C73033, C73041, C73043, C73051, C73053, C73061, C73063,
#       C73071, C73073, C73081, C73083, C73091, C73093, C73101, C73103, 
#       C7401, C7403, C7405, C7407, C7409, C7411, C7413, C7415, C7417,
#       C7419, C7421, C7423, C7425, C7427, C7429, C7431, C7433, C7435,
#       C7437, C7439, C7501, C7503, C7505, C7507, C7509, C7511, C7513,
#       C7515, C7517, C7519, C7521, C7523, C7525, C7527, C7529, C7531,
#       C7533, C7535, C7537, C7539, C7601, C7603, C7605, C7607, C7609,
#       C7611, C7613, C7615, C7617, C7619, C7621, C7623, C7625, C7627,
#       C7629, C7631, C7633, C7635, C7637, C7639)
#   )
# 
# qt_ingressantes_masculino_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(
#     c(C72012, C72014, C72022, C72024, C72032, C72034, C72042, C72044,
#       C72052, C72054, C72062, C72064, C72072, C72074, C72082, C72084,
#       C72092, C72094, C72102, C72104, C73012, C73014, C73022, C73024,
#       C73032, C73034, C73042, C73044, C73052, C73054, C73062, C73064,
#       C73072, C73074, C73082, C73084, C73092, C73094, C73102, C73104,
#       C7402, C7404, C7406, C7408, C7410, C7412, C7414, C7416, C7418,
#       C7420, C7422, C7424, C7426, C7428, C7430, C7432, C7434, C7436,
#       C7438, C7440, C7502, C7504, C7506, C7508, C7510, C7512, C7514,
#       C7516, C7518, C7520, C7522, C7524, C7526, C7528, C7530, C7532,
#       C7534, C7536, C7538, C7540, C7602, C7604, C7606, C7608, C7610,
#       C7612, C7614, C7616, C7618, C7620, C7622, C7624, C7626, C7628,
#       C7630, C7632, C7634, C7636, C7638, C7640)
#   )
# 
# qt_ingressantes_diurno_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(
#     c(C72011, C72012, C72021, C72022, C72031, C72032, C72041, C72042,
#       C72051, C72052, C72061, C72062, C72071, C72072, C72081, C72082,
#       C72091, C72092, C72101, C72102, C73011, C73012, C73021, C73022,
#       C73031, C73032, C73041, C73042, C73051, C73052, C73061, C73062,
#       C73071, C73072, C73081, C73082, C73091, C73092, C73101, C73102,
#       C7401, C7402, C7405, C7406, C7409, C7410, C7413, C7414, C7417, C7418,
#       C7421, C7422, C7425, C7426, C7429, C7430, C7433, C7434, C7437, C7438,
#       C7501, C7502, C7505, C7506, C7509, C7510, C7513, C7514, C7517, C7518,
#       C7521, C7522, C7525, C7526, C7529, C7530, C7533, C7534, C7537, C7538,
#       C7601, C7602, C7605, C7606, C7609, C7610, C7613, C7614, C7617, C7618,
#       C7621, C7622, C7625, C7626, C7629, C7630, C7633, C7634, C7637, C7638)
#   )
# 
# qt_ingressantes_noturno_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(
#     c(C72013, C72014, C72023, C72024, C72033, C72034, C72043, C72044,
#       C72053, C72054, C72063, C72064, C72073, C72074, C72083, C72084,
#       C72093, C72094, C72103, C72104, C73013, C73014, C73023, C73024,
#       C73033, C73034, C73043, C73044, C73053, C73054, C73063, C73064,
#       C73073, C73074, C73083, C73084, C73093, C73094, C73103, C73104,
#       C7403, C7404, C7407, C7408, C7411, C7412, C7415, C7416, C7419, C7420,
#       C7423, C7424, C7427, C7428, C7431, C7432, C7435, C7436, C7439, C7440,
#       C7503, C7504, C7507, C7508, C7511, C7512, C7515, C7516, C7519, C7520,
#       C7523, C7524, C7527, C7528, C7531, C7532, C7535, C7536, C7539, C7540,
#       C7603, C7604, C7607, C7608, C7611, C7612, C7615, C7616, C7619, C7620,
#       C7623, C7624, C7627, C7628, C7631, C7632, C7635, C7636, C7639, C7640)
#   )
# 
# qt_ingressantes_vestibular_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(
#     c(C72011:C72014, C72041:C72044, C72061:C72064, C72091:C72094,
#       C73011:C73014, C73041:C73044, C73061:C73064, C73091:C73094,
#       C7401:C7404, C7413:C7416, C7421:C7424, C7433:C7436,
#       C7501:C7504, C7513:C7516, C7521:C7524, C7533:C7536,
#       C7601:C7604, C7613:C7616, C7621:C7624, C7633:C7636)
#   )
# 
# qt_ingressantes_enem_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(
#     c(C72021:C72024, C72071:C72074, C73021:C73024, C73071:C73074, C7405:C7408, 
#       C7425:C7428, C7505:C7508, C7525:C7528, C7605:C7608, C7625:C7628)
#   )
# 
# qt_ingressantes_avaliacao_seriada_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(
#     c(C72031:C72034, C72081:C72084, C73031:C73034, C73081:C73084,
#       C7409:C7412, C7429:C7432, C7509:C7512, C7529:C7532, C7609:C7612, 
#       C7629:C7632)
#   )
# 
# qt_ingressantes_0_17_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C09011, C09012, C09121, C09122))
# 
# qt_ingressantes_18_24_2005 <- cursos_ies_2005_1 |>
#   dplyr::select(c(C09021, C09022, C09131, C09132))
# 
# qt_ingressantes_25_29_2005 <- cursos_ies_2005_1 |>
#   dplyr::select(c(C09031, C09032, C09141, C09142))
# 
# qt_ingressantes_30_34_2005 <- cursos_ies_2005_1 |>
#   dplyr::select(c(C09041, C09042, C09151, C09152))
# 
# qt_ingressantes_35_39_2005 <- cursos_ies_2005_1 |>
#   dplyr::select(c(C09051, C09052, C09161, C09162))
# 
# qt_ingressantes_40_49_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C09061:C09072, C09171:C09182))
# 
# qt_ingressantes_50_59_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C09081:C09092, C09191:C09202))
# 
# qt_ingressantes_60_mais_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C09101:C09112, C09211:C09222))
# 
# # apenas para o primeiro semestre
# qt_ingressantes_preta_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C138014, C138015, C138024, C138025))
# 
# # apenas para o primeiro semestre
# qt_ingressantes_parda_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C138034, C138035, C138044, C138045))
# 
# # foi considerado como índios e remanescentes de quilombolas
# # apenas para o primeiro semestre
# qt_ingressantes_indigena_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C138054:C138055, C138064:C138065, C138074:C138075, C138084:C138085))
# 
# # apenas para o primeiro semestre
# qt_ingressantes_deficiencia_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C138094, C138095, C138104, C138105))
# 
# qt_concluintes_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C8111:C8124))
# 
# qt_concluintes_feminino_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C8111, C8113, C8121, C8123))
# 
# qt_concluintes_masculino_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C8112, C8114, C8122, C8124))
# 
# qt_concluintes_diurno_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C8111, C8112, C8121, C8122))
# 
# qt_concluintes_noturno_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C8113, C8114, C8123, C8124))
# 
# # apenas para o primeiro semestre
# qt_concluintes_preta_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C138016, C138017, C138026, C138027))
# 
# # apenas para o primeiro semestre
# qt_concluintes_parda_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C138036, C138037, C138046, C138047))
# 
# # foi considerado como índios e remanescentes de quilombolas
# # apenas para o primeiro semestre
# qt_concluintes_indigena_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C138056:C138057, C138066:C138067, C138076:C138077, C138086:C138087))
# 
# # apenas para o primeiro semestre
# qt_concluintes_deficiencia_2005 <- cursos_ies_2005_1 |> 
#   dplyr::select(c(C138096, C138097, C138106, C138107))
# 
# 
# cursos_ies_2005_2 <- cursos_ies_2005_1 |> 
#   dplyr::select(
#     c(
#       ANO, SIGLA_UF_CURSO, CODMUNIC, MOD_PRESENC, CATEGADM, MASCARA, 
#       NOMEDOCURSO, CURSO, NOMEAREAGERAL, CODAREAGERAL, NOMEAREAESPECIFICA, 
#       CODAREAESPECIFICA, NOMEAREADETALHADA, CODAREADETALHADA
#     )
#   ) |> 
#   dplyr::mutate(
#     quantidade_ingressantes = rowSums(qt_ingressantes_2005, na.rm = TRUE),
#     quantidade_ingressantes_feminino = rowSums(qt_ingressantes_feminino_2005, na.rm = TRUE),
#     quantidade_ingressantes_masculino = rowSums(qt_ingressantes_masculino_2005, na.rm = TRUE),
#     quantidade_ingressantes_diurno = rowSums(qt_ingressantes_diurno_2005, na.rm = TRUE),
#     quantidade_ingressantes_noturno = rowSums(qt_ingressantes_noturno_2005, na.rm = TRUE),
#     quantidade_ingressantes_vestibular = rowSums(qt_ingressantes_vestibular_2005, na.rm = TRUE),
#     quantidade_ingressantes_enem = rowSums(qt_ingressantes_enem_2005, na.rm = TRUE),
#     quantidade_ingressantes_avaliacao_seriada = rowSums(qt_ingressantes_avaliacao_seriada_2005, na.rm = TRUE),
#     quantidade_ingressantes_0_17 = rowSums(qt_ingressantes_0_17_2005, na.rm = TRUE),
#     quantidade_ingressantes_18_24 = rowSums(qt_ingressantes_18_24_2005, na.rm = TRUE),
#     quantidade_ingressantes_25_29 = rowSums(qt_ingressantes_25_29_2005, na.rm = TRUE),
#     quantidade_ingressantes_30_34 = rowSums(qt_ingressantes_30_34_2005, na.rm = TRUE),
#     quantidade_ingressantes_35_39 = rowSums(qt_ingressantes_35_39_2005, na.rm = TRUE),
#     quantidade_ingressantes_40_49 = rowSums(qt_ingressantes_40_49_2005, na.rm = TRUE),
#     quantidade_ingressantes_50_59 = rowSums(qt_ingressantes_50_59_2005, na.rm = TRUE),
#     quantidade_ingressantes_60_mais = rowSums(qt_ingressantes_60_mais_2005, na.rm = TRUE),
#     quantidade_ingressantes_branca = NA,
#     quantidade_ingressantes_preta = rowSums(qt_ingressantes_preta_2005, na.rm = TRUE),
#     quantidade_ingressantes_parda = rowSums(qt_ingressantes_parda_2005, na.rm = TRUE),
#     quantidade_ingressantes_amarela = NA,
#     quantidade_ingressantes_indigena = rowSums(qt_ingressantes_indigena_2005, na.rm = TRUE),
#     quantidade_ingressantes_nao_declarada = NA,
#     quantidade_ingressantes_brasileiro = NA,
#     quantidade_ingressantes_estrangeiro = NA,
#     quantidade_ingressantes_deficiencia = rowSums(qt_ingressantes_deficiencia_2005, na.rm = TRUE),
#     quantidade_concluintes = rowSums(qt_concluintes_2005, na.rm = TRUE),
#     quantidade_concluintes_feminino = rowSums(qt_concluintes_feminino_2005, na.rm = TRUE),
#     quantidade_concluintes_masculino = rowSums(qt_concluintes_masculino_2005, na.rm = TRUE),
#     quantidade_concluintes_diurno = rowSums(qt_concluintes_diurno_2005, na.rm = TRUE),
#     quantidade_concluintes_noturno = rowSums(qt_concluintes_noturno_2005, na.rm = TRUE),
#     quantidade_concluintes_0_17 = NA,
#     quantidade_concluintes_18_24 = NA,
#     quantidade_concluintes_25_29 = NA,
#     quantidade_concluintes_30_34 = NA,
#     quantidade_concluintes_35_39 = NA,
#     quantidade_concluintes_40_49 = NA,
#     quantidade_concluintes_50_59 = NA,
#     quantidade_concluintes_60_mais = NA,
#     quantidade_concluintes_branca = NA,
#     quantidade_concluintes_preta = rowSums(qt_concluintes_preta_2005, na.rm = TRUE),
#     quantidade_concluintes_parda = rowSums(qt_concluintes_parda_2005, na.rm = TRUE),
#     quantidade_concluintes_amarela = NA,
#     quantidade_concluintes_indigena = rowSums(qt_concluintes_indigena_2005, na.rm = TRUE),
#     quantidade_concluintes_nao_declarada = NA,
#     quantidade_concluintes_brasileiro = NA,
#     quantidade_concluintes_estrangeiro = NA,
#     quantidade_concluintes_deficiencia = rowSums(qt_concluintes_deficiencia_2005, na.rm = TRUE),
#   )
# 
# 
# cursos_ies_2005 <- cursos_ies_2005_2 |> 
#   dplyr::mutate(
#     MOD_PRESENC = dplyr::case_when(
#       MOD_PRESENC == "S" ~ "1",
#       TRUE ~ "2"
#     ),
#     REDE = dplyr::case_when(
#       CATEGADM == "PRIVADA" ~ "2",
#       TRUE ~ "1"
#     ),
#     CATEGADM = dplyr::case_when(
#       CATEGADM == "FEDERAL" ~ "1",
#       CATEGADM == "ESTADUAL" ~ "2",
#       CATEGADM == "MUNICIPAL" ~ "3",
#       CATEGADM == "PRIVADA" ~ "4"
#     ),
#     nome = NA,
#     sigla = NA,
#     MASCARA = as.character(MASCARA)
#   ) |> 
#   dplyr::rename(
#     "ano" = "ANO",
#     "sigla_uf" = "SIGLA_UF_CURSO",
#     "id_municipio" = "CODMUNIC",
#     "tipo_modalidade_ensino" = "MOD_PRESENC",
#     "tipo_categoria_administrativa" = "CATEGADM",
#     "rede" = "REDE",
#     "id_ies" = "MASCARA",
#     "nome_curso" = "NOMEDOCURSO",
#     "id_curso" = "CURSO",
#     "nome_area_geral" = "NOMEAREAGERAL",
#     "id_area_geral" = "CODAREAGERAL",
#     "nome_area_especifica" = "NOMEAREAESPECIFICA",
#     "id_area_especifica" = "CODAREAESPECIFICA",
#     "nome_area_detalhada" = "NOMEAREADETALHADA",
#     "id_area_detalhada" = "CODAREADETALHADA"
#   ) |> 
#   dplyr::relocate(nome, sigla, .after = id_area_especifica) |> 
#   dplyr::relocate(rede, .after = tipo_categoria_administrativa)



# união das bases cursos_ies (2009 a 2022) em uma só ----------------------

cursos_ies_09_22 <- dplyr::bind_rows(
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
)

# cursos_ies_05_08 <- dplyr::bind_rows(
#   cursos_ies_2005,
#   cursos_ies_2006,
#   cursos_ies_2007,
#   cursos_ies_2008
# )

cursos_ies <- dplyr::bind_rows(
  # cursos_ies_2005,
  # cursos_ies_2006,
  # cursos_ies_2007,
  # cursos_ies_2008,
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
  # dplyr::mutate(
  #   sisu = dplyr::case_when(
  #     quantidade_ingressantes_enem > quantidade_ingressantes_vestibular ~ "1",
  #     quantidade_ingressantes_enem < quantidade_ingressantes_vestibular ~ "0",
  #     TRUE ~ NA_character_
  #   )
  # ) |> 
  # dplyr::relocate(nome, sigla, sisu, .before = id_ies)


# filtrando apenas cursos presenciais de instituições públicas -------------

cursos_ies_publicas_presenciais <- cursos_ies |> 
  dplyr::filter(
    # apenas cursos presenciais
    TP_MODALIDADE_ENSINO == "1" &
      # apenas cursos públicos
      TP_REDE == "1" &
      # apenas cursos de instituições públicas federais e estaduais
      TP_CATEGORIA_ADMINISTRATIVA %in% c("1", "2")
  )


# organização e união dos dados brutos ------------------------------------
# (chamada regular do sisu) em uma tabela ---------------------------------


# ano de 2022 -------------------------------------------------------------

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


# ano de 2021 -------------------------------------------------------------

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
   
  

# ano de 2020 -------------------------------------------------------------

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

# ano de 2019 -------------------------------------------------------------

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


# ano de 2018 -------------------------------------------------------------

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


# ano de 2017 -------------------------------------------------------------

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



# união das bases sisu (2017 a 2022) em uma só ----------------------------

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

# ano de 2023 -------------------------------------------------------------

# sisu_vagas_ofertadas_2023 <- dplyr::bind_rows(
#   vagas_ofertadas_2023_1,
#   vagas_ofertadas_2023_2
# ) |> 
#   dplyr::rename(
#     "QT_VAGAS_OFERTADAS" = "QT_VAGAS_CONCORRENCIA"
#   )


# ano de 2022 -------------------------------------------------------------

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


# ano de 2021 -------------------------------------------------------------

sisu_vagas_ofertadas_2021 <- dplyr::bind_rows(
  vagas_ofertadas_2021_1,
  dplyr::mutate(
  vagas_ofertadas_2021_2,
  NU_PERCENTUAL_BONUS = as.numeric(NU_PERCENTUAL_BONUS)
  )
)


# ano de 2020 -------------------------------------------------------------

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

# ano de 2019 -------------------------------------------------------------

sisu_vagas_ofertadas_2019 <- dplyr::bind_rows(
  vagas_ofertadas_2019_1,
  vagas_ofertadas_2019_2
) |> 
  dplyr::rename(
    "QT_VAGAS_OFERTADAS" = "QT_VAGAS_CONCORRENCIA"
  )


# ano de 2010 a 2018 ------------------------------------------------------

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
  # sisu_vagas_ofertadas_2023
) |> 
  dplyr::mutate(
    NU_ANO = as.integer(NU_ANO),
    NU_EDICAO = as.character(NU_EDICAO),
    CO_IES = as.character(CO_IES),
    CO_IES_CURSO = as.character(CO_IES_CURSO)
  ) |> 
  janitor::clean_names()


# salvando a base em formato RDS ------------------------------------------

# readr::write_rds(
#   cursos_ies,
#   here::here("dados", "rds", "cursos_ies.rds"),
#   compress = "gz"
# )

# readr::write_rds(
#   cursos_ies_05_08,
#   here::here("dados", "rds", "cursos_ies_05_08.rds"),
#   compress = "gz"
# )

readr::write_rds(
  cursos_ies,
  here::here("dados", "dados_tratados", "rds", "cursos_ies_tds_variaveis.rds"),
  compress = "gz"
)

# readr::write_rds(
#   cursos_ies_09_22,
#   here::here("dados", "dados_tratados", "rds", "cursos_ies_09_22.rds"),
#   compress = "gz"
# )

readr::write_rds(
  cursos_ies_publicas_presenciais,
  here::here("dados", "dados_tratados", "rds", "cursos_ies_publicas_presenciais_tds_variaveis.rds"),
  compress = "gz"
)

# readr::write_rds(
#   cursos_ies_publicas_presenciais,
#   here::here("dados", "dados_tratados", "rds", "cursos_ies_publicas_presenciais.rds"),
#   compress = "gz"
# )

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

# write.csv(
#   cursos_ies,
#   here::here("dados", "csv", "cursos_ies.csv"),
#   fileEncoding = "UTF-8"
# )

# write.csv(
#   cursos_ies_05_08,
#   here::here("dados", "csv", "cursos_ies_05_08.csv"),
#   fileEncoding = "UTF-8"
# )

write.csv(
  cursos_ies,
  here::here("dados", "dados_tratados", "csv", "cursos_ies_tds_variaveis.csv"),
  fileEncoding = "UTF-8"
)

# write.csv(
#   cursos_ies_09_22,
#   here::here("dados", "dados_tratados", "csv", "cursos_ies_09_22.csv"),
#   fileEncoding = "UTF-8"
# )

write.csv(
  cursos_ies_publicas_presenciais,
  here::here("dados", "dados_tratados", "csv", "cursos_ies_publicas_presenciais_tds_variaveis.csv"),
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
