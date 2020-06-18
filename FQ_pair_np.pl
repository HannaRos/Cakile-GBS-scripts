################# FQ_pair.pl ####################
# Created by Kay Hodgins
# 
#
# Assumes: fasta file
#
# Run: perl FQ_Pipe.pl <FILENAME_to_process> <FILENAME_to_process>
#	
#	This script reads through fastq files and checks that sequences are present in both read directions. For any sequence that is present	
#	in both directions, the Fastq files are written to new fastq file called paried_oldfilename. Currently, there is nothing done with the "orphans" present in only one file or the other.
#
#
########################################################


#!usr/bin/perl
use strict;
use warnings;
#enter directory for with files for assembly

my $dir=$ARGV[0];

my $dir2=$ARGV[1];

open (IN, "<$dir") || die "$_ not found.\n"; 
open (IN2, "<$dir2") || die "$_ not found.\n"; 
open (OUT, ">paired_$dir");
open (OUT2, ">paired_$dir2");

my $s=0;
my @temp_array=();
my @ind_array=();
my %hash = ();
my $key=();
my @split=();
my %hash2 = ();

while(<IN>) { 
	chomp $_;  
	if (/^\s+$/){
	}elsif($s==0 && /^\@/){
		@split=split;
		push( @ind_array , $_);
		$key=$split[0];
		$s=1;
	}elsif ($s==1 ){
		push( @ind_array , $_);
		$s=2;
	}elsif ($s==2 && /^\+$/){	
		$s=3;
	}elsif ($s==3){
		push( @ind_array , $_);
		push (@{$hash{$key}}, [@ind_array]);
		$s=0;
		@ind_array=();
		@split=();
	}	
}

$s=0;
@temp_array=();
@ind_array=();
$key=();
@split=();


while(<IN2>) {
        chomp $_;
        if (/^\s+$/){
        }elsif($s==0 && /^\@/){
                @split=split;
                push( @ind_array , $_);
                $key=$split[0];
                $s=1;
        }elsif ($s==1 ){
                push( @ind_array , $_);
                $s=2;
        }elsif ($s==2 && /^\+$/){
                $s=3;
        }elsif ($s==3){
                push( @ind_array , $_);
                push (@{$hash2{$key}}, [@ind_array]);
                $s=0;
                @ind_array=();
                @split=();
        }
        else{
		print "error, line spacing is wrong!\n";	
	}
}





#for $_ ( keys %hash ) {
  #  print "$_\n";

#	print "hash $hash{$_}[0][0]\n";
#	print "hash $hash{$_}[0][1]\n";
#	print "hash $hash{$_}[0][2]\n";


 #  print "\n";
#}

#for $_ ( keys %hash2 ) {
    #print "$_\n";

	#print "hash $hash2{$_}[0][0]\n";
	#print "hash $hash2{$_}[0][1]\n";
	#print "hash $hash2{$_}[0][2]\n";


 #   print "\n";
#}

foreach $key (keys %hash){
	if (exists $hash2{$key}){
		print OUT "$hash{$key}[0][0]\n";
		print OUT "$hash{$key}[0][1]\n";
		print OUT "+\n";
		print OUT "$hash{$key}[0][2]\n";
		print OUT2 "$hash2{$key}[0][0]\n";
		print OUT2 "$hash2{$key}[0][1]\n";
		print OUT2 "+\n";
		print OUT2 "$hash2{$key}[0][2]\n";
	}
}
