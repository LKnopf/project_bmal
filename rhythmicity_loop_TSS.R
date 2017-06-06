library(corrplot)







#oder data by TSS
bs_C_TSS = bs_C[ order(abs(bs_C[,10]), decreasing = F), ]

#START HERE WITH PRE-CREATED DATA
tc = bs_C_TSS[,19:25]
tc[,1] = bs_C_TSS[,12]
tc = na.omit(data.frame(tc))


"tc = bs_paper[,11:17]
tc[,1] = bs_paper[,5]
tc = data.frame(tc)"


"r.mean <- rowMeans(tc[,2:7])
#exp: use peak width for sorting, too
tc_sortmean = tc[ order(r.mean, decreasing = T), ]"


result_TSS = data.frame(matrix(0,40,6))
corr_TSS_all = array(0, dim=c(10,10,40))
corr_TSS_rt = array(0, dim=c(10,10,40))
corr_TSS_nort = array(0, dim=c(10,10,40))

for (amount in 1:40) {

print(amount)
  
  
use_amount = 20*amount
tc_use = data.frame(tc[1:use_amount,])
rhyth_numbr = c(0,0,0,0,0,use_amount)

colnames(tc_use) = c("X", "X2", "X6", "X10", "X14", "X18", "X22")

ta = data.frame(tc_use[,1])
colnames(ta) = c("Probeset")


#rhythmicity analysis
source("JTK_CYCLEv3.1.R")

project <- "Example2"

options(stringsAsFactors=FALSE)
#annot <- read.delim("test_annot.txt")
annot = ta
#data <- read.delim("test_data.txt")
data = tc_use

#rownames(data) <- data[,1]
data <- data[,-1]
jtkdist(6, 1)       # 13 total time points, 2 replicates per time point

periods <- 6:6       # looking for rhythms between 20-28 hours (i.e. between 5 and 7 time points per cycle).
jtk.init(periods,4)  # 4 is the number of hours between time points

cat("JTK analysis started on",date(),"\n")
flush.console()

st <- system.time({
  res <- apply(data,1,function(z) {
    jtkx(z)
    c(JTK.ADJP,JTK.PERIOD,JTK.LAG,JTK.AMP)
  })
  res <- as.data.frame(t(res))
  bhq <- p.adjust(unlist(res[,1]),"BH")
  res <- cbind(bhq,res)
  colnames(res) <- c("BH.Q","ADJ.P","PER","LAG","AMP")
  results_norm <- cbind(annot,res,data)
  results_norm <- results_norm[order(res$ADJ.P,-res$AMP),]
})
print(st)

#save(results,file=paste("JTK",project,"rda",sep="."))
#write.table(results,file=paste("JTK",project,"txt",sep="."),row.names=F,col.names=T,quote=F,sep="\t")


#calc rhythmic %

a = table(results_norm[,3])
rhyth_numbr[5] = sum(a[names(a)<=0.1])/use_amount


#count appearences of genes

#create lists of genes with binding sites and output
genes_transcript = na.omit(data.frame(read.table("transcript_genes.txt"))) #load table of transcribed genes with p-values
genes_transcript = genes_transcript[-1,]
colnames(genes_transcript) = c("Gene", "BH.Q", "ADJ.P", "PER", "LAG",	"AMP")



genes_binding = data.frame(unique(tc_use[,1]))
colnames(genes_binding) = c("Gene")

#inner join


genes_transcript_names = unique(data.frame(genes_transcript[,1]))   #dataframe with names only
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
                          "phase_bind", "phase_transcript", "p_bs", "p_rna", "amp_bs", "amp_rna",
                          "bs_mean", "rna_mean", "bs_amp2", "rna_amp2", "TSS_dist")


#loop to check genes for rhythmicity
for (gene in 1:length(genes_check[,1])) {
  
  L = results_norm$Probeset == genes_check[gene,1]
  K = results_norm[L,]
  K = K[order(K[,3]),] 
  
  genes_check[gene,2] = 1
  genes_check[gene,6] = K[1,5]
  genes_check[gene,8] = K[1,3]
  genes_check[gene,10] = K[1,6]
  
  
  if (genes_check[gene,8] <= 0.1) {
    genes_check[gene,3] = 1
  }
  
  M = genes_transcript$Gene == genes_check[gene,1]
  N = genes_transcript[M,]
  N = N[order(N[,3]),] 
  
  genes_check[gene,4] = 1
  genes_check[gene,7] = N[1,5]
  genes_check[gene,9] = N[1,3]
  genes_check[gene,11] = N[1,6]
  
  if (genes_check[gene,9] <= 0.1) {
    genes_check[gene,5] = 1
  }
}


#print amount of genes with rhythmix binding + expression
a = table(genes_check[,3]+genes_check[,5])

rhyth_numbr[1] = sum(a[names(a)==2]) #genes with rhyhmic binding and expression

#19 for top 100
#xx for top 500
#247 for top 2000

rhyth_numbr[2] = sum(genes_check[,3]) #genes with rhythmic binding

#40 for top 100
#xx for top 500
#598 for top 2000

rhyth_numbr[3] = sum(genes_check[,5]) #genes with rhythmic expression

#29 for top 100
#xx for top 500
#528 for top 2000

rhyth_numbr[4] = rhyth_numbr[3] - rhyth_numbr[1]



#put amplitude and mean value in check_genes

RNA_values <- read.delim("rma_data_new.txt")
RNA_values[,1] <- read.delim("rma_annot_new.txt")[,2]
RNA_values = na.omit(RNA_values)

TSS_dist = na.omit(data.frame(bs_C_TSS[10],bs_C_TSS[12]))

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

genes_rb = subset(genes_check, rhythmic_bind==1) #list of genes with rhythmic binding

genes_rb_nort = subset(genes_rb, rhythmic_transcript==0) #list of genes with rhythmic binding but NO rhythmic trascript
genes_rb_rt = subset(genes_rb, rhythmic_transcript==1) #list of genes with rhythmic binding AND rhythmic transcript


#write.table(genes_rb_nort[,1], file="genes_rb_nort.txt", row.names = FALSE, col.names = FALSE)
#write.table(genes_rb_rt[,1], file="genes_rb_rt.txt", row.names = FALSE, col.names = FALSE)


#make everything in one go
corr_TSS_all[,,amount] = cor(genes_check[, 6:15], method = "spearman")
corr_TSS_rt[,,amount] = cor(genes_rb_rt[, 6:15], method = "spearman")
corr_TSS_nort[,,amount] = cor(genes_rb_nort[, 6:15], method = "spearman")

#jpeg(paste0("corr_mean_", use_amount, ".jpg"), width=3000, height=1500, pointsize=40)
#par(mfrow=c(1,3))

#corrplot(cor_all, method="circle", main="all", type="upper")
#corrplot(cor_rt, method="circle", main="r. exp + r. bind", type="upper")
#corrplot(corr_mean_nort[,,4], method="circle", main="NO r. exp + r. bind", type="upper")
#dev.off()

result_TSS[amount,] = rhyth_numbr

}
####################################################################


result_TSS[,4] = result_TSS[,2]-result_TSS[,1]
result_TSS[,7] = result_TSS[,4]/result_TSS[,2]
result_TSS[,8] = result_TSS[,1]/result_TSS[,2]

colnames(result_TSS) = c("rb+rt", "rb", "rt", "rb-rt", "rhyth%", "top", "rb-rt/rb", "rt+rb/rb")

par(mfrow=c(3,3), oma = c(0, 5, 0, 0))
plot(result_mean[,6],result_mean[,5], xlab="number of top genes used", ylab="rhythmic %")
plot(result_mean[,6],result_mean[,8], xlab="number of top genes used", ylab="% of rb+rt in rb")
plot(result_mean[,6],result_mean[,7], xlab="number of top genes used", ylab="% of rb+NOrt in rb")

plot(result_TSS[,6],result_TSS[,5], xlab="number of top genes used", ylab="rhythmic %")
plot(result_TSS[,6],result_TSS[,8], xlab="number of top genes used", ylab="% of rb+rt in rb")
plot(result_TSS[,6],result_TSS[,7], xlab="number of top genes used", ylab="% of rb+NOrt in rb")

plot(result_amp[,6],result_amp[,5], xlab="number of top genes used", ylab="rhythmic %")
plot(result_amp[,6],result_amp[,8], xlab="number of top genes used", ylab="% of rb+rt in rb")
plot(result_amp[,6],result_amp[,7], xlab="number of top genes used", ylab="% of rb+NOrt in rb")
