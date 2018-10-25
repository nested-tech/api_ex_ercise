defmodule WebServer.CalculatorTest do
  use ExUnit.Case, async: true

  alias WebServer.Calculator

  test "returns nil if we aren't given a List" do
    assert Calculator.add(nil) == nil
    assert Calculator.add("Hello, this clearly is ridiculous") == nil
    assert Calculator.add(0) == nil
  end
end
