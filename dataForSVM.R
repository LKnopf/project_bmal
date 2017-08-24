#add bs position to results from metacycle

results_norm[,7] = rep(0, length(results_norm[,1]))


for (i in 1:length(results_norm[,1])){
  M = genes_transcript_meta$Gene == results_norm[i,1]
  N = subset(genes_transcript_meta, M)
  #N = genes_transcript_meta[M,]
  N = N[order(N[,2], decreasing = TRUE),] 
  
  if (length(N[,1])<=0){
    results_norm[i,7] = -1
  }
  else{
  for (step in 1:length(N[,1])) {
    if (N[step,2] <= 0.1) {
      results_norm[i,7] = results_norm[i,7] + 1
    }
  }
  }}
results_norm[,8] = bs_C[1:900, 2]
results_norm[,9] = bs_C[1:900, 3]
results_norm[,10] = bs_C[1:900, 4]


table(results_norm[,7])

SVM_rb = subset(results_norm, results_norm[,2]<=0.2) #list of genes with rhythmic binding
SVM_rt = subset(results_norm, results_norm[,7]>=1) 
SVM_rtrb = subset(SVM_rb, SVM_rb[,7]>=1) 
SVM_rbNOrt = subset(SVM_rb, SVM_rb[,7]==0) 
SVM_rbNOrt = subset(SVM_rb, SVM_rb[,7]==0) 
SVM_norb = subset(results_norm, results_norm[,2]>0.2) 

write.table(SVM_rb[, 8:10], file = "SVM_rb.bed", append = FALSE, quote = FALSE, sep = "\t",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = FALSE)

write.table(SVM_norb[, 8:10], file = "SVM_norb.bed", append = FALSE, quote = FALSE, sep = "\t",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = FALSE)

