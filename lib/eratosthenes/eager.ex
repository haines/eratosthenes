defmodule Eratosthenes.Eager do
  alias Eratosthenes.Queue

  def sieve(list, queue \\ Queue.empty)

  def sieve([], _) do
    []
  end

  def sieve([x | xs], queue) do
    if Queue.current_value(queue) <= x do
      sieve(xs, queue |> skip_values_less_than_or_equal_to(x))
    else
      [x | sieve(xs, queue |> add_multiples_of(x, xs))]
    end
  end

  defp add_multiples_of(queue, x, xs) do
    queue |> Queue.insert(x*x, xs |> Enum.map(&(x * &1)))
  end

  defp skip_values_less_than_or_equal_to(queue, x) do
    {y, [z | zs]} = Queue.current(queue)
    if y <= x do
      queue
      |> Queue.reinsert(z, zs)
      |> skip_values_less_than_or_equal_to(x)
    else
      queue
    end
  end
end
