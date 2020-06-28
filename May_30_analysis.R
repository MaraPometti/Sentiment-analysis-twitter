#to lower cases comuni's names of conte_1 dataset
conte_1_nomi_correct$comune_lower = tolower(conte_1_nomi_correct$Comune)
#dropping value where Comune doesn't exist
#filtered_conte_1 <- dplyr::filter(conte_1, !is.na(comune_lower))
head(conte_1_nomi_correct)
ncol(conte_1_nomi_correct)
nrow(conte_1_nomi_correct)


#to lower cases comuni's names of conte_2 dataset
conte_2_nomi_corretti$comune_lower = tolower(conte_2_nomi_corretti$Comune)
#dropping value where Comune doesn't exist
#filtered_conte_2 <- dplyr::filter(conte_2, !is.na(comune_lower))
head(conte_2_nomi_corretti)
ncol(conte_2_nomi_corretti)
nrow(conte_2_nomi_corretti)



#combined conte_1 & conte_2
#merged_data_conte <- dplyr::bind_rows(filtered_conte_1, filtered_conte_2)
merged_data_conte_last <- dplyr::bind_rows(conte_1_nomi_correct, conte_2_nomi_corretti)
#question1: how can I remove col"conte_1_lower"?
nrow(merged_data_conte_last)


#join comuni_region with filtered_merged_data_conte
conte_regioni_last <- dplyr::full_join(merged_data_conte_last,comuni_regioni,by="comune_lower")
head(comuni_regioni_last)
ncol(conte_regioni_last)

#rename column regioni
names(conte_regioni_last)[39] <- "regione"

#save new dataset
write.csv(conte_regioni_last,"/Users/mara.pometti@ibm.com/Desktop/Barometro_Hearst/conte_regioni_last_30_may.csv", row.names = TRUE)

#grouping
clean_region <- conte_regioni_last %>% drop_na(sentiment)
test <- clean_region %>% 
  filter(sentiment !="not_evaluable" & source !="News" & source !="Blogs" & source !="Forums")

#dataset by provincia
test_provincia <- test %>% group_by(`Sigla Provincia`)%>% count(sentiment)
wide_test_provincia <- spread(test_provincia, key = sentiment, value = n)
write.csv(wide_test_provincia,"/Users/mara.pometti@ibm.com/Desktop/Barometro_Hearst/provincia_wide.csv", row.names = TRUE)

#dataset by provincia piu contenuto negativo
test_provincia_3 <- test %>% filter(sentiment =="negative")
test_provincia_4 <- test_provincia_3 %>% group_by(`Sigla Provincia`, topics)%>% count(sentiment)
write.csv(wide_test_provincia,"/Users/mara.pometti@ibm.com/Desktop/Barometro_Hearst/provincia_topics_negative.csv", row.names = TRUE)

#dataset regione per sentimento e source
test_regione <- test %>% group_by(source)%>% count(sentiment, regione)
wide_test_regione <- spread(test_regione, key = sentiment, value = n)
write.csv(wide_test_regione,"/Users/mara.pometti@ibm.com/Desktop/Barometro_Hearst/regione_wide_twit_facebook.csv", row.names = TRUE)

#dataset regione per sentimento
test_regione_general <- test %>% group_by(regione)%>% count(sentiment)
wide_test_regioni <- spread(test_regione_general, key =sentiment, value = n)
write.csv(wide_test_regioni,"/Users/mara.pometti@ibm.com/Desktop/Barometro_Hearst/regioni_wide.csv", row.names = TRUE)



#dataset regione per sentimento
test_regione <- test %>% group_by(source)%>% count(sentiment, regione)
wide_test_regione <- spread(test_regione, key = sentiment, value = n)
write.csv(wide_test_regione,"/Users/mara.pometti@ibm.com/Desktop/Barometro_Hearst/regione_wide_twit_facebook.csv", row.names = TRUE)



#date
install.packages("lubridate")
library(lubridate)

#date for extracting only days %D








#ciao <- dataset_groups_last%>% group_by(source) %>%
  #mutate(date=as.Date(date, format = "%d.%m.%Y"))

dataset_groups_last = conte_regioni_last_filtered_sentiment %>% group_by(`Sigla Provincia`, source)%>% count(sentiment)
#dataset_groups_last[['date']] <- strptime(dataset_groups_last[['date']], format='%Y.%m.%d  %H:%M:%S')

#dataset_groups_last$month <- format(dataset_groups_last$date, '%Y-%m')
#typeof(dataset_groups_last$date)
#as.Date(dataset_groups_last$date)
#typeof(dataset_groups_last$date)
#parse_date_time(date, orders = c("dOmY", "OmY", "Y"))
#as.Date(date, "%m/%d/%y")
