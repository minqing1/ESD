library(YAPSA)
library(knitr)


###1 SBS
dysplasia_samples <- read.table("SBS96/Samples.txt", header = TRUE, sep = "\t",row.names=1)
dysplasia_signature <- read.table("SBS96/Suggested_Solution/SBS96_De-Novo_Solution/Signatures/SBS96_De-Novo_Signatures.txt", header = TRUE, sep = "\t",row.names=1)

exposures_df  <- LCD(dysplasia_samples, dysplasia_signature, in_per_sample_cutoff = 0)
exposures <- as.matrix(exposures_df)

write.table(exposures,file="Merge_all_rmGender_bed_YAPSA",quote= F,sep="\t")
write.table(t(exposures),file="Merge_all_rmGender_bed_YAPSA_t",quote= F,sep="\t")


norm_contribution= apply(exposures, 2, function(x) x/sum(x))
write.table(x=norm_contribution, file="Merge_all_rmGender_bed_YAPSA_t_norm",quote= F,sep="\t")
write.table(t(norm_contribution),file="Merge_all_rmGender_bed_YAPSA_t_norm_t",quote= F,sep="\t")


###2 DBS
dysplasia_samples <- read.table("DBS78/Samples.txt", header = TRUE, sep = "\t",row.names=1)
dysplasia_signature <- read.table("DBS78/Suggested_Solution/DBS78_De-Novo_Solution/Signatures/DBS78_De-Novo_Signatures.txt", header = TRUE, sep = "\t",row.names=1)

exposures_df  <- LCD(dysplasia_samples, dysplasia_signature, in_per_sample_cutoff = 0)
exposures <- as.matrix(exposures_df)

write.table(exposures,file="Merge_all_rmGender_bed_YAPSA_DBS",quote= F,sep="\t")
write.table(t(exposures),file="Merge_all_rmGender_bed_YAPSA_DBS_t",quote= F,sep="\t")

norm_contribution= apply(exposures, 2, function(x) x/sum(x))
write.table(x=norm_contribution, file="Merge_all_rmGender_bed_YAPSA_DBS_norm",quote= F,sep="\t")
write.table(t(norm_contribution),file="Merge_all_rmGender_bed_YAPSA_DBS_norm_t",quote= F,sep="\t")


###3 ID 
dysplasia_samples <- read.table("ID83/Samples.txt", header = TRUE, sep = "\t",row.names=1)
dysplasia_signature <- read.table("ID83/Suggested_Solution/ID83_De-Novo_Solution/Signatures/ID83_De-Novo_Signatures.txt", header = TRUE, sep = "\t",row.names=1)

exposures_df  <- LCD(dysplasia_samples, dysplasia_signature, in_per_sample_cutoff = 0)
exposures <- as.matrix(exposures_df)

write.table(exposures,file="Merge_all_rmGender_bed_YAPSA_ID",quote= F,sep="\t")
write.table(t(exposures),file="Merge_all_rmGender_bed_YAPSA_ID_t",quote= F,sep="\t")

norm_contribution= apply(exposures, 2, function(x) x/sum(x))
write.table(x=norm_contribution, file="Merge_all_rmGender_bed_YAPSA_ID_norm",quote= F,sep="\t")
write.table(t(norm_contribution),file="Merge_all_rmGender_bed_YAPSA_ID_norm_t",quote= F,sep="\t")




