defmodule Day02Test do
  use ExUnit.Case
  doctest Day02
  import AocHelper

  test "part 1 example" do
    assert Day02.part1("input/02_ex.txt") == 3
  end

  test "part 1 answer" do
    answer = solve_and_print "Day 02: Part 1", Day02.part1("input/02.txt")
    assert answer == 1180
  end

  # test "part 2 example" do
  #   assert Day02.part2("input/02_ex.txt") == 6
  # end

  # test "part 2 answer" do
  #   answer = solve_and_print "Day 02: Part 2", Day02.part2("input/02.txt")
  #   assert answer == 6892
  # end
end
