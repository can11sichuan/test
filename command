## command and parameters used##
#NOVOPlasty: perl NOVOPlasty.pl -c config.txt
#MISA: perl misa.pl file.fa
#MAFFT: mafft file.fa >file_2.fa
#Prank: prank -codon -d=file.fa -o=file.prank 
#Raxml: raxmlHPC -PTHREADS-SSE3 -f a -x 12345 -p 12345 -#1000 -m GTRGAMMA -s file.phy -n ex -T 40
#PAUP: (1)execute file.nex;(2)set criterion=parsimony MaxTrees=1000;(3)hsearch addseq=random nreps=1000;(4)describetrees 1/ plot=phylogram brlens=yes;
#Mrbayes: (1)execute file.nex;(2)lset nst=6 rates=invgamma;(3)mcmc ngen=2000000 samplefreq=1000 printfreq=500 diagnfreq=5000;(4)sump burnin=500;(5)sumt burnin=500.
