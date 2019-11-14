library("openxlsx")
library("C50")

dataCreditRating <- read.xlsx(xlsxFile = "credit_scoring.xlsx")
dataCreditRating$risk_rating <- as.factor(dataCreditRating$risk_rating) 

drop_columns <- c("kpr_aktif", "pendapatan_setahun_juta", "risk_rating", "rata_rata_overdue")
datafeed <- dataCreditRating[ , !(names(dataCreditRating) %in% drop_columns)]
modelKu <- C5.0(datafeed, as.factor(dataCreditRating$risk_rating))
