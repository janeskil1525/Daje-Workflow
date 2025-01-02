package Daje::Workflow;
use Mojo::Base -base, -signatures;

use Daje::Workflow::Loader;
use Daje::Workflow::Database;
use Daje::Workflow::Database::Model;
use Daje::Workflow::Checks;
use Daje::Workflow::Activities;
use Daje::Workflow::Errors::Error;

# NAME
# ====
#
# Daje::Workflow - It's new $module
#
# SYNOPSIS
# ========
#
#    use Daje::Workflow;
#
#
# DESCRIPTION
# ===========
# Daje::Workflow is ...
#
# LICENSE
# =======
#
# Copyright (C) janeskil1525.
#
# This library is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
#
# AUTHOR
# ======
# janeskil1525 E<lt>janeskil1525@gmail.comE<gt>
#

our $VERSION = "0.02";

has 'workflow_name';    #
has 'workflow_pkey';    #
has 'context';          #
has 'loader';           #
has 'pg';               #

has 'error';
has 'workflow_data';


sub process($self, $activity_name) {


    my $result = 0;
    my $db = $self->pg->db;
    my $tx = $db->begin;
    if ($self->_init($db)) {
        if ($self->_state_pre_checks()
            and $self->error->has_error() == 0) {
            if($self->_activity($db, $activity_name)
                and $self->error->has_error() == 0) {

            }
        }

    }
    return $result;
}

sub _activity($self, $db, $activity_name) {
    my $result = 1;
    my $activity = $self->loader->get_activity(
        $self->workflow_name, $self->workflow_data->{state}, $activity_name
    );

    if(defined $activity) {
        $result = Daje::Workflow::Activities->new(
            db    => $db,
            error => $self->error,
        )->activity(
            $self->context, $activity
        );
    }

    return $result;
}

sub _state_post_checks($self) {
    my $result = 1;
    my $checks = $self->loader->get_post_checks(
        $self->workflow_name, $self->workflow_data->{state}
    );
    if(defined $checks) {
        $result = Daje::Workflow::Checks->new(
            error => $self->error
        )->check(
            $self->context, $checks
        );
    }


    return $result;
}

sub _state_pre_checks($self) {
    my $result = 1;
    my $checks = $self->loader->get_pre_checks(
        $self->workflow_name, $self->workflow_data->{state}
    );
    if(defined $checks) {
        $result = Daje::Workflow::Checks->new(
            error => $self->error
        )->check(
            $self->context, $checks
        );
    }

    return $result;
}

sub _init($self, $db) {

    my $data = Daje::Workflow::Database::Model->new(
        db            => $db,
        workflow_pkey => $self->workflow_pkey,
        workflow_name => $self->workflow_name,
        context       => $self->context,
    );
    $data->load();
    $self->workflow_data($data->workflow_data());
    $self->context($data->context());
    $self->workflow_pkey($self->workflow_data->{workflow_pkey});
    my $error = Daje::Workflow::Errors::Error->new();
    $self->error($error);
    return 1;
}

1;
__END__






#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME


Daje::Workflow - It's new $module



=head1 SYNOPSIS


   use Daje::Workflow;




=head1 DESCRIPTION

Daje::Workflow is ...



=head1 REQUIRES

L<Daje::Workflow::Errors::Error> 

L<Daje::Workflow::Activities> 

L<Daje::Workflow::Checks> 

L<Daje::Workflow::Database::Model> 

L<Daje::Workflow::Database> 

L<Daje::Workflow::Loader> 

L<Mojo::Base> 


=head1 METHODS

=head2 process($self,

 process($self,();


=head1 AUTHOR

janeskil1525 E<lt>janeskil1525@gmail.comE<gt>



=head1 LICENSE


Copyright (C) janeskil1525.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.



=cut

