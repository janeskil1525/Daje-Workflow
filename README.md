[![Actions Status](https://github.com/janeskil1525/Daje-Workflow/actions/workflows/test.yml/badge.svg)](https://github.com/janeskil1525/Daje-Workflow/actions)
# NAME

Daje::Workflow - It's a simple workflow engine

# SYNOPSIS

    use Daje::Workflow;
    use Daje::Workflow::Loader;
    use Daje::Workflow::Database;
    use Daje::Workflow::Database::Model;

    my $context->{context}->{some_key_needed_by_some_activity}="";

    my $workflow = Daje::Workflow->new(
         pg            => $pg,
         loader        => $loader->loader,
         workflow_name => 'generate',
         workflow_pkey => '12',
         context       => $context,
    );

    $workflow->process("save_perl_file");
    say $workflow->error->error if $workflow->error->has_error() ;

# DESCRIPTION

Daje::Workflow is

# REQUIRES

[Daje::Workflow::Errors::Error](https://metacpan.org/pod/Daje%3A%3AWorkflow%3A%3AErrors%3A%3AError) 

[Daje::Workflow::Activities](https://metacpan.org/pod/Daje%3A%3AWorkflow%3A%3AActivities) 

[Daje::Workflow::Checks](https://metacpan.org/pod/Daje%3A%3AWorkflow%3A%3AChecks) 

[Daje::Workflow::Database::Model](https://metacpan.org/pod/Daje%3A%3AWorkflow%3A%3ADatabase%3A%3AModel) 

[Daje::Workflow::Database](https://metacpan.org/pod/Daje%3A%3AWorkflow%3A%3ADatabase) 

[Daje::Workflow::Loader](https://metacpan.org/pod/Daje%3A%3AWorkflow%3A%3ALoader) 

[Mojo::Base](https://metacpan.org/pod/Mojo%3A%3ABase) 

# METHODS

## process($self,

    process($self,();

## save\_workflow($self,

    save_workflow($self,();

# AUTHOR

janeskil1525 <janeskil1525@gmail.com>

# LICENSE

Copyright (C) janeskil1525.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
