#!/usr/bin/perl 
use strict;
my $infile=$ARGV[0]; 
my $gender=$ARGV[1]; 
my $sample=$ARGV[2]; 

my $num=0;
my $line;
open IN,"$infile" or die "can not open $infile\n";
while($line=<IN>){
	chomp $line;
	my @tmp=split(/\t/,$line);
	my $region=$tmp[5];
	my $funct=$tmp[8];
	
	if ($region=~/^exonic$/){
		if($funct=~/^synonymous\sSNV$/){
			next;
		}
		if($funct=~/^unknown$/){
			next;
		}
		$num++;
	}
	
}
close IN;

my $tmb;
if ($gender eq 'M'){
	$tmb=sprintf("%.2f",$num*1000000/38449302);
}else{
	$tmb=sprintf("%.2f",$num*1000000/38342646);
}

print "$sample\t$num\t$tmb\n";

