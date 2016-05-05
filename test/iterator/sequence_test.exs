defmodule Iterator.SequenceTest do
  use ExUnit.Case
  alias Iterator.Sequence

  doctest Sequence

  test "a sequence of numbers separated by a step" do
    a = Sequence.from(42, step: 3)

    {first, b} = Iterator.next(a)
    assert first == 42

    {second, c} = Iterator.next(b)
    assert second == 45

    {third, _} = Iterator.next(c)
    assert third == 48
  end

  test "step defaults to 1" do
    a = Sequence.from(50)

    {first, b} = Iterator.next(a)
    assert first == 50

    {second, c} = Iterator.next(b)
    assert second == 51

    {third, _} = Iterator.next(c)
    assert third == 52
  end

  test "multiplying a sequence" do
    a = Sequence.from(1) |> Iterator.multiply(2)

    {first, b} = Iterator.next(a)
    assert first == 2

    {second, c} = Iterator.next(b)
    assert second == 4

    {third, _} = Iterator.next(c)
    assert third == 6
  end

  test "multiples of multiples" do
    a = Sequence.from(1) |> Iterator.multiply(2) |> Iterator.multiply(3)

    {first, b} = Iterator.next(a)
    assert first == 6

    {second, c} = Iterator.next(b)
    assert second == 12

    {third, _} = Iterator.next(c)
    assert third == 18
  end
end
