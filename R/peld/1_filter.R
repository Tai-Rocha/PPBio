

library(textreadr)
library(dplyr)

library(tidyverse)

## 1
peld_1 <- read_dir("data-raw/peld_raw/Documents/")

peld_1 <- tibble::as_tibble(test_1)

peld_datmerged_1 <- peld_1 |> 
  dplyr::group_by(document) |> 
  dplyr::summarise(content = paste(content, collapse = ","))
  print(head(peld_datmerged_1))
  
## dias dataset

dias <- peld_datmerged_1 |> 
  filter(str_detect(document, '^dias')) |> 
  arrange(desc(document)) |> 
  filter(document %in% c("dias_36_3", "dias_35_7", "dias_32_3" ))

## drucker dataset

drucker <- peld_datmerged_1 |> 
  filter(str_detect(document, '^drucker')) |> 
  arrange(desc(document)) |> 
  filter(document == "drucker_3_10")

## fecosta dataset

fecosta <- peld_datmerged_1 |> 
  filter(str_detect(document, '^fecosta')) |> 
  arrange(desc(document)) |> 
  filter((document %in% c("10_8", "fecosta_11_3", "fecosta_12_7", "fecosta_13_3", "fecosta_14_6", "fecosta_141_1", "fecosta_143_18", "fecosta_16_12", "fecosta_17_9", "fecosta_185_6", "fecosta_186_5", "fecosta_187_13", "fecosta_188_4", "fecosta_194_3", "fecosta_197_4", "fecosta_207_9", "fecosta_236_15", "fecosta_240_8", "fecosta_245_4", "fecosta_247_4", "fecosta_25_2", "fecosta_26_8", "fecosta_31_2", "fecosta_34_3", "fecosta_4_5", "fecosta_41_3", "fecosta_42_9", "fecosta_44_2", "fecosta_45_17", "fecosta_46_7", "fecosta_47_3", "fecosta_48_2", "fecosta_50_3", "fecosta_55_3", "fecosta_62_11", "fecosta_69_4", "fecosta_70_7", "fecosta_94_1", "fecosta_95_10")))



Bind_all<- bind_rows(dias, drucker, fecosta)
dim(Bind_all) 

