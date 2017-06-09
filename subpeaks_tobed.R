
reps = list("r1_", "r2_")
times = list("ZT02_", "ZT06_", "ZT10_", "ZT14_", "ZT18_", "ZT22_")

for (rep in 1:2) {

  for(time in 1:6) {
    name_load = paste0(times[time],reps[rep], "bw_split_peaks.subpeaks.bed")
    name_save = paste0(times[time],reps[rep], "bw_split_peaks.subpeaks.red.bed")

    a = read.table(name_load)

    
    write.table(a[ -1 , 1:3 ], file = name_save, append = FALSE, quote = FALSE, sep = "\t",
                #eol = "\n", na = "NA", dec = ".", 
                row.names = FALSE,
                col.names = FALSE)
    
    }}
