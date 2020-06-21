#date
install.packages("lubridate")
library(lubridate)

#date for extracting only days %D

#conte_regioni_last_filtered_sentiment$giorno <- as.Date(conte_regioni_last_filtered_sentiment$data, format= "%D")

conte_regioni_last_filtered_sentiment$giorno <- as.Date(as.Date(conte_regioni_last_filtered_sentiment$data), format= "%D")

#