defmodule Eratosthenes.LazyTest do
  use ExUnit.Case
  alias Eratosthenes.Lazy
  alias Iterator.Sequence

  doctest Lazy

  test "sieving a sequence gives a stream of primes" do
    assert Sequence.from(3, step: 2) |> Lazy.sieve |> Enum.take(14) == [3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
  end
end
