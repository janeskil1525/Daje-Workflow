package Daje::Workflow;
use Mojo::Base -base, -signatures;

use Daje::Workflow::Loader;
use Daje::Workflow::Database;
use Daje::Workflow::Database::Model;

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

our $VERSION = "0.01";

has 'workflow_name';    #
has 'workflow_pkey';    #
has 'context';          #
has 'loader';           #
has 'pg';               #

sub process($self) {

    my $db = $self->pg->db;
    my $tx = $db->begin;
    if ($self->_init($db)) {


    }

}

sub _init($self, $db) {

    my $data = Daje::Workflow::Database::Model->new(
        db            => $db,
        workflow_pkey => $self->workflow_pkey,
        workflow_name => $self->workflow_name,
        context       => $self->context,
    )->load();

    my $test = 1;

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
