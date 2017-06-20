#!/bin/bash



#for normal peaks
#mergePeaks -d given 150 ZT02_r1_bw_split_peaks.bed ZT02_r2_bw_split_peaks.bed > ZT02_split_C.bed
#mergePeaks -d given 150 ZT06_r1_bw_split_peaks.bed ZT06_r2_bw_split_peaks.bed > ZT06_split_C.bed
#mergePeaks -d given 150 ZT10_r1_bw_split_peaks.bed ZT10_r2_bw_split_peaks.bed > ZT10_split_C.bed
#mergePeaks -d given 150 ZT14_r1_bw_split_peaks.bed ZT14_r2_bw_split_peaks.bed > ZT14_split_C.bed
#mergePeaks -d given 150 ZT18_r1_bw_split_peaks.bed ZT18_r2_bw_split_peaks.bed > ZT18_split_C.bed
#mergePeaks -d given 150 ZT22_r1_bw_split_peaks.bed ZT22_r2_bw_split_peaks.bed > ZT22_split_C.bed

#for subpeaks

#mergePeaks -d given 150 ZT02_r1_bw_split_peaks.subpeaks.bed ZT02_r2_bw_split_peaks.subpeaks.bed > ZT02_split_C.subpeaks.bed
#mergePeaks -d given 150 ZT06_r1_bw_split_peaks.subpeaks.bed ZT06_r2_bw_split_peaks.subpeaks.bed > ZT06_split_C.subpeaks.bed
#mergePeaks -d given 150 ZT10_r1_bw_split_peaks.subpeaks.bed ZT10_r2_bw_split_peaks.subpeaks.bed > ZT10_split_C.subpeaks.bed
#mergePeaks -d given 150 ZT14_r1_bw_split_peaks.subpeaks.bed ZT14_r2_bw_split_peaks.subpeaks.bed > ZT14_split_C.subpeaks.bed
#mergePeaks -d given 150 ZT18_r1_bw_split_peaks.subpeaks.bed ZT18_r2_bw_split_peaks.subpeaks.bed > ZT18_split_C.subpeaks.bed
#mergePeaks -d given 150 ZT22_r1_bw_split_peaks.subpeaks.bed ZT22_r2_bw_split_peaks.subpeaks.bed > ZT22_split_C.subpeaks.bed

#mergePeaks -d 150 ZT02_C.bed ZT06_C.bed ZT10_C.bed ZT14_C.bed ZT18_C.bed ZT22_C.bed > allmerged_C.txt

#merge complete set
mergePeaks -d given 150 ZT02_r1_bw_split_peaks.bed ZT02_r2_bw_split_peaks.bed ZT06_r1_bw_split_peaks.bed ZT06_r2_bw_split_peaks.bed ZT10_r1_bw_split_peaks.bed ZT10_r2_bw_split_peaks.bed ZT14_r1_bw_split_peaks.bed ZT14_r2_bw_split_peaks.bed ZT18_r1_bw_split_peaks.bed ZT18_r2_bw_split_peaks.bed ZT22_r1_bw_split_peaks.bed ZT22_r2_bw_split_peaks.bed > ALL_split_C.bed

#now use filter_peaks.R to select peaks for appearance threshold


