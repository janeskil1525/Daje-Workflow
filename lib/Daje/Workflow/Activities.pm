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
#    $activity = {
#             "name": "sql",
#             "activity": "Daje::Plugin::GenerateSQL",
#             "method": "genereate",
#             "resulting_state": "",
#             "pre_checks": [],
#             "post_checks":[],
#             "observers": [],
#             "activity_data": {
#               "Activity specific content"
#             }
#           }
#
#
#

has 'db';
has 'error';
has 'history';
has 'model';

sub activity($self, $context, $activity,                     ) {
    return 1 unless defined $activity;

    my $result = 1;
    if ($self->_pre_checks($activity->{pre_checks}
        and $self->error->has_error() == 0)) {
        if (my $e = load_class $activity->{activity}) {
            $self->error->add_error($e);
            $self->error->add_error($activity->{activity} . " Not found ");
        }
        return 0 if $self->error->has_error();

        my $activity_data;
        $activity_data = $activity->{activity_data}
            if exists $activity->{activity_data};

        $self->model->insert_history($activity->{method}, $activity->{activity}, 1);
        my $object = $activity->{activity}->new(
            context       => $context,
            db            => $self->db,
            error         => $self->error,
            model         => $self->model,
            activity_data => $activity_data,
        );
        my $method = $activity->{method};
        if ($object->can($method)) {
            eval {
                $object->$method
            };
            $self->error->add_error($@) if defined $@;
        }
        else {
            $self->error->add_error(
                $activity->{activity} .
                    " does not have a method called '" .
                    $activity->{method} . "'"
            );
        }
        if ($self->error->has_error() == 0) {
            if ($self->_post_checks($activity->{post_checks}
                and $self->error->has_error() == 0) ) {
                $self->_observers($activity->{post_checks} );
            }
        }
        if ($self->error->has_error() == 0) {
            $workflow_data->{state} = $activity->{resulting_state};
        }
    }

    return 1;
}

sub _observers($self, $observers) {

    return 1;
}

sub _post_checks($self, $post_checks) {

    return 1;
}

sub _pre_checks($self, $pre_checks) {

    return 1;
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

   $activity = {
            "name": "sql",
            "activity": "Daje::Plugin::GenerateSQL",
            "method": "genereate",
            "resulting_state": "",
            "pre_checks": [],
            "post_checks":[],
            "observers": [],
            "activity_data": {
              "Activity specific content"
            }
          }





=cut

