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

  # 2. Building a calculator

  Simply returning plain text is fine, but what about if we want it to do
  something?

  Let's try a calculator, because numbers are fun!

  HINT: If you check out the [`Plug.Conn` documentation](https://hexdocs.pm/plug/Plug.Conn.html),
  you will see that within the `conn` struct we have access to, we can get all
  sorts of bits and pieces from the request.

  ## Exercise 2 - using the URL path

  Let's add two numbers together, and let's say we are defining our API like this:

  ```sh
  $ curl localhost:8666/calculator/add/7/5
  12
  ```

  There is an outline of the `GET` request we want below, but it has yet to be
  implemented, so please do so! We're just adding two numbers, that should be
  easy right?

  If it is well easy (it may be), go ahead and implement other endpoints like
  `/subtract` and `/multiply`

  ## Exercise 3 - using the query parameters

  The above implementation has a serious flaw; we can only ever add two numbers! I
  love numbers, I want to add them all up, so how could we do that?

  Here's an alternative implementation:

  ```sh
  $ curl localhost:8666/calculator/add?numbers=7,5,18
  30
  ```

  This uses the URL path to declare that we want to add stuff up, then the
  query parameters to define a more complex/flexible set of numbers.

  Implement this!

  # Refactoring our calculator

  We now have some tests, but some aren't implemented and one is poorly written! From here on we're just going to be hands on, so it's all up to you to do the following exercises:

  # Exercise 4 - Build out our test suite

  Fix the poorly written test and implement the ones which aren't implemented yet

  # Exercise 5 - Extract our Calculator

  Create a new file `apps/lib/web_server/lib/calculator.ex` and implement a
  `Calculator` module that has an `add` function to do our maths for us

  Now pull all of the logic for doing the adding into that `Calculator` module,
  using the tests to make sure we haven’t broken anything

  **Bonus points**: Write tests for our new module
  """

  alias WebServer.Calculator

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

  # Exercise 1a
  #
  # We want this to return a response code of status 404, ideally
  # with some explanation
  #
  get "/missing" do
    send_resp(conn, 404, "These aren't the droids you're looking for\n")
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
    send_resp(conn, 200, conn.query_string <> "\n")
  end

  # Exercise 2
  #
  # This should simply add two numbers.
  #
  # If you want to do something with part of the URL path, we can strip
  # variables out accessed through the placeholders with a ":".
  #
  # So in the example below, you should be able to access variables called
  # `number` and `number2` from somewhere...
  #
  get "/calculator/add/:number1/:number2" do
    sum =
      [number1, number2]
      |> Enum.map(&String.to_integer(&1))
      |> Calculator.add()

    send_resp(conn, 200, Integer.to_string(sum) <> "\n")
  end

  # Exercise 3
  #
  # This endpoint should use the  query parameters to add up an arbitrary list
  # of numbers
  #
  get "/calculator/add" do
    %{"numbers" => numbers} =
      conn
      |> fetch_query_params
      |> Map.get(:query_params)

    sum =
      numbers
      |> String.split(",")
      |> Enum.map(&String.to_integer(&1))
      |> Calculator.add()
      |> Integer.to_string()

    send_resp(conn, 200, sum <> "\n")
  end
end
