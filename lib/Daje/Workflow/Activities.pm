package Daje::Workflow::Activities;
use Mojo::Base -base, -signatures;

use Mojo::Loader qw(load_class);

# Daje::Workflow::Activities::Activity - Manage activities in the workflow
#
#
# METHODS
# =======
#
#    action($self, $context, $activity);
#
#    $activities = [
#           {
#             "name": "sql",
#             "activity": "Daje::Plugin::GenerateSQL",
#             "method": "genereate"
#           }
#         ]
#
#

has 'db';

sub activity($self, $context, $activity) {
    return 1 unless defined $activity;
    my $result = 1;


    my $length = scalar @{$activity};



}

1;