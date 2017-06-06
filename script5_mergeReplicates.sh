#!/bin/bash




mergePeaks -d given 150 ZT02_r1_bw_peaks.bed ZT02_r2_bw_peaks.bed > ZT02_C.bed
mergePeaks -d given 150 ZT06_r1_bw_peaks.bed ZT06_r2_bw_peaks.bed > ZT06_C.bed
mergePeaks -d given 150 ZT10_r1_bw_peaks.bed ZT10_r2_bw_peaks.bed > ZT10_C.bed
mergePeaks -d given 150 ZT14_r1_bw_peaks.bed ZT14_r2_bw_peaks.bed > ZT14_C.bed
mergePeaks -d given 150 ZT18_r1_bw_peaks.bed ZT18_r2_bw_peaks.bed > ZT18_C.bed
mergePeaks -d given 150 ZT22_r1_bw_peaks.bed ZT22_r2_bw_peaks.bed > ZT22_C.bed

mergePeaks -d given 500 ZT02_r1_bw_peaks.bed ZT02_r2_bw_peaks.bed > ZT02_D.bed
mergePeaks -d given 500 ZT06_r1_bw_peaks.bed ZT06_r2_bw_peaks.bed > ZT06_D.bed
mergePeaks -d given 500 ZT10_r1_bw_peaks.bed ZT10_r2_bw_peaks.bed > ZT10_D.bed
mergePeaks -d given 500 ZT14_r1_bw_peaks.bed ZT14_r2_bw_peaks.bed > ZT14_D.bed
mergePeaks -d given 500 ZT18_r1_bw_peaks.bed ZT18_r2_bw_peaks.bed > ZT18_D.bed
mergePeaks -d given 500 ZT22_r1_bw_peaks.bed ZT22_r2_bw_peaks.bed > ZT22_D.bed

mergePeaks -d 500 ZT02_r1_bw_peaks.bed ZT02_r2_bw_peaks.bed > ZT02_E.bed
mergePeaks -d 500 ZT06_r1_bw_peaks.bed ZT06_r2_bw_peaks.bed > ZT06_E.bed
mergePeaks -d 500 ZT10_r1_bw_peaks.bed ZT10_r2_bw_peaks.bed > ZT10_E.bed
mergePeaks -d 500 ZT14_r1_bw_peaks.bed ZT14_r2_bw_peaks.bed > ZT14_E.bed
mergePeaks -d 500 ZT18_r1_bw_peaks.bed ZT18_r2_bw_peaks.bed > ZT18_E.bed
mergePeaks -d 500 ZT22_r1_bw_peaks.bed ZT22_r2_bw_peaks.bed > ZT22_E.bed
