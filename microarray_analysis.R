
#Load the necessary libraries
library(GEOquery)
library(affy)
library(gcrma)

library(mogene10stprobeset.db)
library(mogene10sttranscriptcluster.db)
library(mogene10stv1cdf)
library(mogene10stv1probe)



#Set working directory for download
setwd("/home/knopf/project_bmal")


#Download the CEL file package for this dataset (by GSE - Geo series id)
getGEOSuppFiles("GSE54652")


#Unpack the CEL files
setwd("/home/knopf/Bmal/R/Microarray/GSE54652")
untar("GSE54652_RAW.tar", exdir="data")
cels = list.files("data/", pattern = "CEL")
sapply(paste("data", cels, sep="/"), gunzip)
cels = list.files("data/", pattern = "CEL")

setwd("/home/knopf/Bmal/R/Microarray/GSE54652/data")
raw.data=ReadAffy(verbose=TRUE, filenames=cels, cdfname="mogene10stv1") #From bioconductor

#perform RMA normalization (I would normally use GCRMA but it did not work with this chip)
data.rma.norm=rma(raw.data)

#Get the important stuff out of the data - the expression estimates for each array
rma=exprs(data.rma.norm)

#Format values to 5 decimal places
rma=format(rma, digits=5)

#Map probe sets to gene symbols or other annotations
#To see all available mappings for this platform
ls("package:mogene10stprobeset.db") #Annotations at the exon probeset level
ls("package:mogene10sttranscriptcluster.db") 


#Extract probe ids, entrez symbols, and entrez ids
probes=row.names(rma)
Symbols = unlist(mget(probes, mogene10sttranscriptclusterSYMBOL, ifnotfound=NA))
Entrez_IDs = unlist(mget(probes, mogene10sttranscriptclusterENTREZID, ifnotfound=NA))

#Combine gene annotations with raw data
rma=cbind(probes,Symbols,Entrez_IDs,rma)

#Write RMA-normalized, mapped data to file
write.table(rma, file = "rma_new.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE)
