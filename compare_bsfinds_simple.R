bs_paper_entrez = read_excel("ZT02_r1_covhomer_C_sub_paper.xlsx") 
bs_paper_entrez = bs_paper_entrez[order(bs_paper_entrez[3]),]
bs_paper_entrez = data.frame(bs_paper_entrez[order(bs_paper_entrez[2]),])
bs_paper_entrez.red = na.omit(unique(data.frame(bs_paper_entrez[,12])))
colnames(bs_paper_entrez.red) = c("Gene")


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

join_C.paper = na.omit(merge(bs_paper_entrez.red, bs_C.red))
join_C_old.paper = na.omit(merge(bs_paper_entrez.red, bs_C_old.red))
length(join_C.paper[,1])
length(join_C_old.paper[,1])

