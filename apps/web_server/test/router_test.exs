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
    test "if given a single number, returns it"

    test "correctly adds two numbers"

    test "correctly adds five numbers"
  end
end
