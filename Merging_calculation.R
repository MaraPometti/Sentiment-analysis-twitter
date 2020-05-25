filtered_conte_regioni_modified <- dplyr::filter(conte_regioni_modified, !is.na(comune_lower))

ncol(filtered_conte_regioni_modified)

conte_regioni_last <- dplyr::full_join(filtered_conte_regioni_modified,comuni_regioni,by="comune_lower")

ncol(conte_regioni_last)
names(conte_regioni_last)[39] <- "regione"

#save new dataset
write.csv(conte_regioni_last,"/Users/mara.pometti@ibm.com/Desktop/Barometro_Hearst/conte_regioni_last.csv", row.names = TRUE)
