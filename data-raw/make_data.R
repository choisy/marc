tmp <- read.table("vietnamese_letters.txt")
latin_letters <- c(rep("A",17),"D",rep("E",11),rep("O",17),rep("U",11),
                   rep("a",17),"d",rep("e",11),rep("o",17),rep("u",11))
to_latin <- data.frame(tmp,latin_letters)
# Save:
devtools::use_data(to_latin,internal=T,overwrite=T)
# Clean:
#rm(tmp,latin_letters,to_latin)
