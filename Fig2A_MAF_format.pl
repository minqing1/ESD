#!/usr/bin/perl


print "Hugo_Symbol\tEntrez_Gene_Id\tCenter\tNCBI_Build\tChromosome\tStart_position\tEnd_position\tStrand\tVariant_Classification\tVariant_Type\tReference_Allele\tTumor_Seq_Allele1\tTumor_Seq_Allele2\tdbSNP_RS\tdbSNP_Val_Status\tTumor_Sample_Barcode\tMatched_Norm_Sample_Barcode\n";
open (INFILE, "var_annovar_maf3") or die "Can't open var_annovar_maf3\n";
my $line;
while ($line=<INFILE>) {
        chomp $line;
		next if ($line=~/Tumor_Seq_Allele1/);
		my @tmp=split(/\t/,$line);

		my $Hugo_Symbol=$tmp[7];
		# KBTBD5	KLHL40
		# ZNF761	ZNF765-ZNF761
		# GPR110	ADGRF1
		# C4orf21	ZGRF1
		# INADL	PATJ
		# C14orf135	PCNX4
		# MLL2	KMT2D
		# TMCO7	TANGO6
		# GPR98	ADGRV1
		# C14orf145	CEP128
		# KRTAP12-3	NNN	
		# ZFHX2	NNN

		if ($Hugo_Symbol eq "KBTBD5"){$Hugo_Symbol="KLHL40";}
		if ($Hugo_Symbol eq "ZNF761"){$Hugo_Symbol="ZNF765-ZNF761";}
		if ($Hugo_Symbol eq "GPR110"){$Hugo_Symbol="ADGRF1";}
		if ($Hugo_Symbol eq "C4orf21"){$Hugo_Symbol="ZGRF1";}
		if ($Hugo_Symbol eq "INADL"){$Hugo_Symbol="PATJ";}	
		if ($Hugo_Symbol eq "C14orf135"){$Hugo_Symbol="PCNX4";}
		if ($Hugo_Symbol eq "MLL2"){$Hugo_Symbol="KMT2D";}
		if ($Hugo_Symbol eq "TMCO7"){$Hugo_Symbol="TANGO6";}
		if ($Hugo_Symbol eq "GPR98"){$Hugo_Symbol="ADGRV1";}
		if ($Hugo_Symbol eq "C14orf145"){$Hugo_Symbol="CEP128";}


		my $Entrez_Gene_Id="NA";
		my $Center="NA";
		my $NCBI_Build="hg38";
		my $Chromosome=$tmp[1];
		my $Start_position=$tmp[2];
		my $End_position=$tmp[3];
		my $Strand="+";
		my $Variant_Classification=$tmp[8];
		if ($tmp[18] eq "startloss"){
			$Variant_Classification="Translation_Start_Site";
		}
		next if ($Variant_Classification eq "Unknown");
		
		my $Variant_Type=$tmp[13];
		if ($Variant_Type eq "INS"){
			$End_position=$End_position+1;
		}
		my $Reference_Allele=$tmp[4];
		my $Tumor_Seq_Allele1=$tmp[0];
		my $Tumor_Seq_Allele2=$tmp[5];
		my $dbSNP_RS=$tmp[21];
		my $dbSNP_Val_Status="bySubmitter";
		my $Tumor_Sample_Barcode=$tmp[217]."_".$tmp[6];
		my $Matched_Norm_Sample_Barcode=$tmp[217];
		print "$Hugo_Symbol\t$Entrez_Gene_Id\t$Center\t$NCBI_Build\t$Chromosome\t$Start_position\t$End_position\t$Strand\t$Variant_Classification\t$Variant_Type\t$Reference_Allele\t$Tumor_Seq_Allele1\t$Tumor_Seq_Allele2\t$dbSNP_RS\t$dbSNP_Val_Status\t$Tumor_Sample_Barcode\t$Matched_Norm_Sample_Barcode\n";
		
        
}
close INFILE;



