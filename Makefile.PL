use 5.008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile (
	NAME              => 'WWW::Search::Rambler',
	VERSION_FROM      => 'lib/WWW/Search/Rambler.pm',
	PREREQ_PM         => { 'WWW::Search' => 2.528,
			       'WWW::SearchResult' => 2.061,
			       'URI' => 1.31,
			       'URI::Escape' => 3.26,
			       'HTML::TreeBuilder' => 3.13,
			       'HTTP::Cookies' => 1.38 },
	($] >= 5.005 ?
		(ABSTRACT_FROM  => 'lib/WWW/Search/Rambler.pm',
		 AUTHOR         => 'Artur Penttinen <artur+perl@niif.spb.su>') : ()),
);
