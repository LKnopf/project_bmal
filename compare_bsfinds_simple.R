library(readxl)

bs_paper_entrez = read_excel("ZT02_r1_covhomer_C_sub_paper.xlsx") 
bs_paper_entrez = bs_paper_entrez[order(bs_paper_entrez[3]),]
bs_paper_entrez = data.frame(bs_paper_entrez[order(bs_paper_entrez[2]),])
bs_paper_entrez.red = na.omit(unique(data.frame(bs_paper_entrez[,12])))
colnames(bs_paper_entrez.red) = c("Gene")

#creating dataframe with timeseries coverage
bs_C = data.frame(read.csv("ZT02_r1_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))
bs_C = data.frame(bs_C[order(bs_C[1]),])

bs_C[,20] = data.frame(read.csv("ZT02_r2_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT02_r2_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[1]),][,20]+bs_C[,20]
bs_C[,21] = data.frame(read.csv("ZT06_r1_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT06_r1_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[1]),][,20]+data.frame(read.csv("ZT06_r2_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT06_r2_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[1]),][,20]
bs_C[,22] = data.frame(read.csv("ZT10_r1_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT10_r1_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[1]),][,20]+data.frame(read.csv("ZT10_r2_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT10_r2_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[1]),][,20]
bs_C[,23] = data.frame(read.csv("ZT14_r1_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT14_r1_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[1]),][,20]+data.frame(read.csv("ZT14_r2_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT14_r2_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[1]),][,20]
bs_C[,24] = data.frame(read.csv("ZT18_r1_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT18_r1_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[1]),][,20]+data.frame(read.csv("ZT18_r2_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT18_r2_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[1]),][,20]
bs_C[,25] = data.frame(read.csv("ZT22_r1_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT22_r1_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[1]),][,20]+data.frame(read.csv("ZT22_r2_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT22_r2_covhomer_C_sub_strict.txt", header=TRUE, sep = "\t"))[1]),][,20]

bs_C[,26] = rowMeans(bs_C[,20:25])
bs_C = bs_C[ order(bs_C[,26], decreasing = T), ]
bs_C.red = na.omit(unique(data.frame(bs_C[,12])))
colnames(bs_C.red) = c("Gene")

#creating dataframe with timeseries coverage from paper bs
bs_paper_self = data.frame(read.csv("ZT02_r1_covhomer_paper.txt", header=TRUE, sep = "\t"))
bs_paper_self = data.frame(bs_paper_self[order(bs_paper_self[1]),])

bs_paper_self[,20] = data.frame(read.csv("ZT02_r2_covhomer_paper.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT02_r2_covhomer_paper.txt", header=TRUE, sep = "\t"))[1]),][,20]+bs_paper_self[,20]
bs_paper_self[,21] = data.frame(read.csv("ZT06_r1_covhomer_paper.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT06_r1_covhomer_paper.txt", header=TRUE, sep = "\t"))[1]),][,20]+data.frame(read.csv("ZT06_r2_covhomer_paper.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT06_r2_covhomer_paper.txt", header=TRUE, sep = "\t"))[1]),][,20]
bs_paper_self[,22] = data.frame(read.csv("ZT10_r1_covhomer_paper.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT10_r1_covhomer_paper.txt", header=TRUE, sep = "\t"))[1]),][,20]+data.frame(read.csv("ZT10_r2_covhomer_paper.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT10_r2_covhomer_paper.txt", header=TRUE, sep = "\t"))[1]),][,20]
bs_paper_self[,23] = data.frame(read.csv("ZT14_r1_covhomer_paper.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT14_r1_covhomer_paper.txt", header=TRUE, sep = "\t"))[1]),][,20]+data.frame(read.csv("ZT14_r2_covhomer_paper.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT14_r2_covhomer_paper.txt", header=TRUE, sep = "\t"))[1]),][,20]
bs_paper_self[,24] = data.frame(read.csv("ZT18_r1_covhomer_paper.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT18_r1_covhomer_paper.txt", header=TRUE, sep = "\t"))[1]),][,20]+data.frame(read.csv("ZT18_r2_covhomer_paper.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT18_r2_covhomer_paper.txt", header=TRUE, sep = "\t"))[1]),][,20]
bs_paper_self[,25] = data.frame(read.csv("ZT22_r1_covhomer_paper.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT22_r1_covhomer_paper.txt", header=TRUE, sep = "\t"))[1]),][,20]+data.frame(read.csv("ZT22_r2_covhomer_paper.txt", header=TRUE, sep = "\t"))[order(data.frame(read.csv("ZT22_r2_covhomer_paper.txt", header=TRUE, sep = "\t"))[1]),][,20]

bs_paper_self[,26] = rowMeans(bs_paper_self[,20:25])
bs_paper_self = bs_paper_self[ order(bs_paper_self[,26], decreasing = T), ]
bs_paper_self.red = na.omit(unique(data.frame(bs_paper_self[,12])))
colnames(bs_paper_self.red) = c("Gene")


join_C.paper = na.omit(merge(bs_paper_entrez.red, bs_C.red))
length(join_C.paper[,1])

