#meta2d for transcript
library(MetaCycle)

annot <- read.delim("rma_annot_new.txt")

data <- read.delim("rma_data_new.txt")

data[,1] = annot[,2]

write.table(data, file = "rma_data_v2.txt", append = FALSE, quote = FALSE, sep = "\t",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = FALSE)

data_v2 <- read.delim("rma_data_v2.txt")

meta2d("rma_data_v2.txt", outdir = "metaout", filestyle = "txt", 
       timepoints = c(18,	20,	22,	24,	26,	28,	30,	32,	34,	36,	38,	40,	42,	44,	46,	48,	50,	52,	54,	56,	58,	60,	62,	64) , 
       minper = 22,
       maxper = 26, 
       cycMethod = c("ARS", "JTK", "LS"),
       analysisStrategy = "auto", outputFile = TRUE, outIntegration = "both",
       adjustPhase = "predictedPer", combinePvalue = "fisher",
       weightedPerPha = FALSE, ARSmle = "auto", ARSdefaultPer = 24,
       outRawData = FALSE, releaseNote = TRUE, outSymbol = "")
















#only JTK
source("JTK_CYCLEv3.1.R")

project <- "Microarray"

options(stringsAsFactors=FALSE)
annot <- read.delim("rma_annot_new.txt")#[,2]

data <- read.delim("rma_data_new.txt")


rownames(data) <- data[,1]
data <- data[,-1]
jtkdist(24, 1)       # 13 total time points, 2 replicates per time point

periods <- 12:12       # looking for rhythms between 20-28 hours (i.e. between 5 and 7 time points per cycle).
jtk.init(periods,2)  # 4 is the number of hours between time points

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
  results <- cbind(annot,res,data)
  results <- results[order(res$ADJ.P,-res$AMP),]
})
print(st)

save(results,file=paste("JTK",project,"rda",sep="."))
write.table(results,file=paste("JTK",project,"txt",sep="."),row.names=F,col.names=T,quote=F,sep="\t")