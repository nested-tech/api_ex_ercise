defmodule WebServer.CalculatorTest do
  use ExUnit.Case, async: true

  alias WebServer.Calculator

  describe "add/1" do
    test "returns nil if we aren't given a List" do
      assert Calculator.add(nil) == nil
      assert Calculator.add("Hello, this clearly is ridiculous") == nil
      assert Calculator.add(0) == nil
    end

    test "returns 0 with an empty list" do
      assert Calculator.add([]) == 0
    end

    test "with a single element list, returns that element" do
      assert Calculator.add([12]) == 12
    end
  end
end
