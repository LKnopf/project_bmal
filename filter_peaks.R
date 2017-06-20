library(gtools)

strcount <- function(x, pattern, split){
  unlist(lapply(
    strsplit(x, split),
    function(z) na.omit(length(grep(pattern, z)))
  ))
}

name = "ALL_split_C.bed"
cutoff = 2 #number of total appearances a peak has to have
merged_peaks = read.table(name, sep = "\t", stringsAsFactors=FALSE)
true_peaks = subset(merged_peaks, V8 >= cutoff)

txt = true_peaks[1,7]
strcount(tolower(txt), "10", "_")


strict = rep(0, length(true_peaks[,1]))

for (gene in 1:length(true_peaks[,1])) {
  if (strcount(tolower(true_peaks[gene,7]), "02", "_") >= 2 | 
      strcount(tolower(true_peaks[gene,7]), "06", "_") >= 2 |
      strcount(tolower(true_peaks[gene,7]), "10", "_") >= 2 |
      strcount(tolower(true_peaks[gene,7]), "14", "_") >= 2 |
      strcount(tolower(true_peaks[gene,7]), "18", "_") >= 2 |
      strcount(tolower(true_peaks[gene,7]), "22", "_") >= 2) 
      {
    
      strict[gene] = 1
    
  }}

#use for strict filtering (both replicates)
L = strict == 1
true_peaks = subset(true_peaks, L)


#sort peaks by position and chromosome
chrOrder = c("chr1", "chr1_random", "chr2", "chr3", "chr4", "chr4_random", "chr5", 
             "chr6", "chr7", "chr8", "chr8_random",  "chr9", "chr9_random", "chr10", "chr11", "chr12", "chr13", "chr13_random",
             "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chrM", "chrUn_random", "chrX", "chrX_random", "chrY", "chrY_random")

true_peaks = true_peaks[ order(true_peaks$"V3", decreasing = F), ]
true_peaks$"V2" <- factor(true_peaks$"V2", chrOrder, ordered=TRUE)
true_peaks = true_peaks[mixedorder(true_peaks$"V2"),]


write.table(true_peaks[ -1 , 2:4 ], file = "allmerged_C_sub_strict.txt", append = FALSE, quote = FALSE, sep = "\t",
            #eol = "\n", na = "NA", dec = ".", 
            row.names = FALSE,
            col.names = FALSE)
 




