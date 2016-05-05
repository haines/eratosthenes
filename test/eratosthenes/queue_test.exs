defmodule Eratosthenes.QueueTest do
  use ExUnit.Case
  alias Eratosthenes.Queue

  doctest Queue

  test "current is nil for an empty list" do
    assert Queue.current(Queue.empty) == nil
  end

  test "current is a pair for a non-empty list" do
    q = Queue.empty |> Queue.insert(1, :one)
    assert Queue.current(q) == {1, :one}
  end

  test "current_value is nil for an empty list" do
    assert Queue.current_value(Queue.empty) == nil
  end

  test "current_value is a number for a non-empty list" do
    q = Queue.empty |> Queue.insert(1, :one)
    assert Queue.current_value(q) == 1
  end

  test "inserting values maintains the invariant" do
    a = Queue.empty |> Queue.insert(2, :two)
    assert_invariant a

    b = a |> Queue.insert(1, :one)
    assert_invariant b

    c = b |> Queue.insert(4, :four)
    assert_invariant c

    d = c |> Queue.insert(3, :three)
    assert_invariant d
  end

  test "reinserting replaces the current value" do
    q =
      Queue.empty
      |> Queue.insert(1, :one)
      |> Queue.insert(2, :two)
      |> Queue.reinsert(3, :three)

    assert Queue.current(q) == {2, :two}
  end

  test "reinserting values maintains the invariant" do
    a = Queue.empty |> Queue.insert(2, :two)
    assert_invariant a

    b = a |> Queue.insert(1, :one)
    assert_invariant b

    c = b |> Queue.insert(4, :four)
    assert_invariant c

    d = c |> Queue.reinsert(3, :three)
    assert_invariant d

    e = d |> Queue.reinsert(5, :five)
    assert_invariant e
  end

  test "entries can have the same value" do
    q = %Queue{x: 10, xs: :ten,
      left: %Queue{x: 25, xs: :twenty_five},
      right: %Queue{x: 12, xs: :twelve,
        left: %Queue{x: 49, xs: :forty_nine}
      }
    }

    assert_invariant(q |> Queue.reinsert(12, :twelve_again))
  end

  defp assert_invariant(%Queue{left: nil, right: nil}) do
  end

  defp assert_invariant(%Queue{x: x, left: left, right: nil}) do
    assert x <= left.x
    assert_invariant left
  end

  defp assert_invariant(%Queue{x: x, left: left, right: right}) do
    assert x <= left.x
    assert_invariant left

    assert x <= right.x
    assert_invariant right
  end
end
