bs_paper_entrez = read_excel("ZT02_r1_covhomer_C_sub_paper.xlsx") 
bs_paper_entrez = bs_paper_entrez[order(bs_paper_entrez[3]),]
bs_paper_entrez = data.frame(bs_paper_entrez[order(bs_paper_entrez[2]),])
bs_paper_entrez.red = na.omit(unique(data.frame(bs_paper_entrez[,12])))
colnames(bs_paper_entrez.red) = c("Gene")

bs_C = read_excel("ZT02_r1_covhomer_C_sub_strict.xlsx") 
bs_C = bs_C[order(bs_C[3]),]
bs_C = data.frame(bs_C[order(bs_C[2]),])
bs_C.red = na.omit(unique(data.frame(bs_C[,12])))
colnames(bs_C.red) = c("Gene")

bs_C_old = read_excel("ZT22_r2_covhomer_C.xlsx") 
bs_C_old = bs_C_old[order(bs_C_old[3]),]
bs_C_old = data.frame(bs_C_old[order(bs_C_old[2]),])
bs_C_old.red = na.omit(unique(data.frame(bs_C_old[,12])))
colnames(bs_C_old.red) = c("Gene")

join_C.paper = na.omit(merge(bs_paper_entrez.red, bs_C.red))
join_C_old.paper = na.omit(merge(bs_paper_entrez.red, bs_C_old.red))
length(join_C.paper[,1])
length(join_C_old.paper[,1])

