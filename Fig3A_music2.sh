music2 bmr calc-bmr --roi-file samples.roi_file --reference-sequence GRCh38.p13.genome.fa --bam-list samples.bam_list --maf-file samples.maf --output-dir ./ --show-skipped

music2 smg --gene-mr-file gene_mrs --output-file ./samples.smgs --max-fdr 0.05 --processors 40

