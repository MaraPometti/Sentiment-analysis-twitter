ministri <-read.csv("~/Desktop/Barometro_Hearst/Politici/ministri.csv")
typeof(ministri)
colnames(ministri)
ncol(ministri)
nrow(ministri)
summary(ministri)
str(ministri)
plot(ministri$`sentiment by`)
install.packages("dplyr")
install.packages("ggplot2")
ministri$title
ministri$newcol = 1
