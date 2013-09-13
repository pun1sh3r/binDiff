#!/usr/bin/perl -w
use POSIX ":sys_wait_h";
use IO::Handle;
use strict;


my $size = -s "HW-1-4(e)-redo-dd.001";



open my $bin1, '<', "HW-1-4(e)-redo-dd.001" or die($!);
open my $bin2, '<',	"HW-1-4(b)-redo-dd.001" or die ($!);
binmode($bin1);
binmode($bin2);
my $bin1buff;
my $bin2buff;
my $i = 0;


print"offset,HW-1-4(e).dd.001,HW-1-4(b).dd.001";
for($i = 0; $i <= $size; $i++)
{
	read($bin1, $bin1buff,1 );
	read($bin2, $bin2buff,1 );
	if($bin1buff ne $bin2buff)
	{
		print "\n$i,".unpack('H*', $bin1buff).",".unpack('H*', $bin2buff);
	}
}


close $bin1;
close $bin2;
