library(corrplot)
library(MetaCycle)

meta2d_rna = na.omit(read.table("metaout/meta2d_rma_data_v2.txt", header=TRUE))
genes_transcript_meta = meta2d_rna[, c("CycID", "JTK_BH.Q", "JTK_pvalue", "JTK_period", "JTK_adjphase", "JTK_amplitude")]
#genes_transcript_meta = meta2d_rna[, c("CycID", "ARS_BH.Q", "ARS_pvalue", "ARS_period", "ARS_adjphase", "ARS_amplitude")]
colnames(genes_transcript_meta) = c("Gene", "BH.Q", "ADJ.P", "PER", "LAG", "AMP")

#START HERE WITH PRE-CREATED DATA
tc = bs_C[,19:25]
tc[,1] = bs_C[,12]
tc = na.omit(data.frame(tc))


"tc = bs_paper[,11:17]
tc[,1] = bs_paper[,5]
tc = data.frame(tc)"


"r.mean <- rowMeans(tc[,2:7])
#exp: use peak width for sorting, too
tc_sortmean = tc[ order(r.mean, decreasing = T), ]"


result_mean = data.frame(matrix(0,40,6))
corr_mean_all = array(0, dim=c(14,14,40))
corr_mean_rt = array(0, dim=c(14,14,40))
corr_mean_nort = array(0, dim=c(14,14,40))

for (amount in 1:40) {

print(amount)
  
  
use_amount = 20*amount
tc_use = data.frame(tc[1:use_amount,])
rhyth_numbr = c(0,0,0,0,0,use_amount)

colnames(tc_use) = c("X", "X2", "X6", "X10", "X14", "X18", "X22")

ta = data.frame(tc_use[,1])
colnames(ta) = c("Probeset")


#rhythmicity analysis


#meta2d for chip data
write.table(tc_use, file = "tc_use.txt", append = FALSE, quote = FALSE, sep = "\t",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE)

meta2d("tc_use.txt", outdir = "metaout", filestyle = "txt", 
       timepoints = c(2,6,10,14,18,22) , 
       minper = 22,
       maxper = 26, 
       cycMethod = c("ARS", "JTK", "LS"),
       analysisStrategy = "auto", outputFile = TRUE, outIntegration = "both",
       adjustPhase = "predictedPer", combinePvalue = "fisher",
       weightedPerPha = FALSE, ARSmle = "auto", ARSdefaultPer = 24,
       outRawData = FALSE, releaseNote = TRUE, outSymbol = "")

meta2d_bs = (read.table("metaout/meta2d_tc_use.txt", header=TRUE))
results_norm = meta2d_bs[, c("CycID", "JTK_BH.Q", "JTK_pvalue", "JTK_period", "JTK_adjphase", "JTK_amplitude")]
#results_norm = meta2d_bs[, c("CycID", "ARS_BH.Q", "ARS_pvalue", "ARS_period", "ARS_adjphase", "ARS_amplitude")]
colnames(results_norm) = c("Probeset", "BH.Q", "ADJ.P", "PER", "LAG", "AMP")



#calc rhythmic %

a = table(results_norm[,2])
rhyth_numbr[5] = sum(a[names(a)<=0.2])/use_amount


#count appearences of genes

#create lists of genes with binding sites and output
genes_transcript = genes_transcript_meta

#genes_transcript = na.omit(data.frame(read.table("transcript_genes.txt"))) #load table of transcribed genes with p-values
#genes_transcript = genes_transcript[-1,]
colnames(genes_transcript) = c("Gene", "BH.Q", "ADJ.P", "PER", "LAG",	"AMP")



genes_binding = data.frame(unique(tc_use[,1]))
colnames(genes_binding) = c("Gene")

#inner join


genes_transcript_names = unique(data.frame(genes_transcript_meta[,1]))   #dataframe with names only
colnames(genes_transcript_names) = c("Gene")

genes_check = na.omit(merge(genes_binding, genes_transcript_names))
results_norm = na.omit(results_norm)

genes_check[,2] = 0
genes_check[,3] = 0
genes_check[,4] = 0
genes_check[,5] = 0
genes_check[,6] = 0
genes_check[,7] = 0
genes_check[,8] = 0
genes_check[,9] = 0
genes_check[,10] = 0
genes_check[,11] = 0
genes_check[,12] = 0
genes_check[,13] = 0
genes_check[,14] = 0
genes_check[,15] = 0
genes_check[,16] = 0


colnames(genes_check) = c("Gene","found_bind", "rhythmic_bind", "found_transcript", "rhythmic_transcript",
                          "phase_bind", "phase_transcript", "q_bs", "q_rna", "amp_bs", "amp_rna",
                          "bs_mean", "rna_mean", "bs_amp2", "rna_amp2", "TSS_dist")


#loop to check genes for rhythmicity
for (gene in 1:length(genes_check[,1])) {
  
  L = results_norm$Probeset == genes_check[gene,1]
  #K = results_norm[L,]
  K = subset(results_norm, L)
  K = K[order(K[,2]),] 
  
  genes_check[gene,2] = length(K[,1])
  genes_check[gene,6] = K[1,5]
  genes_check[gene,8] = K[1,2]
  genes_check[gene,10] = K[1,6]
  
  for (step in 1:length(K[,1])) {
  if (K[step,2] <= 0.2) {
    genes_check[gene,3] = genes_check[gene,3] + 1
  }
  }
  
  M = genes_transcript_meta$Gene == genes_check[gene,1]
  N = subset(genes_transcript_meta, M)
  #N = genes_transcript_meta[M,]
  N = N[order(N[,2]),] 
  
  genes_check[gene,4] = length(N[,1])
  genes_check[gene,7] = N[1,5]
  genes_check[gene,9] = N[1,2]
  genes_check[gene,11] = N[1,6]
  
  
  for (step in 1:length(N[,1])) {
    if (N[step,2] <= 0.1) {
      genes_check[gene,5] = genes_check[gene,5] + 1
    }
  }
  
}


#print amount of genes with rhythmix binding + expression
sums = colSums(genes_check != 0)
countif = genes_check
countif[countif > 0] <- 1
a = table(countif[,3]+countif[,5])

rhyth_numbr[1] = sum(a[names(a)==2]) #genes with rhyhmic binding and expression

#19 for top 100
#xx for top 500
#247 for top 2000

rhyth_numbr[2] = sums[3] #genes with rhythmic binding

#40 for top 100
#xx for top 500
#598 for top 2000

rhyth_numbr[3] = sums[5] #genes with rhythmic expression

#29 for top 100
#xx for top 500
#528 for top 2000

rhyth_numbr[4] = rhyth_numbr[3] - rhyth_numbr[1]



#put amplitude and mean value in check_genes

RNA_values <- read.delim("rma_data_new.txt")
RNA_values[,1] <- read.delim("rma_annot_new.txt")[,2]
RNA_values = na.omit(RNA_values)

TSS_dist = na.omit(data.frame(bs_C[10],bs_C[12]))

for (gene in 1:length(genes_check[,1])) {
  
  L = RNA_values$probes == genes_check[gene,1]
  K = tc_use$X == genes_check[gene,1]
  M = TSS_dist$Entrez.ID == genes_check[gene,1]
  
  genes_check[gene,12] = mean(as.numeric(tc_use[K,][1,2:7]))
  genes_check[gene,13] = mean(as.numeric(RNA_values[L,][1,2:24]))
  genes_check[gene,14] = max(as.numeric(tc_use[K,][1,2:7]))-min(as.numeric(RNA_values[L,][1,2:7]))
  genes_check[gene,15] = max(as.numeric(RNA_values[L,][1,2:24]))-min(as.numeric(RNA_values[L,][1,2:24]))
  
  genes_check[gene,16] = TSS_dist[M,][1,1]
}

#make all columns numeric
for (step in 1:15){
  genes_check[,step] = as.numeric( genes_check[,step] )
}

#get lists for GO analysis

genes_rb = subset(genes_check, rhythmic_bind>=1) #list of genes with rhythmic binding
genes_rt = subset(genes_check, rhythmic_transcript>=1) #list of genes with rhythmic transcript
genes_rb_nort = subset(genes_rb, rhythmic_transcript==0) #list of genes with rhythmic binding but NO rhythmic trascript
genes_rb_rt = subset(genes_rb, rhythmic_transcript>=1) #list of genes with rhythmic binding AND rhythmic transcript


#write.table(genes_rb_nort[,1], file="genes_rb_nort.txt", row.names = FALSE, col.names = FALSE)
#write.table(genes_rb_rt[,1], file="genes_rb_rt.txt", row.names = FALSE, col.names = FALSE)


#make everything in one go
corr_mean_all[,,amount] = cor(genes_check[, 2:15], method = "spearman")
corr_mean_rt[,,amount] = cor(genes_rb_rt[, 2:15], method = "spearman")
corr_mean_nort[,,amount] = cor(genes_rb_nort[, 2:15], method = "spearman")

#jpeg(paste0("corr_mean_", use_amount, ".jpg"), width=3000, height=1500, pointsize=40)
par(mfrow=c(1,3))

#corrplot(corr_mean_all[,,1], method="circle", main="all", type="upper")
#corrplot(corr_mean_rt[,,1], method="circle", main="r. exp + r. bind", type="upper")
#corrplot(corr_mean_nort[,,1], method="circle", main="NO r. exp + r. bind", type="upper")
#dev.off()

result_mean[amount,] = rhyth_numbr

}
####################################################################


result_mean[,4] = result_mean[,2]-result_mean[,1]
result_mean[,7] = result_mean[,4]/result_mean[,2]
result_mean[,8] = result_mean[,1]/result_mean[,2]

colnames(result_mean) = c("rb+rt", "rb", "rt", "rb-rt", "rhyth%", "top", "rb-rt/rb", "rt+rb/rb")

par(mfrow=c(1,2))
plot(result_mean[,6],result_mean[,8])
plot(result_mean[,6],result_mean[,7])

#par(mfrow=c(1,3))
#corrplot(corr_mean_all[,,40], method="circle", main="all", type="upper")
#corrplot(corr_mean_rt[,,40], method="circle", main="r. exp + r. bind", type="upper")
#corrplot(corr_mean_nort[,,40], method="circle", main="NO r. exp + r. bind", type="upper")

