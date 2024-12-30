package Daje::Workflow::Checks;
use Mojo::Base -base, -signatures;

use Mojo::Loader qw(load_class);

# Daje::Workflow::Checks - is an inteface class to pre and post checks
#
# METHODS
# =======
#
#   check($self, $context, $checks)
#
#   $checks = [
#       {
#           "name":"Mandatory fields",
#           "class": "Daje::Workflow::Checks::Mandatory",
#           "checks": "sql_path,perl_path"
#        }
#   ]
#
#

sub check($self, $context, $checks) {
    return 1 unless defined $checks;

    my $length = scalar @{$checks};
    for (my $i = 0; $i < $length; $i++) {
        my $class = load_class @{$checks}[$i]->{class};
        my $result = $class->new(
            context => $context,
            checks => @{$checks}[$i]->{checks},
        )->check();
    }

}
1;