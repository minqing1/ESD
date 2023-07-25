#!/usr/bin/perl 
use strict;


my %hash_chr1;
my %hash_chr2;
my %hash_chr3;
my %hash_chr4;
my %hash_chr5;
my %hash_chr6;
my %hash_chr7;
my %hash_chr8;
my %hash_chr9;
my %hash_chr10;
my %hash_chr11;
my %hash_chr12;
my %hash_chr13;
my %hash_chr14;
my %hash_chr15;
my %hash_chr16;
my %hash_chr17;
my %hash_chr18;
my %hash_chr19;
my %hash_chr20;
my %hash_chr21;
my %hash_chr22;


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
	
	if ($chr=~/^chr1$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr1{$tt}=1;}}
	if ($chr=~/^chr2$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr2{$tt}=1;}}
	if ($chr=~/^chr3$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr3{$tt}=1;}}
	if ($chr=~/^chr4$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr4{$tt}=1;}}
	if ($chr=~/^chr5$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr5{$tt}=1;}}
	if ($chr=~/^chr6$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr6{$tt}=1;}}
	if ($chr=~/^chr7$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr7{$tt}=1;}}
	if ($chr=~/^chr8$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr8{$tt}=1;}}
	if ($chr=~/^chr9$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr9{$tt}=1;}}
	if ($chr=~/^chr10$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr10{$tt}=1;}}
	if ($chr=~/^chr11$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr11{$tt}=1;}}
	if ($chr=~/^chr12$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr12{$tt}=1;}}
	if ($chr=~/^chr13$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr13{$tt}=1;}}
	if ($chr=~/^chr14$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr14{$tt}=1;}}
	if ($chr=~/^chr15$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr15{$tt}=1;}}
	if ($chr=~/^chr16$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr16{$tt}=1;}}
	if ($chr=~/^chr17$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr17{$tt}=1;}}
	if ($chr=~/^chr18$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr18{$tt}=1;}}
	if ($chr=~/^chr19$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr19{$tt}=1;}}
	if ($chr=~/^chr20$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr20{$tt}=1;}}
	if ($chr=~/^chr21$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr21{$tt}=1;}}
	if ($chr=~/^chr22$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";$hash_chr22{$tt}=1;}}

}
close IN;




my $infile=$ARGV[0]; 
my $sample=$ARGV[1]; 

my $num_chr1=0;
my $num_chr2=0;
my $num_chr3=0;
my $num_chr4=0;
my $num_chr5=0;
my $num_chr6=0;
my $num_chr7=0;
my $num_chr8=0;
my $num_chr9=0;
my $num_chr10=0;
my $num_chr11=0;
my $num_chr12=0;
my $num_chr13=0;
my $num_chr14=0;
my $num_chr15=0;
my $num_chr16=0;
my $num_chr17=0;
my $num_chr18=0;
my $num_chr19=0;
my $num_chr20=0;
my $num_chr21=0;
my $num_chr22=0;


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
	
	next if ($chr eq "chrX");
	next if ($chr eq "chrY");
	
	#print "$chr\t$start\t$end\t$cn\t$depth\n";
	
	if ($chr=~/^chr1$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr1{$tt}){$num_chr1++;}}}
	if ($chr=~/^chr2$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr2{$tt}){$num_chr2++;}}}
	if ($chr=~/^chr3$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr3{$tt}){$num_chr3++;}}}
	if ($chr=~/^chr4$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr4{$tt}){$num_chr4++;}}}
	if ($chr=~/^chr5$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr5{$tt}){$num_chr5++;}}}
	if ($chr=~/^chr6$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr6{$tt}){$num_chr6++;}}}
	if ($chr=~/^chr7$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr7{$tt}){$num_chr7++;}}}
	if ($chr=~/^chr8$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr8{$tt}){$num_chr8++;}}}
	if ($chr=~/^chr9$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr9{$tt}){$num_chr9++;}}}
	if ($chr=~/^chr10$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr10{$tt}){$num_chr10++;}}}
	if ($chr=~/^chr11$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr11{$tt}){$num_chr11++;}}}
	if ($chr=~/^chr12$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr12{$tt}){$num_chr12++;}}}
	if ($chr=~/^chr13$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr13{$tt}){$num_chr13++;}}}
	if ($chr=~/^chr14$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr14{$tt}){$num_chr14++;}}}
	if ($chr=~/^chr15$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr15{$tt}){$num_chr15++;}}}
	if ($chr=~/^chr16$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr16{$tt}){$num_chr16++;}}}
	if ($chr=~/^chr17$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr17{$tt}){$num_chr17++;}}}
	if ($chr=~/^chr18$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr18{$tt}){$num_chr18++;}}}
	if ($chr=~/^chr19$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr19{$tt}){$num_chr19++;}}}
	if ($chr=~/^chr20$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr20{$tt}){$num_chr20++;}}}
	if ($chr=~/^chr21$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr21{$tt}){$num_chr21++;}}}
	if ($chr=~/^chr22$/){for (my $i=$start;$i<=$end;$i++){my $tt="$chr:$i";if (exists $hash_chr22{$tt}){$num_chr22++;}}}

}
close IN;


my $length_chr1 =keys %hash_chr1;
my $length_chr2 =keys %hash_chr2;
my $length_chr3 =keys %hash_chr3;
my $length_chr4 =keys %hash_chr4;
my $length_chr5 =keys %hash_chr5;
my $length_chr6 =keys %hash_chr6;
my $length_chr7 =keys %hash_chr7;
my $length_chr8 =keys %hash_chr8;
my $length_chr9 =keys %hash_chr9;
my $length_chr10 =keys %hash_chr10;
my $length_chr11 =keys %hash_chr11;
my $length_chr12 =keys %hash_chr12;
my $length_chr13 =keys %hash_chr13;
my $length_chr14 =keys %hash_chr14;
my $length_chr15 =keys %hash_chr15;
my $length_chr16 =keys %hash_chr16;
my $length_chr17 =keys %hash_chr17;
my $length_chr18 =keys %hash_chr18;
my $length_chr19 =keys %hash_chr19;
my $length_chr20 =keys %hash_chr20;
my $length_chr21 =keys %hash_chr21;
my $length_chr22 =keys %hash_chr22;


my $tmb_chr1=0;
my $tmb_chr2=0;
my $tmb_chr3=0;
my $tmb_chr4=0;
my $tmb_chr5=0;
my $tmb_chr6=0;
my $tmb_chr7=0;
my $tmb_chr8=0;
my $tmb_chr9=0;
my $tmb_chr10=0;
my $tmb_chr11=0;
my $tmb_chr12=0;
my $tmb_chr13=0;
my $tmb_chr14=0;
my $tmb_chr15=0;
my $tmb_chr16=0;
my $tmb_chr17=0;
my $tmb_chr18=0;
my $tmb_chr19=0;
my $tmb_chr20=0;
my $tmb_chr21=0;
my $tmb_chr22=0;

#print "$num_chr2\t$length_chr2\n";

$tmb_chr1=sprintf("%.4f",$num_chr1/$length_chr1);
$tmb_chr2=sprintf("%.4f",$num_chr2/$length_chr2);
$tmb_chr3=sprintf("%.4f",$num_chr3/$length_chr3);
$tmb_chr4=sprintf("%.4f",$num_chr4/$length_chr4);
$tmb_chr5=sprintf("%.4f",$num_chr5/$length_chr5);
$tmb_chr6=sprintf("%.4f",$num_chr6/$length_chr6);
$tmb_chr7=sprintf("%.4f",$num_chr7/$length_chr7);
$tmb_chr8=sprintf("%.4f",$num_chr8/$length_chr8);
$tmb_chr9=sprintf("%.4f",$num_chr9/$length_chr9);
$tmb_chr10=sprintf("%.4f",$num_chr10/$length_chr10);
$tmb_chr11=sprintf("%.4f",$num_chr11/$length_chr11);
$tmb_chr12=sprintf("%.4f",$num_chr12/$length_chr12);
$tmb_chr13=sprintf("%.4f",$num_chr13/$length_chr13);
$tmb_chr14=sprintf("%.4f",$num_chr14/$length_chr14);
$tmb_chr15=sprintf("%.4f",$num_chr15/$length_chr15);
$tmb_chr16=sprintf("%.4f",$num_chr16/$length_chr16);
$tmb_chr17=sprintf("%.4f",$num_chr17/$length_chr17);
$tmb_chr18=sprintf("%.4f",$num_chr18/$length_chr18);
$tmb_chr19=sprintf("%.4f",$num_chr19/$length_chr19);
$tmb_chr20=sprintf("%.4f",$num_chr20/$length_chr20);
$tmb_chr21=sprintf("%.4f",$num_chr21/$length_chr21);
$tmb_chr22=sprintf("%.4f",$num_chr22/$length_chr22);

my $tmb_mean=($tmb_chr1 + $tmb_chr2 +$tmb_chr3 +$tmb_chr4 +$tmb_chr5 +$tmb_chr6 +$tmb_chr7 +$tmb_chr8 +$tmb_chr9 +$tmb_chr10 +$tmb_chr11 +$tmb_chr12 +$tmb_chr13 +$tmb_chr14 +$tmb_chr15 +$tmb_chr16 +$tmb_chr17 +$tmb_chr18 +$tmb_chr19 +$tmb_chr20 +$tmb_chr21 +$tmb_chr22)/22;



print "$sample\t$tmb_mean\n";

