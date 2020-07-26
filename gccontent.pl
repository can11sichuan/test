
#! /usr/bin/perl
use strict;
use warnings;
use Bio::SeqIO;
my $file=$ARGV[0];
my $fa=Bio::SeqIO->new(-file=>$file,-format=>'fasta');
while(my $seq_io=$fa->next_seq){
    my $id=$seq_io->id;
    my $seq=$seq_io->seq;
		my $seq2=$seq;
		$seq2=~s/A|T//gi;
		my $percent= length($seq2)/length($seq);
		print "$percent\n";
}
