#!/bin/bash

echo "Aligning"
bowtie2 --end-to-end --sensitive -x mm9_bt2 -U SRR094112.fastq, | samtools view -b -S - > ZT02_r1.bam
bowtie2 --end-to-end --sensitive -x mm9_bt2 -U SRR094114.fastq,SRR094115.fastq, | samtools view -b -S - > ZT06_r1.bam
bowtie2 --end-to-end --sensitive -x mm9_bt2 -U SRR094117.fastq, | samtools view -b -S - > ZT10_r1.bam
bowtie2 --end-to-end --sensitive -x mm9_bt2 -U SRR094119.fastq,SRR094120.fastq, | samtools view -b -S - > ZT14_r1.bam
bowtie2 --end-to-end --sensitive -x mm9_bt2 -U SRR094122.fastq,SRR094123.fastq | samtools view -b -S - > ZT18_r1.bam
bowtie2 --end-to-end --sensitive -x mm9_bt2 -U SRR094126.fastq, | samtools view -b -S - > ZT22_r1.bam

bowtie2 --end-to-end --sensitive -x mm9_bt2 -U SRR094113.fastq, | samtools view -b -S - > ZT02_r2.bam
bowtie2 --end-to-end --sensitive -x mm9_bt2 -U SRR094116.fastq, | samtools view -b -S - > ZT06_r2.bam
bowtie2 --end-to-end --sensitive -x mm9_bt2 -U SRR094118.fastq, | samtools view -b -S - > ZT10_r2.bam
bowtie2 --end-to-end --sensitive -x mm9_bt2 -U SRR094121.fastq, | samtools view -b -S - > ZT14_r2.bam
bowtie2 --end-to-end --sensitive -x mm9_bt2 -U SRR094124.fastq,SRR094125.fastq, | samtools view -b -S - > ZT18_r2.bam
bowtie2 --end-to-end --sensitive -x mm9_bt2 -U SRR094127.fastq, | samtools view -b -S - > ZT22_r2.bam
bowtie2 --end-to-end --sensitive -x mm9_bt2 -U SRR094128.fastq, | samtools view -b -S - > Input_DNA_bt2.bam

echo "Sorting"
samtools sort ZT02_r2.bam -o ZT02_r2_sort.bam
samtools sort ZT06_r2.bam -o ZT06_r2_sort.bam
samtools sort ZT10_r2.bam -o ZT10_r2_sort.bam
samtools sort ZT14_r2.bam -o ZT14_r2_sort.bam
samtools sort ZT18_r2.bam -o ZT18_r2_sort.bam
samtools sort ZT22_r2.bam -o ZT22_r2_sort.bam

rm ZT02_r2.bam
rm ZT06_r2.bam
rm ZT10_r2.bam
rm ZT14_r2.bam
rm ZT18_r2.bam
rm ZT22_r2.bam

samtools sort ZT02_r1.bam -o ZT02_r1_sort.bam
samtools sort ZT06_r1.bam -o ZT06_r1_sort.bam
samtools sort ZT10_r1.bam -o ZT10_r1_sort.bam
samtools sort ZT14_r1.bam -o ZT14_r1_sort.bam
samtools sort ZT18_r1.bam -o ZT18_r1_sort.bam
samtools sort ZT22_r1.bam -o ZT22_r1_sort.bam

rm ZT02_r1.bam 
rm ZT06_r1.bam 
rm ZT10_r1.bam 
rm ZT14_r1.bam 
rm ZT18_r1.bam 
rm ZT22_r1.bam 

samtools sort Input_DNA_bt2.bam -o Input_DNA_sort.bam
rm Input_DNA_bt2.bam

echo "Indexing"
samtools index ZT02_r2_sort.bam
samtools index ZT06_r2_sort.bam
samtools index ZT10_r2_sort.bam
samtools index ZT14_r2_sort.bam
samtools index ZT18_r2_sort.bam
samtools index ZT22_r2_sort.bam

samtools index ZT02_r1_sort.bam
samtools index ZT06_r1_sort.bam
samtools index ZT10_r1_sort.bam
samtools index ZT14_r1_sort.bam
samtools index ZT18_r1_sort.bam
samtools index ZT22_r1_sort.bam

echo "Filtering"
samtools view -b -q 10 ZT02_r1_sort.bam > ZT02_r1_filter.bam
samtools view -b -q 10 ZT06_r1_sort.bam > ZT06_r1_filter.bam
samtools view -b -q 10 ZT10_r1_sort.bam > ZT10_r1_filter.bam
samtools view -b -q 10 ZT14_r1_sort.bam > ZT14_r1_filter.bam
samtools view -b -q 10 ZT18_r1_sort.bam > ZT18_r1_filter.bam
samtools view -b -q 10 ZT22_r1_sort.bam > ZT22_r1_filter.bam

samtools view -b -q 10 ZT02_r2_sort.bam > ZT02_r2_filter.bam
samtools view -b -q 10 ZT06_r2_sort.bam > ZT06_r2_filter.bam
samtools view -b -q 10 ZT10_r2_sort.bam > ZT10_r2_filter.bam
samtools view -b -q 10 ZT14_r2_sort.bam > ZT14_r2_filter.bam
samtools view -b -q 10 ZT18_r2_sort.bam > ZT18_r2_filter.bam
samtools view -b -q 10 ZT22_r2_sort.bam > ZT22_r2_filter.bam

echo "rmdup"
samtools rmdup -s ZT02_r2_filter.bam ZT02_r2_rmdup_filter.bam
samtools rmdup -s ZT06_r2_filter.bam ZT06_r2_rmdup_filter.bam
samtools rmdup -s ZT10_r2_filter.bam ZT10_r2_rmdup_filter.bam
samtools rmdup -s ZT14_r2_filter.bam ZT14_r2_rmdup_filter.bam
samtools rmdup -s ZT18_r2_filter.bam ZT18_r2_rmdup_filter.bam
samtools rmdup -s ZT22_r2_filter.bam ZT22_r2_rmdup_filter.bam

samtools rmdup -s ZT02_r1_filter.bam ZT02_r1_rmdup_filter.bam
samtools rmdup -s ZT06_r1_filter.bam ZT06_r1_rmdup_filter.bam
samtools rmdup -s ZT10_r1_filter.bam ZT10_r1_rmdup_filter.bam
samtools rmdup -s ZT14_r1_filter.bam ZT14_r1_rmdup_filter.bam
samtools rmdup -s ZT18_r1_filter.bam ZT18_r1_rmdup_filter.bam
samtools rmdup -s ZT22_r1_filter.bam ZT22_r1_rmdup_filter.bam

echo "Indexing"
samtools index ZT02_r2_rmdup_filter.bam
samtools index ZT06_r2_rmdup_filter.bam
samtools index ZT10_r2_rmdup_filter.bam
samtools index ZT14_r2_rmdup_filter.bam
samtools index ZT18_r2_rmdup_filter.bam
samtools index ZT22_r2_rmdup_filter.bam

samtools index ZT02_r1_rmdup_filter.bam
samtools index ZT06_r1_rmdup_filter.bam
samtools index ZT10_r1_rmdup_filter.bam
samtools index ZT14_r1_rmdup_filter.bam
samtools index ZT18_r1_rmdup_filter.bam
samtools index ZT22_r1_rmdup_filter.bam






























