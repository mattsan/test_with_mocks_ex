defmodule FizzBuzz do
  @moduledoc """
  Documentation for FizzBuzz.
  """

  @doc """
  外部コマンド `fb` を利用して FizzBuzz する。

  `fb` コマンドは各自実装してください。
  """
  def fizz_buzz(n) do
    {res, _} = System.cmd("fb", ["#{n}"])
    res
  end
end
