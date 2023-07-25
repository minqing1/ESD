#!/usr/bin/perl 

my $tumor=$ARGV[0];
my $normal=$ARGV[1];

my $t_num;
my $n_num;
my $line;
open IN,"zcat $tumor/$normal.$tumor.HC.snps.indel.VQSR.vcf.gz |";
while($line=<IN>){
	chomp $line;
	if ($line=~/^##fileformat/){
		print "$line\n";
		print "##PEDIGREE=<Derived=$tumor,Original=$normal>\n";
		next;
	}
	if ($line=~/^##FILTER=\<ID=VQSRTrancheINDEL99.90to100.00,/){
		print "$line\n";
		print "##FILTER=<ID=PASS,Description=\"All filters passed\">\n";
		print "##FILTER=<ID=REJECT,Description=\"Not somatic due to normal call frequency or phred likelihoods: tumor: 35, normal 35.\">\n";
		next;
	}
	if ($line=~/^##GATKCommandLine=\<ID=HaplotypeCaller/){
		print "$line\n";
		print "##INFO=<ID=SOMATIC,Number=0,Type=Flag,Description=\"Somatic event\">\n";
		next;
	}
	
	if ($line=~/^##/){
		print "$line\n";
		next;
	}
	my @tmp=split(/\t/,$line);
	if ($line=~/^#CHROM/){
		if ($tmp[-1]=~/^$tumor$/){
			$t_num=-1;
			$n_num=-2;
		}
		if ($tmp[-2]=~/^$tumor$/){
			$t_num=-2;
			$n_num=-1;
		}
		print "$line\n";
		next;
	}

	my $filter="PASS";
	if ($tmp[6] !~/PASS/){
		$filter= "REJECT";
	}
	
	my $tumor_detail =$tmp[$t_num];
	my $normal_detail=$tmp[$n_num];
	my $info=$tmp[7];
	
	if ($tumor_detail =~/^[\.\d][\/\|]1/){
		if ($normal_detail =~/^0:/ || $normal_detail =~/^0\/0/ || $normal_detail =~/^0\|0/){
			$info="SOMATIC;$info";
		}
	}
	
	print "$tmp[0]\t$tmp[1]\t$tmp[2]\t$tmp[3]\t$tmp[4]\t$tmp[5]\t$filter\t$info\t$tmp[8]\t$tmp[9]\t$tmp[10]\n";
	
	
}
close IN;



