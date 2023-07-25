#!/usr/bin/perl 
use strict;


my %hash;
my $line;
open IN,"SureSelect_Human_All_Exon_V6_r2_hg38/S07604514_Regions.bed" or die "can not open S07604514_Regions\n";
while($line=<IN>){
	chomp $line;
	my @tmp=split(/\t/,$line);
	next if ($line=~/browser/);
	next if ($line=~/track/);
	my $chr=$tmp[0];
	my $start=$tmp[1];
	my $end=$tmp[2];
	for (my $i=$start;$i<=$end;$i++){
		my $tt="$chr:$i";
		$hash{$tt}=1;
	}
}
close IN;




my $infile=$ARGV[0]; 
my $gender=$ARGV[1]; 
my $sample=$ARGV[2]; 

my $num=0;
my $line;
open IN,"$infile" or die "can not open $infile\n";
while($line=<IN>){
	chomp $line;
	
	my @tmp=split(/\t/,$line);
	my $chr=$tmp[0];
	my $start=$tmp[1];
	my $end=$tmp[2];
	my $cn=$tmp[6];
	my $depth=$tmp[9];
	
	next if($depth <10);
	next if($cn ==2);
	next if ($chr!~/chr/);
	
	if ($gender eq 'F'){
		if ($chr eq "chrY"){
			next;
		}
	}
	
	#print "$chr\t$start\t$end\t$cn\t$depth\n";

	for (my $i=$start;$i<=$end;$i++){
		my $tt="$chr:$i";
		if (exists $hash{$tt}){
			$num++;
		}
	}
	
	
	
}
close IN;


my $tmb;
if ($gender eq 'M'){
	$tmb=sprintf("%.2f",$num*100/38449302);
}else{
	$tmb=sprintf("%.2f",$num*100/38342646);
}

print "$sample\t$num\t$tmb\n";

