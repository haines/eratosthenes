defmodule EratosthenesEagerTest do
  use ExUnit.Case
  alias Eratosthenes.Eager

  doctest Eager

  test "sieving an empty list gives an empty list" do
    assert Eager.sieve([]) == []
  end

  test "sieving a non-empty list gives a list of primes" do
    assert Enum.to_list(2..50) |> Eager.sieve == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
  end
end
