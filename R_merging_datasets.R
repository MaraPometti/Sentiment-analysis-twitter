#to lower cases comuni's names of conte_1 dataset
conte_1$comune_lower = tolower(conte_1$Comune)
#dropping value where Comune doesn't exist
#filtered_conte_1 <- dplyr::filter(conte_1, !is.na(comune_lower))
head(filtered_conte_1)


#to lower cases comuni's names of conte_2 dataset
conte_2$comune_lower = tolower(conte_2$Comune)
#dropping value where Comune doesn't exist
#filtered_conte_2 <- dplyr::filter(conte_2, !is.na(comune_lower))
head(filtered_conte_2)

#combined conte_1 & conte_2
#merged_data_conte <- dplyr::bind_rows(filtered_conte_1, filtered_conte_2)
merged_data_conte <- dplyr::bind_rows(conte_1, conte_2)
#question1: how can I remove col"conte_1_lower"?



#join comuni_region with filtered_merged_data_conte
conte_regioni <- dplyr::full_join(merged_data_conte,comuni_regioni,by="comune_lower")
head(comuni_regioni)
ncol(conte_regioni)

#rename column regioni
names(conte_regioni)[40] <- "regione"

#save new dataset
write.csv(conte_regioni,"/Users/mara.pometti@ibm.com/Desktop/Barometro_Hearst/conte_regioni.csv", row.names = TRUE)
