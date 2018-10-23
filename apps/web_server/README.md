# WebServer

This implements a basic webserver responding to a `/hello` resource with a
message. Nothing more. That fun is all yet to come!

## Running

This uses a [Supervisor](https://hexdocs.pm/elixir/Supervisor.html) to allow us
to start the server simply by starting an `iex` shell:

    $ iex -S mix

This can then be hit on the default URL either in a browser or using curl:

    $ curl localhost:8666/hello
    I mean, Hi?
