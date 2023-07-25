library(GenVisR)
library(ggplot2)
library(patchwork)



a1=read.table("0SH.seg",header=T)
p1=cnFreq(a1,genome="hg38",CN_low_cutoff = 1,CN_high_cutoff = 3,plotType = "proportion",CN_Loss_colour='#52bd6b', CN_Gain_colour='#fbb969', plot_title="0SH")


a2=read.table("1LD.seg",header=T)
p2=cnFreq(a2,genome="hg38",CN_low_cutoff = 1,CN_high_cutoff = 3,plotType = "proportion",CN_Loss_colour='#52bd6b', CN_Gain_colour='#fbb969', plot_title="1LD")


a3=read.table("2HD.seg",header=T)
p3=cnFreq(a3,genome="hg38",CN_low_cutoff = 1,CN_high_cutoff = 3,plotType = "proportion",CN_Loss_colour='#52bd6b', CN_Gain_colour='#fbb969', plot_title="2HD")


a4=read.table("3ESCC.seg",header=T)
p4=cnFreq(a4,genome="hg38",CN_low_cutoff = 1,CN_high_cutoff = 3,plotType = "proportion",CN_Loss_colour='#52bd6b', CN_Gain_colour='#fbb969', plot_title="3ESCC")



p1 + p2 + p3 + p4 + plot_layout(ncol = 1)

