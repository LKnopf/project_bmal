#!/bin/bash


echo "Peak finding with MACS"
macs14 -t ZT02_r1_rmdup_filter.bam -c Input_DNA_sort.bam --format=BAM --name=ZT02_r1_bw_split gsize=2400000000 --tsize=37 --call-subpeaks -w
macs14 -t ZT06_r1_rmdup_filter.bam -c Input_DNA_sort.bam --format=BAM --name=ZT06_r1_bw_split gsize=2400000000 --tsize=37 --call-subpeaks -w
macs14 -t ZT10_r1_rmdup_filter.bam -c Input_DNA_sort.bam --format=BAM --name=ZT10_r1_bw_split gsize=2400000000 --tsize=37 --call-subpeaks -w
macs14 -t ZT14_r1_rmdup_filter.bam -c Input_DNA_sort.bam --format=BAM --name=ZT14_r1_bw_split gsize=2400000000 --tsize=37 --call-subpeaks -w
macs14 -t ZT18_r1_rmdup_filter.bam -c Input_DNA_sort.bam --format=BAM --name=ZT18_r1_bw_split gsize=2400000000 --tsize=37 --call-subpeaks -w
macs14 -t ZT22_r1_rmdup_filter.bam -c Input_DNA_sort.bam --format=BAM --name=ZT22_r1_bw_split gsize=2400000000 --tsize=37 --call-subpeaks -w

macs14 -t ZT02_r2_rmdup_filter.bam -c Input_DNA_sort.bam --format=BAM --name=ZT02_r2_bw_split gsize=2400000000 --tsize=37 --call-subpeaks -w
macs14 -t ZT06_r2_rmdup_filter.bam -c Input_DNA_sort.bam --format=BAM --name=ZT06_r2_bw_split gsize=2400000000 --tsize=37 --call-subpeaks -w
macs14 -t ZT10_r2_rmdup_filter.bam -c Input_DNA_sort.bam --format=BAM --name=ZT10_r2_bw_split gsize=2400000000 --tsize=37 --call-subpeaks -w
macs14 -t ZT14_r2_rmdup_filter.bam -c Input_DNA_sort.bam --format=BAM --name=ZT14_r2_bw_split gsize=2400000000 --tsize=37 --call-subpeaks -w
macs14 -t ZT18_r2_rmdup_filter.bam -c Input_DNA_sort.bam --format=BAM --name=ZT18_r2_bw_split gsize=2400000000 --tsize=37 --call-subpeaks -w
macs14 -t ZT22_r2_rmdup_filter.bam -c Input_DNA_sort.bam --format=BAM --name=ZT22_r2_bw_split gsize=2400000000 --tsize=37 --call-subpeaks -w




