basic_latin1 <- basic_latin2 <- read.table("basic_latin.txt",as.is=T)
# First coding of the Unicode:
tmp <- sub("\\+","\\\\+",basic_latin1[,1])
basic_latin1[,1] <- paste0("<",tmp,">")
# Second possible coding of the Unicode:
basic_latin2[,1] <- tolower(sub("U\\+","\\u",basic_latin2[,2]))
# Putting the 2 coding together:
basic_latin <- rbind(basic_latin1,basic_latin2)
# Save:
devtools::use_data(basic_latin,internal=T,overwrite=T)
# Clean:
rm(basic_latin,basic_latin1,basic_latin2,tmp)
