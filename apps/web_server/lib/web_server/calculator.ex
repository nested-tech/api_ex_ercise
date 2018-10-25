defmodule WebServer.Calculator do
  @moduledoc """
  This module implements some basic mathematical magic
  """

  def add([]), do: 0

  def add([head | tail]), do: head + add(tail)

  def add(_), do: nil
end
