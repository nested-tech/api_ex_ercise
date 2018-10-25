defmodule WebServer.RouterTest do
  use ExUnit.Case
  use Plug.Test

  alias WebServer.Router

  @opts Router.init([])

  test "the '/hello' endpoint" do
    conn =
      conn(:get, "/hello")
      |> Router.call(@opts)

    assert conn.status == 200
    assert conn.resp_body == "I mean, Hi?\n"
  end

  test "the '/missing' endpoint" do
    conn =
      conn(:get, "/missing")
      |> Router.call(@opts)

    assert conn.status == 404
    assert conn.resp_body == "These aren't the droids you're looking for\n"
  end

  describe "/echo_params" do
    test "returns a newline character if there are no parameters" do
      conn =
        conn(:get, "/echo_params")
        |> Router.call(@opts)

      assert conn.status == 200
      assert conn.resp_body == "\n"
    end

    test "returns a single parameter" do
      conn =
        conn(:get, "/echo_params?foo=bar")
        |> Router.call(@opts)

      assert conn.status == 200
      assert conn.resp_body == "foo=bar\n"
    end

    test "returns multiple parameters" do
      conn =
        conn(:get, "/echo_params?foo=bar&elixir=cool")
        |> Router.call(@opts)

      assert conn.status == 200
      assert conn.resp_body == "foo=bar&elixir=cool\n"
    end
  end

  describe "/calculator/add/number1/number2" do
    test "correctly adds two numbers" do
      conn =
        conn(:get, "/calculator/add/3/10")
        |> Router.call(@opts)

      assert conn.status == 200
      assert conn.resp_body == "13\n"
    end
  end

  describe "/calculator/add with query parameters" do
    test "if given a single number, returns it" do
      conn =
        conn(:get, "/calculator/add?numbers=1")
        |> Router.call(@opts)

      assert conn.status == 200
      assert conn.resp_body == "1\n"
    end

    test "correctly adds two numbers" do
      conn =
        conn(:get, "/calculator/add?numbers=2,10")
        |> Router.call(@opts)

      assert conn.status == 200
      assert conn.resp_body == "12\n"
    end

    # TODO: This is a bit rubbish, what about 6/7/etc? We might endup tailoring
    # our implementation to this. This should probably be implemented using
    # property-based testing!
    #
    # I'm lazy and not doing this for this example though, so if you're
    # interested check this out:
    # https://elixir-lang.org/blog/2017/10/31/stream-data-property-based-testing-and-data-generation-for-elixir/
    #
    test "correctly adds five numbers" do
      conn =
        conn(:get, "/calculator/add?numbers=3,82,106,12,14")
        |> Router.call(@opts)

      assert conn.status == 200
      assert conn.resp_body == "217\n"
    end
  end
end
