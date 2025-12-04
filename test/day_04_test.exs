defmodule Day04Test do
  use ExUnit.Case
  doctest Day04
  import AocHelper

  test "part 1 example" do
    assert Day04.part1("input/04_ex.txt") == 13
  end

  test "part 1 answer" do
    answer = solve_and_print "Day 04: Part 1", Day04.part1("input/04.txt")
    assert answer == 1435
  end

  test "part 2 example" do
    assert Day04.part2("input/04_ex.txt") == 43
  end

  test "part 2 answer" do
    answer = solve_and_print "Day 04: Part 2", Day04.part2("input/04.txt")
    assert answer == 8623
  end
end
