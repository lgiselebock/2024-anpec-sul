

# pacotes necessários -----------------------------------------------------

library(ggplot2)


# FIGURA 1 ----------------------------------------------------------------
# gráfico com o número de inscritos no enem (1998-2023) -------------------

url <- "https://pt.wikipedia.org/wiki/Predefini%C3%A7%C3%A3o:Inscritos_no_Enem_por_ano"

tab_enem <- url |>
  rvest::read_html() |>
  rvest::html_node(xpath = '//*[@id="mw-content-text"]/div[1]/div[1]/table') |>
  rvest::html_table()

tab_enem <- tab_enem |>
  janitor::clean_names() |>
  tibble::add_row(
    ano = 2023,
    numero_de_inscritos_confirmados = "3.933.970"
  ) |>
  dplyr::mutate(
    numero_de_inscritos_confirmados = dplyr::case_when(
      ano == 2017 ~ "6.731.186[6]",
      ano == 2016 ~ "8.627.371[6]",
      ano == 2015 ~ "7.792.025[6]",
      ano == 2014 ~ "8.722.290[6]",
      ano == 2013 ~ "7.173.574[7]",
      ano == 2012 ~ "5.791.332[7]",
      ano == 2011 ~ "5.380.857[7]",
      ano == 2010 ~ "4.626.094[7]",
      ano == 2009 ~ "4.148.721[7]",
      ano == 2008 ~ "4.018.070[8]",
      ano == 2007 ~ "3.568.592[9]",
      ano == 2006 ~ "3.742.827[9]",
      ano == 2005 ~ "3.004.491[10]",
      ano == 2004 ~ "1.552.316[9]",
      ano == 2003 ~ "1.882.393[11]",
      ano == 2002 ~ "1.829.170[11]",
      ano == 2001 ~ "1.624.131[11]",
      ano == 2000 ~ "390.180[11]",
      ano == 1999 ~ "346.819[12]",
      ano == 1998 ~ "157.221[11]",
      TRUE ~ numero_de_inscritos_confirmados
    ),
    n_inscritos = readr::parse_number(
      numero_de_inscritos_confirmados,
      locale = readr::locale(grouping_mark = ".")
    )
  ) |>
  dplyr::arrange(desc(ano))



grafico_enem_inscritos <- tab_enem |>
  ggplot() +
  aes(x = ano, y = n_inscritos/1000000) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  geom_vline(aes(xintercept = 2004), linetype = "dashed", color = "grey") +
  geom_vline(aes(xintercept = 2010), linetype = "dashed", color = "grey") +
  scale_x_continuous(limits = c(1998, 2024), breaks = seq(1998, 2024, 2)) +
  scale_y_continuous(limits = c(0, 9), breaks = seq(0, 9, 1)) +
  labs(x = "", y = "Inscrições (em milhões)") +
  theme_minimal() +
  theme(
    plot.background = element_rect(fill = "white"),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    axis.title.y = element_text(margin = margin(t = 0, r = 10, b = 0, l = 0)),
    axis.title.x = element_text(margin = margin(t = 10, r = 0, b = 0, l = 0)),
    text = element_text(family = "Times New Roman", size = 15),
    # axis.text = element_text(size = 20)
  )

grafico_enem_inscritos

ggsave(
  grafico_enem_inscritos,
  filename = here::here("img", "01-grafico-enem-inscritos.png"),
  width = 10,
  height = 6,
  dpi = 300
)



# FIGURA 2 ----------------------------------------------------------------
# mapa com as instituições participantes do SISU --------------------------
# por ano de ingresso -----------------------------------------------------


# mapa do brasil com todos seus municípios --------------------------------

map_muni <- geobr::read_municipality(code_muni = "all", year = 2022) |>
  dplyr::mutate(
    code_muni = as.character(code_muni),
    code_state = as.character(code_state),
    code_region = as.character(code_region)
  )


# importando a base com lat long ------------------------------------------

ies_campus_ingresso_sisu <- readr::read_rds(
  here::here("data", "rds", "ies_campus_ingresso_sisu.rds")
) |>
  dplyr::mutate(ano_min = as.factor(ano_min))

ies_ingresso_sisu <- readr::read_rds(
  here::here("data", "rds", "ies_ingresso_sisu.rds")
) |>
  dplyr::mutate(ano_min = as.factor(ano_min))


# mapa de IES que ingressaram no sisu -------------------------------------

map_ies_ingresso_sisu <- ggplot() +
  geom_sf(
    data = map_muni,
    aes(geometry = geom),
    fill = "#fafafa",
    color = "grey80"
  ) +
  geom_point(
    data = ies_ingresso_sisu,
    aes(x = long, y = lat, color = ano_min),
    size = 4
  ) +
  scale_color_viridis_d(
    name = "Ano de ingresso",
    option = "plasma",
    direction = -1,
    begin = 0.1,
    end = 0.9,
    na.value = "grey90",
    labels = c(
      "2010" = "2010 (59)",
      "2011" = "2011 (28)",
      "2012" = "2012 (13)",
      "2013" = "2013 (5)",
      "2014" = "2014 (17)",
      "2015" = "2015 (11)",
      "2016" = "2016 (5)",
      # "2017" = "2017 (1)",
      "2018" = "2018 (1)",
      "2019" = "2019 (2)",
      "2020" = "2020 (2)",
      "2021" = "2021 (4)",
      "2022" = "2022 (1)"
      # "2023" = "2023 (14)"
    )
  ) +
  guides(color = guide_legend(ncol = 2)) +
  scale_x_continuous(limits = c(-73, -34)) +
  scale_y_continuous(limits = c(-33, 4)) +
  theme_void() +
  theme(
    legend.position = c(0.2, 0.2),
    legend.title.align = 0.5,
    legend.text = element_text(family = "Times New Roman", size = 20),
    legend.title = element_text(family = "Times New Roman", size = 20),
    plot.background = element_rect(fill = "white", color = NA),
    plot.margin = margin(c(0, 0, 0, 0))
  )

map_ies_ingresso_sisu

ggsave(
  map_ies_ingresso_sisu,
  filename = here::here("img", "02-map_ies_ingresso_sisu.png"),
  width = 10,
  height = 10,
  dpi = 300
)

# quantas instituições ingressaram por ano --------------------------------

ies_ingresso_sisu |>
  dplyr::group_by(ano_min) |>
  dplyr::count(ano_min)



# mapa com as IES e seus campi (polos) que ingressaram no sisu ------------

map_ies_campi_ingresso_sisu <- ggplot() +
  geom_sf(
    data = map_muni,
    aes(geometry = geom),
    fill = "#fafafa",
    color = "grey80"
  ) +
  geom_point(
    data = ies_campus_ingresso_sisu,
    aes(x = long, y = lat, color = ano_min),
    size = 3
  ) +
  scale_color_viridis_d(
    name = "Ano de ingresso",
    option = "plasma",
    direction = -1,
    begin = 0.1,
    end = 0.9,
    na.value = "grey90",
    labels = c(
      "2010" = "2010 (264)",
      "2011" = "2011 (159)",
      "2012" = "2012 (99)",
      "2013" = "2013 (51)",
      "2014" = "2014 (108)",
      "2015" = "2015 (95)",
      "2016" = "2016 (63)",
      "2017" = "2017 (24)",
      "2018" = "2018 (30)",
      "2019" = "2019 (32)",
      "2020" = "2020 (21)",
      "2021" = "2021 (10)",
      "2022" = "2022 (12)"
      # "2023" = "2023 (14)"
    )
  ) +
  guides(color = guide_legend(ncol = 2)) +
  theme_void() +
  theme(
    legend.position = c(0.2, 0.2),
    legend.title.align = 0.5,
    legend.text = element_text(family = "Arial", size = 14),
    legend.title = element_text(family = "Arial", size = 14),
    plot.background = element_rect(fill = "white", color = NA)
  )

map_ies_campi_ingresso_sisu

ggsave(
  map_ies_campi_ingresso_sisu,
  filename = here::here("imagens", "02-map_ies_campi_ingresso_sisu.png"),
  width = 10,
  height = 10,
  dpi = 300
)


# quantas instituições (campis) ingressaram por ano -----------------------

ies_campus_ingresso_sisu |>
  dplyr::group_by(ano_min) |>
  dplyr::count(ano_min)
