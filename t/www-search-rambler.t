#! /usr/bin/perl
#

use Test::More tests => 4;

BEGIN {
    use_ok ("WWW::Search");
    use_ok ("WWW::Search::Rambler");
};

our $VERSION = (qw$Revision: 1.1 $)[1];

my $ss = new WWW::Search ("Rambler",'charset' => "koi8-r");
$ss->env_proxy (1);
# $ss->{'_debug'} = 10;

isa_ok ($ss,"WWW::Search");

$ss->native_query ("Артур Пенттинен");

my $cnt = 0;
while (my $r = $ss->next_result ()) {
    $cnt++;
    printf "%02d: %s: %s\n\t%s\n",$cnt,$r->title (),$r->url (),
      $r->description ();
}

ok ($cnt > 9,"number of results");

exit;

# That's all, folks!
