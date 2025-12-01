defmodule Day01Test do
  use ExUnit.Case
  doctest Day01
  import AocHelper

  test "part 1 example" do
    assert Day01.part1("input/01_ex1.txt") == 3
  end

  test "part 1 answer" do
    answer = solve_and_print "Day 01: Part 1", Day01.part1("input/01.txt")
    assert answer == 1180
  end

  test "part 2 example" do
    assert Day01.part2("input/01_ex1.txt") == 6
  end

  test "part 2 answer" do
    answer = solve_and_print "Day 01: Part 2", Day01.part2("input/01.txt")
    assert answer == 6892
  end
end
