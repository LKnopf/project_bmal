
library("readxl")

bs_homer = read_excel("allmerged_homer_annot.xlsx") 
bs_homer = bs_homer[order(bs_homer[3]),]
bs_homer = data.frame(bs_homer[order(bs_homer[2]),])

bs_homer2 = read_excel("allmerged_homer2_annot.xlsx") 
bs_homer2 = bs_homer2[order(bs_homer2[3]),]
bs_homer2 = data.frame(bs_homer2[order(bs_homer2[2]),])

bs_homer2_nm = read_excel("allmerged_homer2_nomodel_annot.xlsx") 
bs_homer2_nm = bs_homer2_nm[order(bs_homer2_nm[3]),]
bs_homer2_nm = data.frame(bs_homer2_nm[order(bs_homer2_nm[2]),])

bs_paper = read_excel("bindingsites_paper.xlsx")
bs_paper = bs_paper[order(bs_paper[2]),]
bs_paper = data.frame(bs_paper[order(bs_paper[1]),])

bs_rmdup = read_excel("newPeakFile_500_bw50_annot.xlsx")
bs_rmdup = bs_rmdup[order(bs_rmdup[3]),]
bs_rmdup = data.frame(bs_rmdup[order(bs_rmdup[2]),])

bs_rmdup = data.frame(read_excel("ZT02_r1_covhomer.xlsx"))
bs_rmdup = data.frame(bs_rmdup[order(bs_rmdup[1]),])

bs_B = data.frame(read_excel("ZT02_r1_covhomer_B.xlsx"))
bs_B = data.frame(bs_B[order(bs_B[1]),])


numtags = c(
  29773522,
  36931362,
  28667690,
  39228285,
  47107836,
  28247705
)

#read peak data
t2h = read.table("ZT02coverage_sorted_homer.bed")
t6h = read.table("ZT06coverage_sorted_homer.bed")
t10h = read.table("ZT10coverage_sorted_homer.bed")
t14h = read.table("ZT14coverage_sorted_homer.bed")
t18h = read.table("ZT18coverage_sorted_homer.bed")
t22h = read.table("ZT22coverage_sorted_homer.bed")

t2h2 = read.table("ZT02coverage_sorted_homer2.bed")
t6h2 = read.table("ZT06coverage_sorted_homer2.bed")
t10h2 = read.table("ZT10coverage_sorted_homer2.bed")
t14h2 = read.table("ZT14coverage_sorted_homer2.bed")
t18h2 = read.table("ZT18coverage_sorted_homer2.bed")
t22h2 = read.table("ZT22coverage_sorted_homer2.bed")

t2h2_nm = read.table("ZT02coverage_sorted_homer2_nomodel.bed")
t6h2_nm = read.table("ZT06coverage_sorted_homer2_nomodel.bed")
t10h2_nm = read.table("ZT10coverage_sorted_homer2_nomodel.bed")
t14h2_nm = read.table("ZT14coverage_sorted_homer2_nomodel.bed")
t18h2_nm = read.table("ZT18coverage_sorted_homer2_nomodel.bed")
t22h2_nm = read.table("ZT22coverage_sorted_homer2_nomodel.bed")

bs_B[,20] = data.frame(read_excel("ZT02_r2_covhomer_B.xlsx"))[order(data.frame(read_excel("ZT02_r2_covhomer_B.xlsx"))[1]),][,20]+bs_B[,20]
bs_B[,21] = data.frame(read_excel("ZT06_r1_covhomer_B.xlsx"))[order(data.frame(read_excel("ZT06_r1_covhomer_B.xlsx"))[1]),][,20]+data.frame(read_excel("ZT06_r2_covhomer_B.xlsx"))[order(data.frame(read_excel("ZT06_r2_covhomer_B.xlsx"))[1]),][,20]
bs_B[,22] = data.frame(read_excel("ZT10_r1_covhomer_B.xlsx"))[order(data.frame(read_excel("ZT10_r1_covhomer_B.xlsx"))[1]),][,20]+data.frame(read_excel("ZT10_r2_covhomer_B.xlsx"))[order(data.frame(read_excel("ZT10_r2_covhomer_B.xlsx"))[1]),][,20]
bs_B[,23] = data.frame(read_excel("ZT14_r1_covhomer_B.xlsx"))[order(data.frame(read_excel("ZT14_r1_covhomer_B.xlsx"))[1]),][,20]+data.frame(read_excel("ZT14_r2_covhomer_B.xlsx"))[order(data.frame(read_excel("ZT14_r2_covhomer_B.xlsx"))[1]),][,20]
bs_B[,24] = data.frame(read_excel("ZT18_r1_covhomer_B.xlsx"))[order(data.frame(read_excel("ZT18_r1_covhomer_B.xlsx"))[1]),][,20]+data.frame(read_excel("ZT18_r2_covhomer_B.xlsx"))[order(data.frame(read_excel("ZT18_r2_covhomer_B.xlsx"))[1]),][,20]
bs_B[,25] = data.frame(read_excel("ZT22_r1_covhomer_B.xlsx"))[order(data.frame(read_excel("ZT22_r1_covhomer_B.xlsx"))[1]),][,20]+data.frame(read_excel("ZT22_r2_covhomer_B.xlsx"))[order(data.frame(read_excel("ZT22_r2_covhomer_B.xlsx"))[1]),][,20]

bs_rmdup[,20] = data.frame(read_excel("ZT02_r2_covhomer.xlsx"))[order(data.frame(read_excel("ZT02_r2_covhomer.xlsx"))[1]),][,20]+bs_rmdup[,20]
bs_rmdup[,21] = data.frame(read_excel("ZT06_r1_covhomer.xlsx"))[order(data.frame(read_excel("ZT06_r1_covhomer.xlsx"))[1]),][,20]+data.frame(read_excel("ZT06_r2_covhomer.xlsx"))[order(data.frame(read_excel("ZT06_r2_covhomer.xlsx"))[1]),][,20]
bs_rmdup[,22] = data.frame(read_excel("ZT10_r1_covhomer.xlsx"))[order(data.frame(read_excel("ZT10_r1_covhomer.xlsx"))[1]),][,20]+data.frame(read_excel("ZT10_r2_covhomer.xlsx"))[order(data.frame(read_excel("ZT10_r2_covhomer.xlsx"))[1]),][,20]
bs_rmdup[,23] = data.frame(read_excel("ZT14_r1_covhomer.xlsx"))[order(data.frame(read_excel("ZT14_r1_covhomer.xlsx"))[1]),][,20]+data.frame(read_excel("ZT14_r2_covhomer.xlsx"))[order(data.frame(read_excel("ZT14_r2_covhomer.xlsx"))[1]),][,20]
bs_rmdup[,24] = data.frame(read_excel("ZT18_r1_covhomer.xlsx"))[order(data.frame(read_excel("ZT18_r1_covhomer.xlsx"))[1]),][,20]+data.frame(read_excel("ZT18_r2_covhomer.xlsx"))[order(data.frame(read_excel("ZT18_r2_covhomer.xlsx"))[1]),][,20]
bs_rmdup[,25] = data.frame(read_excel("ZT22_r1_covhomer.xlsx"))[order(data.frame(read_excel("ZT22_r1_covhomer.xlsx"))[1]),][,20]+data.frame(read_excel("ZT22_r2_covhomer.xlsx"))[order(data.frame(read_excel("ZT22_r2_covhomer.xlsx"))[1]),][,20]

t2hcounts = t2h[,4]/numtags[1]
t6hcounts = t6h[,4]/numtags[2]
t10hcounts = t10h[,4]/numtags[3]
t14hcounts = t14h[,4]/numtags[4]
t18hcounts = t18h[,4]/numtags[5]
t22hcounts = t22h[,4]/numtags[6]

t2h2counts = t2h2[,4]/numtags[1]
t6h2counts = t6h2[,4]/numtags[2]
t10h2counts = t10h2[,4]/numtags[3]
t14h2counts = t14h2[,4]/numtags[4]
t18h2counts = t18h2[,4]/numtags[5]
t22h2counts = t22h2[,4]/numtags[6]

t2h2counts_nm = t2h2_nm[,4]/numtags[1]
t6h2counts_nm = t6h2_nm[,4]/numtags[2]
t10h2counts_nm = t10h2_nm[,4]/numtags[3]
t14h2counts_nm = t14h2_nm[,4]/numtags[4]
t18h2counts_nm = t18h2_nm[,4]/numtags[5]
t22h2counts_nm = t22h2_nm[,4]/numtags[6]

t2scounts = t2s[,4]/numtags[1]
t6scounts = t6s[,4]/numtags[2]
t10scounts = t10s[,4]/numtags[3]
t14scounts = t14s[,4]/numtags[4]
t18scounts = t18s[,4]/numtags[5]
t22scounts = t22s[,4]/numtags[6]

bs_homer[,20:25] = data.frame(matrix(c(t2hcounts,t6hcounts,t10hcounts,t14hcounts,t18hcounts,t22hcounts),
            nrow=length(t2h[,4]),ncol=6,byrow=FALSE))

bs_homer2[,20:25] = data.frame(matrix(c(t2h2counts,t6h2counts,t10h2counts,t14h2counts,t18h2counts,t22h2counts),
                                     nrow=length(t2h2[,4]),ncol=6,byrow=FALSE))

bs_homer2_nm[,20:25] = data.frame(matrix(c(t2h2counts_nm,t6h2counts_nm,t10h2counts_nm,t14h2counts_nm,t18h2counts_nm,t22h2counts_nm),
                                      nrow=length(t2h2_nm[,4]),ncol=6,byrow=FALSE))





use_amount = 800


bs_homer[,26] = rowMeans(bs_homer[,20:25])
bs_homer = bs_homer[ order(bs_homer[,26], decreasing = T), ]
bs_homer.use = bs_homer[1:use_amount,]

bs_homer2[,26] = rowMeans(bs_homer2[,20:25])
bs_homer2 = bs_homer2[ order(bs_homer2[,26], decreasing = T), ]
bs_homer2.use = bs_homer2[1:use_amount,]

bs_homer2_nm[,26] = rowMeans(bs_homer2_nm[,20:25])
bs_homer2_nm = bs_homer2_nm[ order(bs_homer2_nm[,26], decreasing = T), ]
bs_homer2_nm.use = bs_homer2_nm[1:use_amount,]

bs_rmdup[,26] = rowMeans(bs_rmdup[,20:25])
bs_rmdup = bs_rmdup[ order(bs_rmdup[,26], decreasing = T), ]
bs_rmdup.use = bs_rmdup[1:use_amount,]

bs_B[,26] = rowMeans(bs_B[,20:25])
bs_B = bs_B[ order(bs_B[,26], decreasing = T), ]
bs_B.use = bs_B[1:use_amount,]
bs_B.red = na.omit(unique(data.frame(bs_B.use[,16])))

bs_paper[,18] = rowMeans(bs_paper[,12:17])
bs_paper = bs_paper[ order(bs_paper[,18], decreasing = T), ]
bs_paper.use = bs_paper[1:use_amount,]


bs_C = data.frame(read_excel("ZT02_r1_covhomer_C.xlsx"))
bs_C = data.frame(bs_C[order(bs_C[1]),])

bs_C[,20] = data.frame(read_excel("ZT02_r2_covhomer_C.xlsx"))[order(data.frame(read_excel("ZT02_r2_covhomer_C.xlsx"))[1]),][,20]+bs_C[,20]
bs_C[,21] = data.frame(read_excel("ZT06_r1_covhomer_C.xlsx"))[order(data.frame(read_excel("ZT06_r1_covhomer_C.xlsx"))[1]),][,20]+data.frame(read_excel("ZT06_r2_covhomer_C.xlsx"))[order(data.frame(read_excel("ZT06_r2_covhomer_C.xlsx"))[1]),][,20]
bs_C[,22] = data.frame(read_excel("ZT10_r1_covhomer_C.xlsx"))[order(data.frame(read_excel("ZT10_r1_covhomer_C.xlsx"))[1]),][,20]+data.frame(read_excel("ZT10_r2_covhomer_C.xlsx"))[order(data.frame(read_excel("ZT10_r2_covhomer_C.xlsx"))[1]),][,20]
bs_C[,23] = data.frame(read_excel("ZT14_r1_covhomer_C.xlsx"))[order(data.frame(read_excel("ZT14_r1_covhomer_C.xlsx"))[1]),][,20]+data.frame(read_excel("ZT14_r2_covhomer_C.xlsx"))[order(data.frame(read_excel("ZT14_r2_covhomer_C.xlsx"))[1]),][,20]
bs_C[,24] = data.frame(read_excel("ZT18_r1_covhomer_C.xlsx"))[order(data.frame(read_excel("ZT18_r1_covhomer_C.xlsx"))[1]),][,20]+data.frame(read_excel("ZT18_r2_covhomer_C.xlsx"))[order(data.frame(read_excel("ZT18_r2_covhomer_C.xlsx"))[1]),][,20]
bs_C[,25] = data.frame(read_excel("ZT22_r1_covhomer_C.xlsx"))[order(data.frame(read_excel("ZT22_r1_covhomer_C.xlsx"))[1]),][,20]+data.frame(read_excel("ZT22_r2_covhomer_C.xlsx"))[order(data.frame(read_excel("ZT22_r2_covhomer_C.xlsx"))[1]),][,20]

bs_C[,26] = rowMeans(bs_C[,20:25])
bs_C = bs_C[ order(bs_C[,26], decreasing = T), ]
bs_C.use = bs_C[1:use_amount,]
bs_C.red = na.omit(unique(data.frame(bs_C.use[,16])))
colnames(bs_C.red) = c("Gene")


bs_D = data.frame(read_excel("ZT02_r1_covhomer_D.xlsx"))
bs_D = data.frame(bs_D[order(bs_D[1]),])

bs_D[,20] = data.frame(read_excel("ZT02_r2_covhomer_D.xlsx"))[order(data.frame(read_excel("ZT02_r2_covhomer_D.xlsx"))[1]),][,20]+bs_D[,20]
bs_D[,21] = data.frame(read_excel("ZT06_r1_covhomer_D.xlsx"))[order(data.frame(read_excel("ZT06_r1_covhomer_D.xlsx"))[1]),][,20]+data.frame(read_excel("ZT06_r2_covhomer_D.xlsx"))[order(data.frame(read_excel("ZT06_r2_covhomer_D.xlsx"))[1]),][,20]
bs_D[,22] = data.frame(read_excel("ZT10_r1_covhomer_D.xlsx"))[order(data.frame(read_excel("ZT10_r1_covhomer_D.xlsx"))[1]),][,20]+data.frame(read_excel("ZT10_r2_covhomer_D.xlsx"))[order(data.frame(read_excel("ZT10_r2_covhomer_D.xlsx"))[1]),][,20]
bs_D[,23] = data.frame(read_excel("ZT14_r1_covhomer_D.xlsx"))[order(data.frame(read_excel("ZT14_r1_covhomer_D.xlsx"))[1]),][,20]+data.frame(read_excel("ZT14_r2_covhomer_D.xlsx"))[order(data.frame(read_excel("ZT14_r2_covhomer_D.xlsx"))[1]),][,20]
bs_D[,24] = data.frame(read_excel("ZT18_r1_covhomer_D.xlsx"))[order(data.frame(read_excel("ZT18_r1_covhomer_D.xlsx"))[1]),][,20]+data.frame(read_excel("ZT18_r2_covhomer_D.xlsx"))[order(data.frame(read_excel("ZT18_r2_covhomer_D.xlsx"))[1]),][,20]
bs_D[,25] = data.frame(read_excel("ZT22_r1_covhomer_D.xlsx"))[order(data.frame(read_excel("ZT22_r1_covhomer_D.xlsx"))[1]),][,20]+data.frame(read_excel("ZT22_r2_covhomer_D.xlsx"))[order(data.frame(read_excel("ZT22_r2_covhomer_D.xlsx"))[1]),][,20]

bs_D[,26] = rowMeans(bs_D[,20:25])
bs_D = bs_D[ order(bs_D[,26], decreasing = T), ]
bs_D.use = bs_D[1:use_amount,]
bs_D.red = na.omit(unique(data.frame(bs_D.use[,16])))
colnames(bs_D.red) = c("Gene")


bs_E = data.frame(read_excel("ZT02_r1_covhomer_E.xlsx"))
bs_E = data.frame(bs_E[order(bs_E[1]),])

bs_E[,20] = data.frame(read_excel("ZT02_r2_covhomer_E.xlsx"))[order(data.frame(read_excel("ZT02_r2_covhomer_E.xlsx"))[1]),][,20]+bs_E[,20]
bs_E[,21] = data.frame(read_excel("ZT06_r1_covhomer_E.xlsx"))[order(data.frame(read_excel("ZT06_r1_covhomer_E.xlsx"))[1]),][,20]+data.frame(read_excel("ZT06_r2_covhomer_E.xlsx"))[order(data.frame(read_excel("ZT06_r2_covhomer_E.xlsx"))[1]),][,20]
bs_E[,22] = data.frame(read_excel("ZT10_r1_covhomer_E.xlsx"))[order(data.frame(read_excel("ZT10_r1_covhomer_E.xlsx"))[1]),][,20]+data.frame(read_excel("ZT10_r2_covhomer_E.xlsx"))[order(data.frame(read_excel("ZT10_r2_covhomer_E.xlsx"))[1]),][,20]
bs_E[,23] = data.frame(read_excel("ZT14_r1_covhomer_E.xlsx"))[order(data.frame(read_excel("ZT14_r1_covhomer_E.xlsx"))[1]),][,20]+data.frame(read_excel("ZT14_r2_covhomer_E.xlsx"))[order(data.frame(read_excel("ZT14_r2_covhomer_E.xlsx"))[1]),][,20]
bs_E[,24] = data.frame(read_excel("ZT18_r1_covhomer_E.xlsx"))[order(data.frame(read_excel("ZT18_r1_covhomer_E.xlsx"))[1]),][,20]+data.frame(read_excel("ZT18_r2_covhomer_E.xlsx"))[order(data.frame(read_excel("ZT18_r2_covhomer_E.xlsx"))[1]),][,20]
bs_E[,25] = data.frame(read_excel("ZT22_r1_covhomer_E.xlsx"))[order(data.frame(read_excel("ZT22_r1_covhomer_E.xlsx"))[1]),][,20]+data.frame(read_excel("ZT22_r2_covhomer_E.xlsx"))[order(data.frame(read_excel("ZT22_r2_covhomer_E.xlsx"))[1]),][,20]

bs_E[,26] = rowMeans(bs_E[,20:25])
bs_E = bs_E[ order(bs_E[,26], decreasing = T), ]
bs_E.use = bs_E[1:use_amount,]
bs_E.red = na.omit(unique(data.frame(bs_E.use[,16])))
colnames(bs_E.red) = c("Gene")












#create lists of genes with binding sites and output
bs_homer.red = na.omit(unique(data.frame(bs_homer.use[,16])))
bs_homer2.red = na.omit(unique(data.frame(bs_homer2.use[,16])))
bs_homer2_nm.red = na.omit(unique(data.frame(bs_homer2_nm.use[,16])))
bs_paper.red = na.omit(unique(data.frame(bs_paper.use[,5])))
bs_rmdup.red = na.omit(unique(data.frame(bs_rmdup.use[,16])))



colnames(bs_homer.red) = c("Gene")
colnames(bs_homer2.red) = c("Gene")
colnames(bs_homer2_nm.red) = c("Gene")
colnames(bs_paper.red) = c("Gene")
colnames(bs_rmdup.red) = c("Gene")
colnames(bs_B.red) = c("Gene")

#inner join

join_paper.homer = na.omit(merge(bs_paper.red, bs_homer.red))
join_homer.homer2 = na.omit(merge(bs_homer2.red, bs_homer.red))
join_paper.homer2 = na.omit(merge(bs_paper.red, bs_homer2.red))

join_homer2_nm.homer2 = na.omit(merge(bs_homer2.red, bs_homer2_nm.red))
join_homer2_nm.homer = na.omit(merge(bs_homer.red, bs_homer2_nm.red))
join_homer2_nm.paper = na.omit(merge(bs_paper.red, bs_homer2_nm.red))

join_rmdup.homer2 = na.omit(merge(bs_homer2.red, bs_rmdup.red))
join_rmdup.homer = na.omit(merge(bs_homer.red, bs_rmdup.red))
join_rmdup.paper = na.omit(merge(bs_paper.red, bs_rmdup.red))

join_B.homer2 = na.omit(merge(bs_homer2.red, bs_B.red))
join_B.homer = na.omit(merge(bs_homer.red, bs_B.red))
join_B.paper = na.omit(merge(bs_paper.red, bs_B.red))
join_B.rmdup = na.omit(merge(bs_rmdup.red, bs_B.red))

join_C.homer2 = na.omit(merge(bs_homer2.red, bs_C.red))
join_C.homer = na.omit(merge(bs_homer.red, bs_C.red))
join_C.paper = na.omit(merge(bs_paper.red, bs_C.red))
join_C.rmdup = na.omit(merge(bs_rmdup.red, bs_C.red))

join_D.homer2 = na.omit(merge(bs_homer2.red, bs_D.red))
join_D.homer = na.omit(merge(bs_homer.red, bs_D.red))
join_D.paper = na.omit(merge(bs_paper.red, bs_D.red))
join_D.rmdup = na.omit(merge(bs_rmdup.red, bs_D.red))

join_E.homer2 = na.omit(merge(bs_homer2.red, bs_E.red))
join_E.homer = na.omit(merge(bs_homer.red, bs_E.red))
join_E.paper = na.omit(merge(bs_paper.red, bs_E.red))
join_E.rmdup = na.omit(merge(bs_rmdup.red, bs_E.red))












#bs in paper and homer
length(join_paper.homer[,1])
#bs in paper and homer2
length(join_paper.homer2[,1])
#bs in homer and homer2
length(join_homer.homer2[,1])


#bs in homer2_nm and homer2
length(join_homer2_nm.homer2[,1])
#bs in homer2_nm and homer
length(join_homer2_nm.homer[,1])
#bs in homer2_nm and paper
length(join_homer2_nm.paper[,1])

#bs in rmdup and homer2
length(join_rmdup.homer2[,1])
#bs in rmdup and homer
length(join_rmdup.homer[,1])
#bs in rmdup and paper
length(join_rmdup.paper[,1])

#bs in B and homer2
length(join_B.homer2[,1])
#bs in B and homer
length(join_B.homer[,1])
#bs in B and paper
length(join_B.paper[,1])
#bs in B and rmdup
length(join_B.rmdup[,1])

#bs in C and homer2
length(join_C.homer2[,1])
#bs in C and homer
length(join_C.homer[,1])
#bs in C and paper
length(join_C.paper[,1])
#bs in C and rmdup
length(join_C.rmdup[,1])

#bs in D and homer2
length(join_D.homer2[,1])
#bs in D and homer
length(join_D.homer[,1])
#bs in D and paper
length(join_D.paper[,1])
#bs in D and rmdup
length(join_D.rmdup[,1])

#bs in E and homer2
length(join_E.homer2[,1])
#bs in E and homer
length(join_E.homer[,1])
#bs in E and paper
length(join_E.paper[,1])
#bs in E and rmdup
length(join_E.rmdup[,1])






hist(bs_homer[,4]-bs_homer[,3])
hist(bs_homer2[,4]-bs_homer2[,3])
hist(bs_rmdup[,4]-bs_rmdup[,3])
hist(bs_paper[,3]-bs_paper[,2])





