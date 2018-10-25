defmodule WebServer.CalculatorTest do
  use ExUnit.Case, async: true

  alias WebServer.Calculator

  test "has some method add/1 that returns nil" do
    assert Calculator.add(nil) == nil
  end
end
