defmodule WebServer.Calculator do
  @moduledoc """
  This module implements some basic mathematical magic
  """

  def add([]), do: 0

  def add([number]), do: number

  def add([number1, number2]), do: number1 + number2

  def add([head | tail]), do: head + add(tail)

  def add(_), do: nil
end
