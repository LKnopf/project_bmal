#!/bin/bash


#makeTagDirectory ZT02_r1 ZT02_r1_rmdup_filter.bam
#makeTagDirectory ZT06_r1 ZT06_r1_rmdup_filter.bam
#makeTagDirectory ZT10_r1 ZT10_r1_rmdup_filter.bam
#makeTagDirectory ZT14_r1 ZT14_r1_rmdup_filter.bam
#makeTagDirectory ZT18_r1 ZT18_r1_rmdup_filter.bam
#makeTagDirectory ZT22_r1 ZT22_r1_rmdup_filter.bam

#makeTagDirectory ZT02_r2 ZT02_r2_rmdup_filter.bam
#makeTagDirectory ZT06_r2 ZT06_r2_rmdup_filter.bam
#makeTagDirectory ZT10_r2 ZT10_r2_rmdup_filter.bam
#makeTagDirectory ZT14_r2 ZT14_r2_rmdup_filter.bam
#makeTagDirectory ZT18_r2 ZT18_r2_rmdup_filter.bam
#makeTagDirectory ZT22_r2 ZT22_r2_rmdup_filter.bam


annotatePeaks.pl bs_paper.bed mm9 -size 500 -d ZT02_r1/ > ZT02_r1_covhomer_paper.txt
annotatePeaks.pl bs_paper.bed mm9 -size 500 -d ZT06_r1/ > ZT06_r1_covhomer_paper.txt
annotatePeaks.pl bs_paper.bed mm9 -size 500 -d ZT10_r1/ > ZT10_r1_covhomer_paper.txt
annotatePeaks.pl bs_paper.bed mm9 -size 500 -d ZT14_r1/ > ZT14_r1_covhomer_paper.txt
annotatePeaks.pl bs_paper.bed mm9 -size 500 -d ZT18_r1/ > ZT18_r1_covhomer_paper.txt
annotatePeaks.pl bs_paper.bed mm9 -size 500 -d ZT22_r1/ > ZT22_r1_covhomer_paper.txt

annotatePeaks.pl bs_paper.bed mm9 -size 500 -d ZT02_r2/ > ZT02_r2_covhomer_paper.txt
annotatePeaks.pl bs_paper.bed mm9 -size 500 -d ZT06_r2/ > ZT06_r2_covhomer_paper.txt
annotatePeaks.pl bs_paper.bed mm9 -size 500 -d ZT10_r2/ > ZT10_r2_covhomer_paper.txt
annotatePeaks.pl bs_paper.bed mm9 -size 500 -d ZT14_r2/ > ZT14_r2_covhomer_paper.txt
annotatePeaks.pl bs_paper.bed mm9 -size 500 -d ZT18_r2/ > ZT18_r2_covhomer_paper.txt
annotatePeaks.pl bs_paper.bed mm9 -size 500 -d ZT22_r2/ > ZT22_r2_covhomer_paper.txt


#most recent version
#annotatePeaks.pl allmerged_C_sub_strict.txt mm9 -size 500 -d ZT02_r1/ > ZT02_r1_covhomer_C_sub_strict.txt
#annotatePeaks.pl allmerged_C_sub_strict.txt mm9 -size 500 -d ZT06_r1/ > ZT06_r1_covhomer_C_sub_strict.txt
#annotatePeaks.pl allmerged_C_sub_strict.txt mm9 -size 500 -d ZT10_r1/ > ZT10_r1_covhomer_C_sub_strict.txt
#annotatePeaks.pl allmerged_C_sub_strict.txt mm9 -size 500 -d ZT14_r1/ > ZT14_r1_covhomer_C_sub_strict.txt
#annotatePeaks.pl allmerged_C_sub_strict.txt mm9 -size 500 -d ZT18_r1/ > ZT18_r1_covhomer_C_sub_strict.txt
#annotatePeaks.pl allmerged_C_sub_strict.txt mm9 -size 500 -d ZT22_r1/ > ZT22_r1_covhomer_C_sub_strict.txt

#annotatePeaks.pl allmerged_C_sub_strict.txt mm9 -size 500 -d ZT02_r2/ > ZT02_r2_covhomer_C_sub_strict.txt
#annotatePeaks.pl allmerged_C_sub_strict.txt mm9 -size 500 -d ZT06_r2/ > ZT06_r2_covhomer_C_sub_strict.txt
#annotatePeaks.pl allmerged_C_sub_strict.txt mm9 -size 500 -d ZT10_r2/ > ZT10_r2_covhomer_C_sub_strict.txt
#annotatePeaks.pl allmerged_C_sub_strict.txt mm9 -size 500 -d ZT14_r2/ > ZT14_r2_covhomer_C_sub_strict.txt
#annotatePeaks.pl allmerged_C_sub_strict.txt mm9 -size 500 -d ZT18_r2/ > ZT18_r2_covhomer_C_sub_strict.txt
#annotatePeaks.pl allmerged_C_sub_strict.txt mm9 -size 500 -d ZT22_r2/ > ZT22_r2_covhomer_C_sub_strict.txt

#old versions
#annotatePeaks.pl allmerged_D.bed mm9 -size 500 -d ZT02_r1/ > ZT02_r1_covhomer_D.txt
#annotatePeaks.pl allmerged_D.bed mm9 -size 500 -d ZT06_r1/ > ZT06_r1_covhomer_D.txt
#annotatePeaks.pl allmerged_D.bed mm9 -size 500 -d ZT10_r1/ > ZT10_r1_covhomer_D.txt
#annotatePeaks.pl allmerged_D.bed mm9 -size 500 -d ZT14_r1/ > ZT14_r1_covhomer_D.txt
#annotatePeaks.pl allmerged_D.bed mm9 -size 500 -d ZT18_r1/ > ZT18_r1_covhomer_D.txt
#annotatePeaks.pl allmerged_D.bed mm9 -size 500 -d ZT22_r1/ > ZT22_r1_covhomer_D.txt

#annotatePeaks.pl allmerged_D.bed mm9 -size 500 -d ZT02_r2/ > ZT02_r2_covhomer_D.txt
#annotatePeaks.pl allmerged_D.bed mm9 -size 500 -d ZT06_r2/ > ZT06_r2_covhomer_D.txt
#annotatePeaks.pl allmerged_D.bed mm9 -size 500 -d ZT10_r2/ > ZT10_r2_covhomer_D.txt
#annotatePeaks.pl allmerged_D.bed mm9 -size 500 -d ZT14_r2/ > ZT14_r2_covhomer_D.txt
#annotatePeaks.pl allmerged_D.bed mm9 -size 500 -d ZT18_r2/ > ZT18_r2_covhomer_D.txt
#annotatePeaks.pl allmerged_D.bed mm9 -size 500 -d ZT22_r2/ > ZT22_r2_covhomer_D.txt


#annotatePeaks.pl allmerged_E.bed mm9 -size 500 -d ZT02_r1/ > ZT02_r1_covhomer_E.txt
#annotatePeaks.pl allmerged_E.bed mm9 -size 500 -d ZT06_r1/ > ZT06_r1_covhomer_E.txt
#annotatePeaks.pl allmerged_E.bed mm9 -size 500 -d ZT10_r1/ > ZT10_r1_covhomer_E.txt
#annotatePeaks.pl allmerged_E.bed mm9 -size 500 -d ZT14_r1/ > ZT14_r1_covhomer_E.txt
#annotatePeaks.pl allmerged_E.bed mm9 -size 500 -d ZT18_r1/ > ZT18_r1_covhomer_E.txt
#annotatePeaks.pl allmerged_E.bed mm9 -size 500 -d ZT22_r1/ > ZT22_r1_covhomer_E.txt

#annotatePeaks.pl allmerged_E.bed mm9 -size 500 -d ZT02_r2/ > ZT02_r2_covhomer_E.txt
#annotatePeaks.pl allmerged_E.bed mm9 -size 500 -d ZT06_r2/ > ZT06_r2_covhomer_E.txt
#annotatePeaks.pl allmerged_E.bed mm9 -size 500 -d ZT10_r2/ > ZT10_r2_covhomer_E.txt
#annotatePeaks.pl allmerged_E.bed mm9 -size 500 -d ZT14_r2/ > ZT14_r2_covhomer_E.txt
#annotatePeaks.pl allmerged_E.bed mm9 -size 500 -d ZT18_r2/ > ZT18_r2_covhomer_E.txt
#annotatePeaks.pl allmerged_E.bed mm9 -size 500 -d ZT22_r2/ > ZT22_r2_covhomer_E.txt


