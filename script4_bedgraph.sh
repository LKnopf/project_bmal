#!/bin/bash



genomeCoverageBed -ibam ZT02_r1_rmdup_filter.bam -bg -trackline > ZT02_r1_rmdup_filter.bedgraph
genomeCoverageBed -ibam ZT02_r2_rmdup_filter.bam -bg -trackline > ZT02_r2_rmdup_filter.bedgraph
genomeCoverageBed -ibam ZT06_r1_rmdup_filter.bam -bg -trackline > ZT06_r1_rmdup_filter.bedgraph
genomeCoverageBed -ibam ZT06_r2_rmdup_filter.bam -bg -trackline > ZT06_r2_rmdup_filter.bedgraph
genomeCoverageBed -ibam ZT10_r1_rmdup_filter.bam -bg -trackline > ZT10_r1_rmdup_filter.bedgraph
genomeCoverageBed -ibam ZT10_r2_rmdup_filter.bam -bg -trackline > ZT10_r2_rmdup_filter.bedgraph
genomeCoverageBed -ibam ZT14_r1_rmdup_filter.bam -bg -trackline > ZT14_r1_rmdup_filter.bedgraph
genomeCoverageBed -ibam ZT14_r2_rmdup_filter.bam -bg -trackline > ZT14_r2_rmdup_filter.bedgraph
genomeCoverageBed -ibam ZT18_r1_rmdup_filter.bam -bg -trackline > ZT18_r1_rmdup_filter.bedgraph
genomeCoverageBed -ibam ZT18_r2_rmdup_filter.bam -bg -trackline > ZT18_r2_rmdup_filter.bedgraph
genomeCoverageBed -ibam ZT22_r1_rmdup_filter.bam -bg -trackline > ZT22_r1_rmdup_filter.bedgraph
genomeCoverageBed -ibam ZT22_r2_rmdup_filter.bam -bg -trackline > ZT22_r2_rmdup_filter.bedgraph




