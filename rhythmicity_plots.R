#get colnames+rownames right
row.names(corr_mean_nort) = colnames(genes_check[, 2:15])
colnames(corr_mean_nort) = colnames(genes_check[, 2:15])
#row.names(corr_TSS_nort) = colnames(genes_check[, 2:15])
#colnames(corr_TSS_nort) = colnames(genes_check[, 2:15])
#row.names(corr_amp_nort) = colnames(genes_check[, 2:15])
#colnames(corr_amp_nort) = colnames(genes_check[, 2:15])

row.names(corr_mean_rt) = colnames(genes_check[, 2:15])
colnames(corr_mean_rt) = colnames(genes_check[, 2:15])
#row.names(corr_TSS_rt) = colnames(genes_check[, 2:15])
#colnames(corr_TSS_rt) = colnames(genes_check[, 2:15])
#row.names(corr_amp_rt) = colnames(genes_check[, 2:15])
#colnames(corr_amp_rt) = colnames(genes_check[, 2:15])

row.names(corr_mean_all) = colnames(genes_check[, 2:15])
colnames(corr_mean_all) = colnames(genes_check[, 2:15])
#row.names(corr_TSS_all) = colnames(genes_check[, 2:15])
#colnames(corr_TSS_all) = colnames(genes_check[, 2:15])
#row.names(corr_amp_all) = colnames(genes_check[, 2:15])
#colnames(corr_amp_all) = colnames(genes_check[, 2:15])


#produce images for correlation
jpeg(paste0("corr_mean.jpg"), width=3000, height=3900, pointsize=40)
par(mfrow=c(3,3), oma = c(0, 0, 10, 0))

corrplot(corr_mean_all[,,10], method="circle", type="upper")
title(main="All", adj=0.5, cex.main=2)
corrplot(corr_mean_rt[,,10], method="circle", type="upper")
title(main="r. exp + r. bind", adj=0.5, cex.main=2)
corrplot(corr_mean_nort[,,10], method="circle", type="upper")
title(main="NO r. exp + r. bind", adj=0.5, cex.main=2)

corrplot(corr_mean_all[,,25], method="circle", type="upper")
corrplot(corr_mean_rt[,,25], method="circle",type="upper")
corrplot(corr_mean_nort[,,25], method="circle",type="upper")

corrplot(corr_mean_all[,,40], method="circle",type="upper")
corrplot(corr_mean_rt[,,40], method="circle", type="upper")
corrplot(corr_mean_nort[,,40], method="circle", type="upper")
dev.off()


#jpeg(paste0("corr_TSS.jpg"), width=3000, height=3900, pointsize=40)
#par(mfrow=c(3,3), oma = c(0, 0, 10, 0))

#corrplot(corr_TSS_all[,,200], method="circle", type="upper")
#title(main="All", adj=0.5, cex.main=2)
#corrplot(corr_TSS_rt[,,200], method="circle", type="upper")
#title(main="r. exp + r. bind", adj=0.5, cex.main=2)
#corrplot(corr_TSS_nort[,,200], method="circle", type="upper")
#title(main="NO r. exp + r. bind", adj=0.5, cex.main=2)

#corrplot(corr_TSS_all[,,400], method="circle", type="upper")
#corrplot(corr_TSS_rt[,,400], method="circle",type="upper")
#corrplot(corr_TSS_nort[,,400], method="circle",type="upper")

#corrplot(corr_TSS_all[,,800], method="circle",type="upper")
#corrplot(corr_TSS_rt[,,800], method="circle", type="upper")
#corrplot(corr_TSS_nort[,,800], method="circle", type="upper")
#dev.off()

#jpeg(paste0("corr_amp.jpg"), width=3000, height=3900, pointsize=40)
#par(mfrow=c(3,3), oma = c(0, 0, 10, 0))

#corrplot(corr_amp_all[,,200], method="circle", type="upper")
#title(main="All", adj=0.5, cex.main=2)
#corrplot(corr_amp_rt[,,200], method="circle", type="upper")
#title(main="r. exp + r. bind", adj=0.5, cex.main=2)
#corrplot(corr_amp_nort[,,200], method="circle", type="upper")
#title(main="NO r. exp + r. bind", adj=0.5, cex.main=2)

#corrplot(corr_amp_all[,,400], method="circle", type="upper")
#corrplot(corr_amp_rt[,,400], method="circle",type="upper")
#corrplot(corr_amp_nort[,,400], method="circle",type="upper")

#corrplot(corr_amp_all[,,800], method="circle",type="upper")
#corrplot(corr_amp_rt[,,800], method="circle", type="upper")
#corrplot(corr_amp_nort[,,800], method="circle", type="upper")
#dev.off()


#create summary plots
jpeg(paste0("summary_tops.jpg"), width=3000, height=3900, pointsize=100)
par(mfrow=c(3,1), oma = c(0, 0, 0, 0))

plot(result_mean[,6],result_mean[,5], xlab="number of top genes used", ylab="rhythmic %", cex = 2, col = "dark blue", ylim=c(0,1), type="l", lwd=3)
lines(result_TSS[,6],result_TSS[,5], xlab="number of top genes used", ylab="rhythmic %", cex = 2, col = "dark red", lwd=3)
lines(result_amp[,6],result_amp[,5], xlab="number of top genes used", ylab="rhythmic %", cex = 2, col = "dark green", lwd=3)
legend(700,0.5, legend=c("mean", "TSS", "amp"),
       col=c("dark blue", "dark red", "dark green"), lty=1:1, cex=0.8)

plot(result_mean[,6],result_mean[,8], xlab="number of top genes used", ylab="% of rb+rt in rb", cex = 2, col = "dark blue", ylim=c(0.2,0.8), type="l", lwd=3)
lines(result_TSS[,6],result_TSS[,8], xlab="number of top genes used", ylab="% of rb+rt in rb", cex = 2, col = "dark red", lwd=3)
lines(result_amp[,6],result_amp[,8], xlab="number of top genes used", ylab="% of rb+rt in rb", cex = 2, col = "dark green", lwd=3)

plot(result_mean[,6],result_mean[,7], xlab="number of top genes used", ylab="% of rb+NOrt in rb", cex = 2, col = "dark blue", ylim=c(0.2,0.8), type="l", lwd=3)
lines(result_TSS[,6],result_TSS[,7], xlab="number of top genes used", ylab="% of rb+NOrt in rb", cex = 2, col = "dark red", lwd=3)
lines(result_amp[,6],result_amp[,7], xlab="number of top genes used", ylab="% of rb+NOrt in rb", cex = 2, col = "dark green", lwd=3)