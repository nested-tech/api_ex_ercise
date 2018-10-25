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

    test "with a two-element list, sums them up" do
      assert Calculator.add([40, 2]) == 42
    end

    # TODO: Again, this should really be a property-based
    # test rather than this "only 6 elements" bullshit
    test "with a 6-element list, sums them all up" do
      assert Calculator.add([12, 3, 14, 17, 92, 666]) == 804
    end
  end
end
