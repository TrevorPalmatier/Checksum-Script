use strict;

if(@ARGV != 3){
	die("Expected arguments: [file path to the file to be checked] [hash type] [expected checksum]");
}

my $command = "certutil -hashfile " . $ARGV[0] . " " . $ARGV[1];

my @certutiloutput = qx/$command/;

chomp (@certutiloutput);

if($ARGV[2] eq $certutiloutput[1]){
	print "Checksum Verified";
}else{
	print "WARNING: Checksum is not the same";
}