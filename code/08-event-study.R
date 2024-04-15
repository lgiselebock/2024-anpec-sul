
options(scipen = 999)
library(ggplot2)

# importação da base ------------------------------------------------------

base_completa_filtrada <- readr::read_rds(
  here::here("data", "rds", "base_completa_filtrada.rds")
)

# EVENT STUDY -------------------------------------------------------------

# ajustes para o event study

base_event_study <- base_completa_filtrada |>
  dplyr::group_by(co_ies, co_curso) |>
  dplyr::mutate(
    # cria uma variável contínua de tempo: 1, 2, 3,... para os anos de 2009 a 2022
    tempo = dplyr::case_when(
      nu_ano_censo == 2009 ~ 1,
      nu_ano_censo == 2010 ~ 2,
      nu_ano_censo == 2011 ~ 3,
      nu_ano_censo == 2012 ~ 4,
      nu_ano_censo == 2013 ~ 5,
      nu_ano_censo == 2014 ~ 6,
      nu_ano_censo == 2015 ~ 7,
      nu_ano_censo == 2016 ~ 8,
      nu_ano_censo == 2017 ~ 9,
      nu_ano_censo == 2018 ~ 10,
      nu_ano_censo == 2019 ~ 11,
      nu_ano_censo == 2020 ~ 12,
      nu_ano_censo == 2021 ~ 13,
      nu_ano_censo == 2022 ~ 14,
    ),
    # gera uma variável que seja igual ao período (ano) que o curso foi tratado
    ano_sisu = dplyr::case_when(
      nu_ano_censo == ano_min ~ ano_min,
      TRUE ~ NA
    ),
    # preenche a coluna com os valores dela mesma
    ano_sisu = zoo::na.locf(ano_sisu, na.rm = FALSE),
    ano_sisu = zoo::na.locf(ano_sisu, na.rm = FALSE, fromLast = TRUE),
    # gera uma variável que é a diferença entre as duas variáveis anteriores
    dados_evento = nu_ano_censo - ano_sisu
  ) |>
  dplyr::ungroup()


# gera uma variável dummy igual a 1, para cada um desses períodos.
# Por exemplo, D_+1 é igual a 1 para um período após o sisu,
# D_+2 é igual a 1 para dois períodos após o sisu e assim por diante.
# for (t in -13:13) {
#   a <- c(t)
#   base_completa_filtrada[paste0("D_", a)] <- (base_completa_filtrada$dados_evento == t) * (base_completa_filtrada$tempo_tratamento/base_completa_filtrada$tempo_tratamento)
#   names(base_completa_filtrada)[ncol(base_completa_filtrada)] <- paste0("D_", a)
for (t in -12:12) {
   a <- c(t)
  base_event_study[paste0("D_", a)] <- (base_event_study$dados_evento == t) * (base_event_study$ano_sisu/base_event_study$ano_sisu)
  names(base_event_study)[ncol(base_event_study)] <- paste0("D_", a)
}


base_event_study <- base_event_study |>
  janitor::clean_names()


base_event_study_agrupada <- base_event_study |>
  janitor::clean_names()  |>
  dplyr::group_by(nu_ano_censo, co_ies, co_curso) |>
  dplyr::mutate(
    d_4 = sum(d_12, d_11, d_10, d_9, d_8, d_7, d_6, d_5, d_4, na.rm = TRUE),
    # d_4_2 = sum(d_4_2, d_5_2, d_6_2, d_7_2, d_8_2, d_9_2, d_10_2, d_11_2, d_12_2, na.rm = TRUE),
  ) |>
  dplyr::ungroup() |>
  dplyr::select(
    -c(
      d_12:d_5,
      # d_5_2:d_12_2
    )
  )


# write.csv(
#   base_event_study,
#   "dados/dados_tratados/csv/base_event_study.csv",
#   fileEncoding = "UTF-8"
# )


# modelos de event-study --------------------------------------------------

# modelo 1: feminino

# mod_feminino <- plm::plm(
#   perc_ing_feminino ~
#     # d_12 + d_11 + d_10 + d_9 + d_8 + d_7 + d_6 + d_5 +
#     d_4 + d_3 + d_2 + d_0 + d_1_2 + d_2_2 + d_3_2 + d_4_2 + d_5_2 +
#     d_6_2 + d_7_2 + d_8_2 + d_9_2 + d_10_2 + d_11_2 + d_12_2,
#   data = base_event_study_agrupada,
#   # index = c("nu_ano_censo", "co_curso", "co_uf"),
#   index = c("co_curso", "nu_ano_censo", "co_uf"),
#   model = "within"
# )

# sum_feminino <- summary(mod_feminino)

# tab_es_feminino <- data.frame(
#   tempo = c(
#     # -12, -11, -10, -9, -8, -7, -6, -5,
#     -4, -3, -2, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
#   ),
#   coeficientes = as.numeric(mod_feminino$coefficients),
#   sd = sum_feminino$coefficients[, "Std. Error"]
# ) |>
# dplyr::add_row(
#   tempo = -1,
#   coeficientes = 0,
#   sd = 0
# ) |>
# dplyr::arrange(tempo)

modelo_alt_feminino <- fixest::feols(
  perc_ing_feminino ~
    d_4 + d_3 + d_2 + d_0 + d_1_2 + d_2_2 + d_3_2 + d_4_2 + d_5_2 +
    d_6_2 + d_7_2 + d_8_2 + d_9_2 + d_10_2 + d_11_2 + d_12_2 |
    co_curso + nu_ano_censo + co_uf,
  data = base_event_study_agrupada,
)

summary_alt_feminino <- summary(modelo_alt_feminino)

tab_alt_es_feminino <- data.frame(
  tempo = c(-4, -3, -2, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
  coeficientes = as.numeric(modelo_alt_feminino$coefficients),
  sd = summary_alt_feminino$se
) |>
dplyr::add_row(
  tempo = -1,
  coeficientes = 0,
  sd = 0
) |>
dplyr::arrange(tempo)

graf_es_feminino <- tab_alt_es_feminino |>
  ggplot(aes(x = tempo, y = coeficientes)) +
  geom_hline(yintercept = 0, color = "black") +
  geom_vline(
    xintercept = 0,
    color = "red",
    linetype = "dashed",
    linewidth = 0.5
  ) +
  geom_errorbar(
    aes(
      ymin = coeficientes - 1.96 * sd,
      ymax = coeficientes + 1.96 * sd
    ),
    width = 0.1,
    color = "grey60",
    linetype = "dashed",
  ) +
  geom_line(
    color = "darkblue",
    linewidth = 0.75
  ) +
  geom_point(
    color = "darkblue",
    size = 1
  ) +
  # geom_ribbon(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   alpha = 0.2
  # ) +
  # geom_errorbar(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   width = 0.1
  # ) +
  # scale_x_continuous(breaks = seq(-12, 12, 1)) +
  scale_x_continuous(breaks = seq(-4, 12, 1)) +
  # scale_y_continuous(
  #   limits = c(-0.05, 0.15),
  #   breaks = seq(-0.1, 0.2, 0.05)
  # ) +
  scale_y_continuous(
    limits = c(-0.15, 0.15),
    breaks = seq(-0.15, 0.15, 0.03)
  ) +
  labs(
    # title = "Event Study with Panel Data",
     x = "Anos antes/após o SISU",
     y = "Coeficientes"
  ) +
  theme_minimal() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    axis.text = element_text(size = 8),
    axis.title = element_text(size = 10),
    text = element_text(family = "Times New Roman")
  )

graf_es_feminino

# ggsave(
#   filename = "imagens/03-graf_es_feminino.png",
#   plot = graf_es_feminino,
#   width = 8,
#   height = 4,
#   units = "in",
#   dpi = 300
# )

ggsave(
  filename = "img/03-graf_es_feminino.png",
  plot = graf_es_feminino,
  width = 3.5,
  height = 1.75,
  units = "in",
  dpi = 300
)


# modelo 2: idade 0-17

# mod_idade_0_17 <- plm::plm(
#   perc_ing_0_17 ~
#   # d_12 + d_11 + d_10 + d_9 + d_8 + d_7 + d_6 + d_5 +
#   d_4 + d_3 + d_2 + d_0 + d_1_2 + d_2_2 + d_3_2 + d_4_2 + d_5_2 +
#   d_6_2 + d_7_2 + d_8_2 + d_9_2 + d_10_2 + d_11_2 + d_12_2,
#   data = base_event_study_agrupada,
#   index = c("co_curso", "nu_ano_censo", "co_uf"),
#   model = "within"
# )

# sum_idade_0_17 <- summary(mod_idade_0_17)

# tab_es_idade_0_17 <- data.frame(
#   tempo = c(
#     # -12, -11, -10, -9, -8, -7, -6, -5,
#     -4, -3, -2, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
#   ),
#   coeficientes = as.numeric(mod_idade_0_17$coefficients),
#   sd = sum_idade_0_17$coefficients[, "Std. Error"]
# ) |>
# dplyr::add_row(
#   tempo = -1,
#   coeficientes = 0,
#   sd = 0
# ) |>
# dplyr::arrange(tempo)

modelo_alt_idade_0_17 <- fixest::feols(
  perc_ing_0_17 ~
    d_4 + d_3 + d_2 + d_0 + d_1_2 + d_2_2 + d_3_2 + d_4_2 + d_5_2 +
    d_6_2 + d_7_2 + d_8_2 + d_9_2 + d_10_2 + d_11_2 + d_12_2 |
    co_curso + nu_ano_censo + co_uf,
  data = base_event_study_agrupada,
)

summary_alt_idade_0_17 <- summary(modelo_alt_idade_0_17)

tab_alt_es_idade_0_17 <- data.frame(
  tempo = c(-4, -3, -2, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
  coeficientes = as.numeric(modelo_alt_idade_0_17$coefficients),
  sd = summary_alt_idade_0_17$se
) |>
dplyr::add_row(
  tempo = -1,
  coeficientes = 0,
  sd = 0
) |>
dplyr::arrange(tempo)

graf_es_idade_0_17 <- tab_alt_es_idade_0_17 |>
  ggplot(aes(x = tempo, y = coeficientes)) +
  geom_hline(yintercept = 0, color = "black") +
  geom_vline(
    xintercept = 0,
    color = "red",
    linetype = "dashed",
    linewidth = 0.8
  ) +
  geom_errorbar(
    aes(
      ymin = coeficientes - 1.96 * sd,
      ymax = coeficientes + 1.96 * sd
    ),
    width = 0.1,
    color = "grey60",
    linetype = "dashed"
  ) +
  geom_line(
    color = "darkblue",
    linewidth = 0.75
  ) +
  geom_point(
    color = "darkblue",
    size = 1
  ) +
  # scale_x_continuous(breaks = seq(-12, 12, 1)) +
  scale_x_continuous(breaks = seq(-4, 12, 1)) +
  # scale_y_continuous(
  #   limits = c(-0.05, 0.15),
  #   breaks = seq(-0.1, 0.2, 0.05)
  # ) +
  scale_y_continuous(
    limits = c(-0.15, 0.15),
    breaks = seq(-0.15, 0.15, 0.03)
  ) +
  labs(
    # title = "Event Study with Panel Data",
    x = "Anos antes/após o SISU",
    y = "Coeficientes"
  ) +
  theme_minimal() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    axis.text = element_text(size = 8),
    axis.title = element_text(size = 10),
    text = element_text(family = "Times New Roman")
  )

graf_es_idade_0_17

ggsave(
  filename = "img/04-graf_es_idade_0_17.png",
  plot = graf_es_idade_0_17,
  width = 3.5,
  height = 2,
  units = "in",
  dpi = 300
)


# modelo 3: idade 18-24

mod_idade_18_24 <- plm::plm(
  perc_ing_18_24 ~
  # d_12 + d_11 + d_10 + d_9 + d_8 + d_7 + d_6 + d_5 +
    d_4 + d_3 + d_2 + d_0 + d_1_2 + d_2_2 + d_3_2 + d_4_2 + d_5_2 +
    d_6_2 + d_7_2 + d_8_2 + d_9_2 + d_10_2 + d_11_2 + d_12_2,
  data = base_event_study_agrupada,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within",
)

sum_idade_18_24 <- summary(mod_idade_18_24)


tab_es_idade_18_24 <- data.frame(
  tempo = c(
    # -12, -11, -10, -9, -8, -7, -6, -5,
    -4, -3, -2, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
  ),
  coeficientes = as.numeric(mod_idade_18_24$coefficients),
  sd = sum_idade_18_24$coefficients[, "Std. Error"]
) |>
dplyr::add_row(
  tempo = -1,
  coeficientes = 0,
  sd = 0
) |>
dplyr::arrange(tempo)


graf_es_idade_18_24 <- tab_es_idade_18_24 |>
  ggplot(aes(x = tempo, y = coeficientes)) +
  geom_hline(yintercept = 0, color = "black") +
  geom_vline(
    xintercept = 0,
    color = "red",
    linetype = "dashed",
    linewidth = 0.8
  ) +
  geom_errorbar(
    aes(
      ymin = coeficientes - 1.96 * sd,
      ymax = coeficientes + 1.96 * sd
    ),
    width = 0.1,
    color = "grey60",
    linetype = "dashed"
  ) +
  geom_line(
    color = "darkblue",
    linewidth = 0.75
  ) +
  geom_point(
    color = "darkblue",
    size = 1
  ) +
  # geom_ribbon(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   alpha = 0.2
  # ) +
  # geom_errorbar(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   width = 0.1
  # ) +
  # scale_x_continuous(breaks = seq(-12, 12, 1)) +
  scale_x_continuous(breaks = seq(-4, 12, 1)) +
  # scale_y_continuous(
  #   limits = c(-0.05, 0.15),
  #   breaks = seq(-0.1, 0.2, 0.05)
  # ) +
scale_y_continuous(
  limits = c(-0.15, 0.15),
  breaks = seq(-0.15, 0.15, 0.03)
) +
  labs(
    # title = "Event Study with Panel Data",
    x = "Anos antes/após o SISU",
    y = "Coeficientes"
  ) +
  theme_minimal() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    axis.text = element_text(size = 8),
    axis.title = element_text(size = 10),
    text = element_text(family = "Times New Roman")
  )

graf_es_idade_18_24

ggsave(
  filename = "img/05-graf_es_idade_18_24.png",
  plot = graf_es_idade_18_24,
  width = 3.5,
  height = 2,
  units = "in",
  dpi = 300
)


# modelo 4: idade 25-29

mod_idade_25_29 <- plm::plm(
  perc_ing_25_29 ~
  # d_12 + d_11 + d_10 + d_9 + d_8 + d_7 + d_6 + d_5 +
    d_4 + d_3 + d_2 + d_0 + d_1_2 + d_2_2 + d_3_2 + d_4_2 + d_5_2 +
    d_6_2 + d_7_2 + d_8_2 + d_9_2 + d_10_2 + d_11_2 + d_12_2,
  data = base_event_study_agrupada,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within",
)

sum_idade_25_29 <- summary(mod_idade_25_29)

tab_es_idade_25_29 <- data.frame(
  tempo = c(
    # -12, -11, -10, -9, -8, -7, -6, -5,
    -4, -3, -2, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
  ),
  coeficientes = as.numeric(mod_idade_25_29$coefficients),
  sd = sum_idade_25_29$coefficients[, "Std. Error"]
) |>
dplyr::add_row(
  tempo = -1,
  coeficientes = 0,
  sd = 0
) |>
dplyr::arrange(tempo)


graf_es_idade_25_29 <- tab_es_idade_25_29 |>
  ggplot(aes(x = tempo, y = coeficientes)) +
  geom_hline(yintercept = 0, color = "black") +
  geom_vline(
    xintercept = 0,
    color = "red",
    linetype = "dashed",
    linewidth = 0.8
  ) +
  geom_errorbar(
    aes(
      ymin = coeficientes - 1.96 * sd,
      ymax = coeficientes + 1.96 * sd
    ),
    width = 0.1,
    color = "grey60",
    linetype = "dashed"
  ) +
  geom_line(
    color = "darkblue",
    linewidth = 0.75
  ) +
  geom_point(
    color = "darkblue",
    size = 1
  ) +
  # geom_ribbon(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   alpha = 0.2
  # ) +
  # geom_errorbar(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   width = 0.1
  # ) +
  # scale_x_continuous(breaks = seq(-12, 12, 1)) +
  scale_x_continuous(breaks = seq(-4, 12, 1)) +
  # scale_y_continuous(
  #   limits = c(-0.05, 0.15),
  #   breaks = seq(-0.1, 0.2, 0.05)
  # ) +
  scale_y_continuous(
    limits = c(-0.15, 0.15),
    breaks = seq(-0.15, 0.15, 0.03)
  ) +
  labs(
    # title = "Event Study with Panel Data",
    x = "Anos antes/após o SISU",
    y = "Coeficientes"
  ) +
  theme_minimal() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    axis.text = element_text(size = 8),
    axis.title = element_text(size = 10),
    text = element_text(family = "Times New Roman")
  )

graf_es_idade_25_29

ggsave(
  filename = "img/06-graf_es_idade_25_29.png",
  plot = graf_es_idade_25_29,
  width = 3.5,
  height = 2,
  units = "in",
  dpi = 300
)


# modelo 3: não-brancos

mod_nao_branco <- plm::plm(
  perc_ing_nao_branca ~
  # d_12 + d_11 + d_10 + d_9 + d_8 + d_7 + d_6 + d_5 +
    d_4 + d_3 + d_2 + d_0 + d_1_2 + d_2_2 + d_3_2 + d_4_2 + d_5_2 +
    d_6_2 + d_7_2 + d_8_2 + d_9_2 + d_10_2 + d_11_2 + d_12_2,
  data = base_event_study_agrupada,
  index = c("nu_ano_censo", "co_curso", "co_uf"),
  model = "within",
)

sum_nao_branco <- summary(mod_nao_branco)

tab_es_nao_branco <- data.frame(
  tempo = c(
    # -12, -11, -10, -9, -8, -7, -6, -5,
    -4, -3, -2, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
  ),
  coeficientes = as.numeric(mod_nao_branco$coefficients),
  sd = sum_nao_branco$coefficients[, "Std. Error"]
) |>
dplyr::add_row(
  tempo = -1,
  coeficientes = 0,
  sd = 0
) |>
dplyr::arrange(tempo)


graf_es_nao_branco <- tab_es_nao_branco |>
  ggplot(aes(x = tempo, y = coeficientes)) +
  geom_hline(yintercept = 0, color = "black") +
  geom_vline(
    xintercept = 0,
    color = "red",
    linetype = "dashed",
    linewidth = 0.8
  ) +
  geom_errorbar(
    aes(
      ymin = coeficientes - 1.96 * sd,
      ymax = coeficientes + 1.96 * sd
    ),
    width = 0.1,
    color = "grey60",
    linetype = "dashed"
  ) +
  geom_line(
    color = "darkblue",
    linewidth = 0.75
  ) +
  geom_point(
    color = "darkblue",
    size = 1
  ) +
  # geom_ribbon(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   alpha = 0.2
  # ) +
  # geom_errorbar(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   width = 0.1
  # ) +
  # scale_x_continuous(breaks = seq(-12, 12, 1)) +
  scale_x_continuous(breaks = seq(-4, 12, 1)) +
  # scale_y_continuous(
  #   limits = c(-0.05, 0.15),
  #   breaks = seq(-0.1, 0.2, 0.05)
  # ) +
  scale_y_continuous(
    limits = c(-0.15, 0.15),
    breaks = seq(-0.15, 0.15, 0.03)
  ) +
  labs(# title = "Event Study with Panel Data",
    x = "Anos antes/após o SISU",
    y = "Coeficientes"
  ) +
  theme_minimal() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    axis.text = element_text(size = 8),
    axis.title = element_text(size = 10),
    text = element_text(family = "Times New Roman")
  )

graf_es_nao_branco

ggsave(
  filename = "img/07-graf_es_naobranco.png",
  plot = graf_es_nao_branco,
  width = 3.5,
  height = 2,
  units = "in",
  dpi = 300
)


# modelo 4: deficientes


mod_deficiente <- plm::plm(
  perc_ing_deficiencia ~
    d_4 + d_3 + d_2 + d_0 + d_1_2 + d_2_2 + d_3_2 + d_4_2 + d_5_2 +
    d_6_2 + d_7_2 + d_8_2 + d_9_2 + d_10_2 + d_11_2 + d_12_2,
  data = base_event_study_agrupada,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

sum_deficiente <- summary(mod_deficiente)

tab_es_deficiente <- data.frame(
  tempo = c(-4, -3, -2, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
  coeficientes = as.numeric(mod_deficiente$coefficients),
  sd = sum_deficiente$coefficients[, "Std. Error"]
) |>
dplyr::add_row(
  tempo = -1,
  coeficientes = 0,
  sd = 0
) |>
dplyr::arrange(tempo)


graf_es_deficiente <- tab_es_deficiente |>
  ggplot(aes(x = tempo, y = coeficientes)) +
  geom_hline(yintercept = 0, color = "black") +
  geom_vline(
    xintercept = 0,
    color = "red",
    linetype = "dashed",
    linewidth = 0.8
  ) +
  geom_errorbar(
    aes(
      ymin = coeficientes - 1.96 * sd,
      ymax = coeficientes + 1.96 * sd
    ),
    width = 0.1,
    color = "grey60",
    linetype = "dashed"
  ) +
  geom_line(
    color = "darkblue",
    linewidth = 0.75
  ) +
  geom_point(
    color = "darkblue",
    size = 1
  ) +
  # geom_ribbon(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   alpha = 0.2
  # ) +
  # geom_errorbar(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   width = 0.1
  # ) +
  scale_x_continuous(breaks = seq(-4, 12, 1)) +
  # scale_y_continuous(
  #   limits = c(-0.05, 0.15),
  #   breaks = seq(-0.1, 0.2, 0.05)
  # ) +
  scale_y_continuous(
    limits = c(-0.15, 0.15),
    breaks = seq(-0.15, 0.15, 0.03)
  ) +
  labs(
    # title = "Event Study with Panel Data",
    x = "Anos antes/após o SISU",
    y = "Coeficientes") +
  theme_minimal() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    axis.text = element_text(size = 8),
    axis.title = element_text(size = 10),
    text = element_text(family = "Times New Roman")
  )

graf_es_deficiente

ggsave(
  filename = "img/08-graf_es_deficiente.png",
  plot = graf_es_deficiente,
  width = 3.5,
  height = 2,
  units = "in",
  dpi = 300
)


# modelo 5: escola pública

mod_escola_publica <- plm::plm(
  perc_ing_escola_publica ~
    d_4 + d_3 + d_2 + d_0 + d_1_2 + d_2_2 + d_3_2 + d_4_2 + d_5_2 +
    d_6_2 + d_7_2 + d_8_2 + d_9_2 + d_10_2 + d_11_2 + d_12_2,
  data = base_event_study_agrupada,
  index = c("nu_ano_censo", "co_curso", "co_uf"),
  model = "within"
)

sum_escola_publica <- summary(mod_escola_publica)

tab_es_escola_publica <- data.frame(
  tempo = c(-4, -3, -2, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
  coeficientes = as.numeric(mod_escola_publica$coefficients),
  sd = sum_escola_publica$coefficients[, "Std. Error"]
) |>
dplyr::add_row(
  tempo = -1,
  coeficientes = 0,
  sd = 0
) |>
dplyr::arrange(tempo)

graf_es_escola_publica <- tab_es_escola_publica |>
  ggplot(aes(x = tempo, y = coeficientes)) +
  geom_hline(yintercept = 0, color = "black") +
  geom_vline(
    xintercept = 0,
    color = "red",
    linetype = "dashed",
    linewidth = 0.8
  ) +
  geom_errorbar(
    aes(
      ymin = coeficientes - 1.96 * sd,
      ymax = coeficientes + 1.96 * sd
    ),
    width = 0.1,
    color = "grey60",
    linetype = "dashed"
  ) +
  geom_line(
    color = "darkblue",
    linewidth = 0.75
  ) +
  geom_point(
    color = "darkblue",
    size = 1
  ) +
  # geom_ribbon(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   alpha = 0.2
  # ) +
  # geom_errorbar(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   width = 0.1
  # ) +
  scale_x_continuous(breaks = seq(-4, 12, 1)) +
  # scale_y_continuous(
  #   limits = c(-0.05, 0.15),
  #   breaks = seq(-0.1, 0.2, 0.05)
  # ) +
  scale_y_continuous(
    limits = c(-0.15, 0.15),
    breaks = seq(-0.15, 0.15, 0.03)
  ) +
  labs(
    # title = "Event Study with Panel Data",
    x = "Anos antes/após o SISU",
    y = "Coeficientes") +
  theme_minimal() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    axis.text = element_text(size = 8),
    axis.title = element_text(size = 10),
    text = element_text(family = "Times New Roman")
  )

graf_es_escola_publica

ggsave(
  filename = "img/09-graf_es_escolapublica.png",
  plot = graf_es_escola_publica,
  width = 3.5,
  height = 2,
  units = "in",
  dpi = 300
)


# modelo 6: apoio social

mod_apoio_social <- plm::plm(
  perc_ing_apoio_social ~
    d_4 + d_3 + d_2 + d_0 + d_1_2 + d_2_2 + d_3_2 + d_4_2 + d_5_2 +
    d_6_2 + d_7_2 + d_8_2 + d_9_2 + d_10_2 + d_11_2 + d_12_2,
  data = base_event_study_agrupada,
  index = c("co_curso", "nu_ano_censo", "co_uf"),
  model = "within"
)

sum_apoio_social <- summary(mod_apoio_social)

tab_es_apoio_social <- data.frame(
  tempo = c(-4, -3, -2, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
  coeficientes = as.numeric(mod_apoio_social$coefficients),
  sd = sum_apoio_social$coefficients[, "Std. Error"]
) |>
dplyr::add_row(
  tempo = -1,
  coeficientes = 0,
  sd = 0
) |>
dplyr::arrange(tempo)


graf_es_apoio_social <- tab_es_apoio_social |>
  ggplot(aes(x = tempo, y = coeficientes)) +
  geom_hline(yintercept = 0, color = "black") +
  geom_vline(
    xintercept = 0,
    color = "red",
    linetype = "dashed",
    linewidth = 0.8
  ) +
  geom_errorbar(
    aes(
      ymin = coeficientes - 1.96 * sd,
      ymax = coeficientes + 1.96 * sd
    ),
    width = 0.1,
    color = "grey60",
    linetype = "dashed"
  ) +
  geom_line(
    color = "darkblue",
    linewidth = 0.75
  ) +
  geom_point(
    color = "darkblue",
    size = 1
  ) +
  # geom_ribbon(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   alpha = 0.2
  # ) +
  # geom_errorbar(
  #   aes(
  #     ymin = coeficientes - 1.96 * sd,
  #     ymax = coeficientes + 1.96 * sd
  #   ),
  #   width = 0.1
  # ) +
  scale_x_continuous(breaks = seq(-4, 12, 1)) +
  # scale_y_continuous(
  #   limits = c(-0.05, 0.15),
  #   breaks = seq(-0.1, 0.2, 0.05)
  # ) +
 scale_y_continuous(
   limits = c(-0.15, 0.15),
   breaks = seq(-0.15, 0.15, 0.03)
  ) +
  labs(
    # title = "Event Study with Panel Data",
    x = "Anos antes/após o SISU",
    y = "Coeficientes") +
  theme_minimal() +
   theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    axis.text = element_text(size = 8),
    axis.title = element_text(size = 10),
    text = element_text(family = "Times New Roman")
  )

graf_es_apoio_social


ggsave(
  filename = "img/10-graf_es_apoiosocial.png",
  plot = graf_es_apoio_social,
  width = 3.5,
  height = 2,
  units = "in",
  dpi = 300
)
