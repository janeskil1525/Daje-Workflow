package Daje::Workflow;
use Mojo::Base -base, -signatures;

our $VERSION = "0.01";

sub workflow4($self, $workflow, $workflow_pkey, $data) {
    unless ($workflow_pkey > 0) {
        $workflow_pkey = Daje::Workflow::Create::State->new()->create();
    }

}

1;
__END__

=encoding utf-8

=head1 NAME

Daje::Workflow - It's new $module

=head1 SYNOPSIS

    use Daje::Workflow;

=head1 DESCRIPTION

Daje::Workflow is ...

=head1 LICENSE

Copyright (C) janeskil1525.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

janeskil1525 E<lt>janeskil1525@gmail.comE<gt>

=cut

