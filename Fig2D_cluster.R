library(pheatmap)


dat <- read.table("clinical.txt",header=T,sep="\t",row.names=1)

annotation_col = data.frame(NOTCH1=dat$NOTCH1,TP53=dat$TP53,Type=dat$Type,Combined=dat$Combined,Smoking=dat$Smoking,Drinking=dat$Drinking)
rownames(annotation_col) = rownames(dat)

ann_colors = list(
    Type = c(ESD="#ee859a", ESCC="#ad2828"),
    Drinking = c(Yes = "#369c53", No = "grey"),
    Smoking  = c(Yes = "#23a3dd", No = "grey"),
    Combined = c(Yes = "black", No = "grey"),
    TP53 = c(Yes = "#f4a01b", No = "grey"),
    NOTCH1 = c(Yes = "#f4a01b", No = "grey")
)


dat2 <- dat[,1:3]

rrr <- pheatmap(t(dat2), cluster_rows = FALSE, cluster_cols = TRUE,angle_col=90,border_color="red",annotation_col = annotation_col,annotation_colors = ann_colors,cutree_col = 4)

