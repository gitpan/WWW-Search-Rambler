#! /usr/bin/perl
#

use Test::More tests => 4;

BEGIN {
    use_ok ("WWW::Search");
    use_ok ("WWW::Search::Rambler");
};

my $VERSION = '$Revision: 1.1 $'; $VERSION =~ s|[^\d.]+||g;

my $ss = new WWW::Search ("Rambler",'charset' => "koi8-r");
# $ss->{'_debug'} = 10;

ok (defined ($ss) && ref ($ss) eq "WWW::Search::Rambler","new instance");

$ss->native_query ("Артур Пенттинен");

my $cnt = 0;
while (my $r = $ss->next_result ()) {
    printf "%02d: %s: %s\n\t%s\n",++$cnt,$r->title (),$r->url (),
      $r->description ();
}

ok ($cnt > 10,"number of resxults");

exit;

# That's all, folks!
