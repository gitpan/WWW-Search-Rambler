#!/usr/bin/perl
### Project: Rambler.RU Command-line interface
### File:    rambler-ru.pl
### Creator: Artur Penttinen <artur@arto.inet.fi>
### Creation date: 12-08-2004 Thu 20:21:56 EEST
### Last modified: <Thursday, 12-Aug-2004 20:35:47; artur>
###
### $Id: rambler-ru.pl,v 1.3 2004/08/12 17:36:03 artur Exp $
###

use strict;

use Getopt::Std;
use WWW::Search;
use Text::Wrap;

my $prg = $0; $prg =~ s|^.+/||;
my $VERSION = '$Revision: 1.3 $'; $VERSION =~ s|[^\d.]+||g;

my %opt;

getopts ("hc:",\%opt);

my $chset = $opt{'c'} || ($^O =~ m/win/i) ? "windows-1251" : "koi8-r";

if (exists ($opt{'h'}) || !@ARGV) {
    print STDERR "usage: $prg {options} text\n";
    print STDERR "\t-h\t- this text\n";
    print STDERR "\t-c chset - character set [$chset]\n";
    print STDERR "\n\t$prg version: $VERSION\n";
    exit;
}

my $search = new WWW::Search ("Rambler",'charset' => $chset);

$search->native_query ("@ARGV");

my $cnt = 0;
while (my $r = $search->next_result ()) {
    printf "%2d: %s <URL:%s>\n%s\n",++$cnt,$r->title,$r->url,
      wrap ("\t","\t",$r->description);
}

exit (0);

# That's all, folks!
