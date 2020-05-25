#merged two comuni datsets: 1 with regions, the other with only comuni but the most up to date
comuni_aggiornato$comune_lower = tolower(comuni_aggiornato$Comune)
head(comuni_aggiornato)
elenco_comuni$comune_lower = tolower(elenco_comuni$Comune)
head(elenco_comuni)
comuninew1 <-dplyr::right_join(comuni_aggiornato, elenco_comuni, by = "Comune")
read.csv2(file("elenco_comuni", encoding="UTF-8"))
head(elenco_comuni)
elenco_comuni$comune_lower = tolower(elenco_comuni$Comune)
head(elenco_comuni)

#created comuni_regioni new dataset
comuni_regioni <-dplyr::inner_join(comuni_aggiornato, elenco_comuni, by = "comune_lower")
nrow(comuni_nuovo)
nrow(elenco_comuni)
nrow(comuni_aggiornato)
sum(is.na(comuni_nuovo))
write.csv(comuni_nuovo,"/Users/mara.pometti@ibm.com/Desktop/comunenuovo.csv", row.names = TRUE)
