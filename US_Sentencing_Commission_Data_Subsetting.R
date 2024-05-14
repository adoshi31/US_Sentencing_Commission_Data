## Appreciation to khwilson for doing the heavy lifting!
## Process
# SentencingCommissionDatasets https://github.com/khwilson/SentencingCommissionDatasets/tree/main
# install 7zip using homebrew on MacOS
# launch 7z
# terminal command: "7z x opafy22nid.csv.xz" to unzip to CSV file from khwilson xz files (very large)

# R script follows

library(data.table) # since we have a large file
sentencing2023 <- fread(file.choose(), showProgress = TRUE) # important to use fread given size

## subsetting variables in R 
sentencing2023_subset <- sentencing2023$COMBDRG2
sentencing2023_subset <- as.data.frame(sentencing2023_subset)
sentencing2023_subset$DRUGMIN <- sentencing2023$DRUGMIN
sentencing2023_subset$CRIMPTS <- sentencing2023$CRIMPTS
View(sentencing2023_subset)
sentencing2023_subset$COMBDRG2 <- sentencing2023$COMBDRG2
sentencing2023_subset <- sentencing2023_subset[,-(1)] 
write.csv(sentencing2023_subset, file="sentencing_2023_subset.csv")
summary(sentencing2023_subset)
