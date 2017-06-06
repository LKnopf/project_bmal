
par(mfrow=c(2,3))

RNA_rhyth = subset(genes_transcript_meta, BH.Q<=0.1)
hist(as.numeric(RNA_rhyth[,5]), xlim = c(0,24), breaks=24, main="Rhyth. RNA", xlab="RNA peak phase")
hist(genes_rt[,7], xlim = c(0,24), breaks=24, main="Rhyth. RNA with BS", xlab="RNA peak phase")
hist(genes_rb_rt[,7], xlim = c(0,24), breaks=24, main="Rhyth. RNA with rhyth. BS", xlab="RNA peak phase")

hist(genes_rb[,6], xlim = c(0,24), breaks=24, main="Rhyth. BS", xlab="Binding peak phase")
hist(genes_rb_rt[,6], xlim = c(0,24), breaks=24, main="Rhyth. BS with rhyth. RNA", xlab="Binding peak phase")


ks.test(genes_rb_rt[,7], genes_rt[,7],  alternative = "two.sided", exact = NULL)

#ZT 16 peaks

phasecount_rna = table(genes_rt[,7])
genes_peak16 =  subset(genes_rt, phase_transcript==16)
genes_peak16

par(mfrow=c(3,2))

hist(genes_peak16[,"amp_rna"])
hist(genes_rt[,"amp_rna"])

hist(genes_peak16[,"rna_mean"])
hist(genes_rt[,"rna_mean"])

hist(genes_peak16[,"p_rna"])
hist(genes_rt[,"p_rna"])

par(mfrow=c(2,2))
x = subset(RNA_values, probes ==28250)[, 2:13]
plot(c(1:12)*2, as.vector(x), xlab="Time [h]", at=c(4,8,12,16,20,24))
x = subset(RNA_values, probes ==50798)[, 2:13]
plot(c(1:12)*2, as.vector(x), xlab="Time [h]", at=c(4,8,12,16,20,24))
plot(c(1:6)*4, subset(bs_C, Entrez.ID ==28250)[, 20:25], xlab="Time [h]", at=c(4,8,12,16,20,24))
plot(c(1:6)*4, subset(bs_C, Entrez.ID ==50798)[, 20:25], xlab="Time [h]", at=c(4,8,12,16,20,24))


#ZT 5 peaks

phasecount_rna = table(genes_rt[,7])
genes_peak5 =  subset(genes_rt, phase_transcript==5)
genes_peak5

par(mfrow=c(3,2))

hist(genes_peak5[,"amp_rna"])
hist(genes_rt[,"amp_rna"])

hist(genes_peak5[,"rna_mean"])
hist(genes_rt[,"rna_mean"])

hist(genes_peak5[,"p_rna"])
hist(genes_rt[,"p_rna"])

par(mfrow=c(2,2))
x = subset(RNA_values, probes ==106064)[, 2:13]
plot(c(1:12)*2, as.vector(x), xlab="Time [h]", at=c(4,8,12,16,20,24))
x = subset(RNA_values, probes ==68939)[, 2:13]
plot(c(1:12)*2, as.vector(x), xlab="Time [h]", at=c(4,8,12,16,20,24))
plot(c(1:6)*4, subset(bs_C, Entrez.ID ==106064)[, 20:25], xlab="Time [h]", at=c(4,8,12,16,20,24))
plot(c(1:6)*4, subset(bs_C, Entrez.ID ==68939)[, 20:25], xlab="Time [h]", at=c(4,8,12,16,20,24))


#Correlations

genes_phase = genes_check
genes_phase[,17] = genes_phase[,7] - genes_phase[,6]
colnames(genes_phase)[17] = "phase_diff"
genes_phase_late= subset(genes_phase, genes_phase[,17] >= 6)
genes_phase_early= subset(genes_phase, genes_phase[,17] < 6)

corr_phase_late = cor(genes_phase_late[, 2:17], method = "spearman")
corr_phase_early = cor(genes_phase_early[, 2:17], method = "spearman")

par(mfrow=c(1,2))

corrplot(corr_phase_late, method="circle", main="late phase", type="upper")
corrplot(corr_phase_early, method="circle", main="early phase", type="upper")


#Test for differences
 
test_phase = matrix(c(1:32),2)
colnames(test_phase ) = colnames(genes_phase[, 2:17])
row.names(test_phase ) = c("f-test", "t-test")

for (step in 1:16) {
test_phase [1,step] = as.numeric(var.test(genes_phase_late[, step+1], genes_phase_early[, step+1], ratio = 1,
         alternative = "two.sided",
         conf.level = 0.95)[3])

test_phase [2,step] = as.numeric(t.test(genes_phase_late[, step+1], genes_phase_early[, step+1],
                        alternative = "two.sided",
       mu = 0, paired = FALSE, var.equal = FALSE,
       conf.level = 0.95)[3])
}

test_phase
test_phase  < 0.05

par(mfrow=c(1,2))
hist(genes_phase_late[,"phase_bind"], xlim = c(0,24))
hist(genes_phase_early[,"phase_bind"], xlim = c(0,24))

hist(genes_phase_late[,"amp_bs"],xlim = c(0,150))
hist(genes_phase_early[,"amp_bs"],xlim = c(0,150))

hist(genes_phase_late[,"q_bs"],xlim = c(0,1))
hist(genes_phase_early[,"q_bs"],xlim = c(0,1))

par(mfrow=c(2,1))
hist(as.numeric(bs_paper[,"mRNA.phase"]),xlim = c(0,24),  breaks=24)


join_C.paper[2] = 0
join_C.paper[3] = 0

for (step in 1:length(join_C.paper[,1])) {

B = bs_C$Gene.Name == join_C.paper[step,1]
A = bs_C[B,]


A = A[order(A[,12]),] 

Entrez = A[1,12]
  
L = genes_phase$Gene == Entrez
K = genes_phase[L,]


join_C.paper[step,2] = K[1,7]

N = bs_paper$gene.symbol == join_C.paper[step,1]
M = bs_paper[N,]
M = M[order(M[,8]),] 

join_C.paper[step,3] = M[1,8]
}


hist(as.numeric(join_C.paper[,3]),xlim = c(0,24),  breaks=24)
hist(as.numeric(join_C.paper[,2]),xlim = c(0,24),  breaks=24)

