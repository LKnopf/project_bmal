count_err = 0
gene.names = rep(-1, length(genes_check[,1]))

for (bs in 1:length(genes_check[,1])) {
  M = bs_C$Entrez.ID == genes_check[bs,1]
  N = subset(bs_C, M)
  print(N)
  
  if (dim(N)[1] >=1 ){
      gene.names[bs] = as.matrix(N[16])
      }
    
  else {
    count_err = count_err +1 
  }
}

write.table(gene.names, file = "gene.names_test.txt", append = FALSE, quote = FALSE, sep = "\t",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = FALSE)