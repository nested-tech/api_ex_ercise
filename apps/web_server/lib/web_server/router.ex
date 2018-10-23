defmodule WebServer.Router do
  @moduledoc """
  This file serves as the entry point to our `WebServer`. From here we decide
  how we're going to respond to different requests.

  # 1. Basic GET requests

  ## Testing

  In general, anything that responds to a GET can be tested using a
  **browser**.  This is because no request body is needed so the browser will
  just render whatever it wants. We should probably introduce some new tools
  here though

  ### GUI (recommended)

  The most common one I'm aware of is [Postman](https://www.getpostman.com/).
  There are others out there like [insomnia](https://insomnia.rest/) which may
  be worth checking out as well.

  ### Command line

  `curl` is a command line tool that is great for simple checks of endpoints:

  ```sh
  $ curl localhost:8666/hello
  I mean, Hi?
  ```

  A couple of things to note:

  1. We only need the domain (no `http://`)! `curl` defaults the
     scheme/protocol of the domain to `http`
  2. We haven't defined which HTTP method we want to use. `curl` defaults to `GET`
  3. Everything is configurable through arguments, check out the documentation
     by typing `man curl` for more info

  ## Exercise 1

  There are a couple of unimplemented endpoints in here, implement them!
  """

  # This gives us access to all the methods we're going to use here like `get/1`
  use Plug.Router
  # This shows a nice page when we fail to find routes
  use Plug.Debugger
  # This means we'll log requests
  plug(Plug.Logger)

  # These are Required [citation needed]
  plug(:match)
  plug(:dispatch)

  # Ignore these call/2 and init/1 functions! I'm doing this just to simplify
  # the generated documentation!
  @doc false
  def call(conn, opts), do: super(conn, opts)

  @doc false
  def init(opts), do: super(opts)

  # This is the magic!
  get "/hello" do
    send_resp(conn, 200, "I mean, Hi?\n")
  end

  # This just avoids irritating errors when using a browser, ignore this
  get "/favicon.ico" do
    send_resp(conn, 200, "Go away stupid browser, no icon for you")
  end

  # Exercise 1a
  #
  # We want this to return a response code of status 404, ideally
  # with some explanation
  #
  get "/missing" do
    # IMPLEMENTME
  end

  # Exercise 1b
  #
  # For this request, we want the response to simply return the parameters
  # passed in the request. For example, if the request is:
  #
  #     http://localhost/echo_params?foo=bar
  #
  # We want it to return a 200 with something like the following back:
  #
  #     foo=bar
  #
  # HINT: Use the `conn` struct to access info about the request. Check out the
  # documentation for this struct here: https://hexdocs.pm/plug/Plug.Conn.html
  #
  get "/echo_params" do
    # IMPLEMENTME
  end
end
