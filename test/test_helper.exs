ExUnit.start()

defmodule AocHelper do
  @moduledoc """
  A helper macro for running and timing AoC solutions.
  Provides a clean, timed output for "answer" tests.
  """

  @doc """
  Runs a function call, times it, and prints a formatted result.

  ## Example
      assert solve_and_print("Day 01: Part 1", Day01.part1("path")) == 12345
  """
  defmacro solve_and_print(label, fun_call) do
    quote do
      {time_us, result} = :timer.tc(fn -> unquote(fun_call) end)
      time_ms = time_us / 1000

      IO.puts(
        "\n" <>
          IO.ANSI.bright() <>
          IO.ANSI.underline() <>
          unquote(label) <>
          IO.ANSI.reset()
      )

      IO.puts("┣  Result: " <> IO.ANSI.bright() <> "#{result}" <> IO.ANSI.reset())
      IO.puts("┗  Time:   #{:erlang.float_to_binary(time_ms, [decimals: 3])} ms")

      result
    end
  end
end
