# This script fixes count matrices for input into RNA-seq 2G.

filename <- "GSE102956_COUNTS_NEU.txt.gz"

mat <- read.table(filename)
mat <- mat[!duplicated(rownames(mat)) | is.na(rownames(mat)) | !rownames(mat) == "", ]

filename_sub <- unlist(strsplit(filename, "[.]"))[1]
write.table(mat, file = paste0(filename_sub, "_cleaned.txt"), sep = "\t", quote = FALSE)
