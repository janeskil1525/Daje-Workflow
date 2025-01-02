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
has 'error';

sub activity($self, $context, $activity) {
    return 1 unless defined $activity;
    my $result = 1;

    my $class = load_class $activity->{activity};
    # $class->import();
    my $object = $$activity->{activity}->new(
        context => $context,
        checks  => @{$checks}[$i]->{checks},
        error   => $self->error,
        db      => $self->db,
    );

    $object->$activity->{method}();


}

1;
#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

Daje::Workflow::Activities


=head1 DESCRIPTION

Daje::Workflow::Activities::Activity - Manage activities in the workflow




=head1 REQUIRES

L<Mojo::Loader> 

L<Mojo::Base> 


=head1 METHODS


   action($self, $context, $activity);

   $activities = [
          {
            "name": "sql",
            "activity": "Daje::Plugin::GenerateSQL",
            "method": "genereate"
          }
        ]




=cut

