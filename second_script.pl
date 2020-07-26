#!/uer/bin/perl -w
use strict;
use warnings;
use Bio::SeqIO;
my $usage  = "\n perl cds_extract.pl file \n";
my $file   = $ARGV[0] or die $usage;
my ($pro_gene,@pro_gene,$total_cds,$val,$val_new);
my $inseq = Bio::SeqIO->new(-file => "<$file",-format => 'genbank',);
while (my $seq_object = $inseq->next_seq) {
    for my $feat_object ($seq_object->get_SeqFeatures) {
	if ($feat_object->primary_tag eq "source") {
	    if ($feat_object->has_tag('organism')){
		for my $species($feat_object->get_tag_values('organism')){
		    $_ = $species;
		    s/\s|-/_/;s/\s.*//;
		    $species = $_."_";
		    for my $feat_object ($seq_object->get_SeqFeatures) {
			if ($feat_object->primary_tag eq "CDS") {
			    my $cds = $feat_object->spliced_seq->seq;
				$total_cds.=$cds;
				my $cds_length=length($cds);
				if ( $cds_length%3==0 ){
			    if ($feat_object->has_tag('gene')) {
				for $val ($feat_object->get_tag_values('gene')){
				next if ( $val eq "ycf15" );
				my $start = $feat_object->location->end;
				next if ($val eq "ycf1" && $start <= 129000);# please be careful of this number and throughout
				    print ">",$species,$val,"\n";
					print $cds."\n";
				}
			    }elsif($feat_object->has_tag('label')){
				 for $val ( $feat_object->get_tag_values('label')){
				next if ( $val eq "ycf15" );
				my $start = $feat_object->location->end;
				next if ($val eq "ycf1" && $start <= 129000);
					print ">",$species,$val,"\n";
					print $cds."\n";
					}
				}elsif($feat_object->has_tag('product')){
					for $val ( $feat_object->get_tag_values('product')){
				next if ( $val eq "ycf15" );
				my $start = $feat_object->location->end;
				next if ($val eq "ycf1" && $start <= 129000);
					print ">",$species,$val,"\n";
					print $cds."\n";
					}
				}else{
		 $val_new="";
		for my $tag ($feat_object->get_all_tags) {
					my @val = $feat_object->get_tag_values($tag);
					 if ($tag ne "db_xref" && $tag ne "codon_start" && $tag ne "translation" && $tag ne "transl_table" && $tag ne "trans_splicing"){
					 $val_new.=$val[0];
					 }
					}
					print ">",$species,$val_new,"\n";
					print $cds."\n";
				}
			}else{
		    if ($feat_object->has_tag('gene')) {
				for $val ($feat_object->get_tag_values('gene')){
				next if ( $val eq "ycf15" );
				my $start = $feat_object->location->end;
				next if ($val eq "ycf1" && $start <= 129000);
				    print ">",$species,$val,"\n";
					print $cds."\n";
				}
			    }elsif($feat_object->has_tag('label')){
				 for $val ( $feat_object->get_tag_values('label')){
				next if ( $val eq "ycf15" );
				my $start = $feat_object->location->end;
				next if ($val eq "ycf1" && $start <= 129000);
					print ">",$species,$val,"\n";
					print $cds."\n";
					}
				}elsif($feat_object->has_tag('product')){
					for $val ( $feat_object->get_tag_values('product')){
				next if ( $val eq "ycf15" );
				my $start = $feat_object->location->end;
				next if ($val eq "ycf1" && $start <= 129000);
					print ">",$species,$val,"\n";
					print $cds."\n";
					}
				}else{
		 $val_new="";
		for my $tag ($feat_object->get_all_tags) {
					my @val = $feat_object->get_tag_values($tag);
					 if ($tag ne "db_xref" && $tag ne "codon_start" && $tag ne "translation" && $tag ne "transl_table" && $tag ne "trans_splicing"){
					 $val_new.=$val[0];
					 }
					}
					print ">",$species,$val_new,"\n";
					print $cds."\n";
					}
			push @pro_gene,$val;
			}
		    }
		}
	    }
	}
    }
}
}
print "@pro_gene\n";
