#!/usr/bin/perl -w

chdir ("/home/nsuser/shell");

#
# Recherche la derniere changelist submitee $lastcl
#
$P4="/usr/local/bin/p4";
$res= `$P4 changes -m 1 -s submitted`;
chomp($res);
$lastcl=awk(" ","2",$res);
print "lastcl=$lastcl\n";

#
# Recupere la derniere changelist validee $oldcl
#
@res=cher("OLDCL=","oldcl");
$oldcl=awk("=","2",$res[0]);
print "oldcl=$oldcl\n";

#
# Partie 1 de l'affichage (build en cours, ou programmee, ou pas de build)
#
if (-e "smac")
#if (-e ".build")
{
	print "UNE BUILD EST EN COURS\n";
} elsif (-e "smac2")
#} elsif (-e "clutil")
{
	@res=cher("DATECL=","nutinfos");
	$tempcl=awk("=","2",$res[0]);
	print "tempcl=$tempcl\n";
	$ref=`date`;
	chomp($ref);
	print "ref=$ref\n";
	$ref=awk(" ","4",$ref);
	print "ref=$ref\n";
	$refh=awk(":","1",$ref)*3600;
	print "refh=$refh\n";
	$refm=awk(":","2",$ref)*60;
	print "refm=$refm\n";
	$refs=awk(":","3",$ref);
	print "refs=$refs\n";
	$ref=$refh+$refm+$refs;
	print "ref=$ref\n";
	$time=$tempcl - $ref;
	$min=int $time / 60;
	$sec=$time % 60;
	print "PROCHAINE BUILD DANS $min MINUTES $sec SECONDES\n";
} else
{
	print "PAS DE BUILD EN COURS\n";
}

#
# Partie 2 de l'affichage (derniere changelist validee)
#

print "Dernière changelist validée : $oldcl\n";

#
# Partie 3 de l'affichage (changelist non validee)
#

if (-e clutil.old)
{
	open (CLUTILOLD,"clutil.old") || die "Cannot open clutil for reading: $!";
	print "LA DERNIERE BUILD N'EST PAS PASSEE\n";
	print "Changelists non validées :\n\n";
	while ($cl = <CLUTIL>)
	{
		chomp($cl);
		print "<B>$cl</B>\n";
	}
}
########################################################################
sub awk
{
       my($sep, $num, $chaine)=@_;
       my @res=split(/$sep/,$chaine);
       my $res=$res[--$num];
       return $res;
}
sub cher
{
	my($motif,$fichier)=@_;
	open(FIC,$fichier) || die "Can't open $fichier: $!";
	while (<FIC>)
	{
		if (/$motif/)
		{
			chomp ($_);
			return ($_);
		}
	}
}
