defmodule Eratosthenes.Lazy do
  alias Eratosthenes.Queue

  def sieve(numbers, queue \\ Queue.empty) do
    {numbers, queue} |> Stream.unfold(&next_prime/1)
  end

  defp next_prime({numbers, queue}) do
    {x, xs} = Iterator.next(numbers)

    if Queue.current_value(queue) <= x do
      next_prime({xs, queue |> skip_values_less_than_or_equal_to(x)})
    else
      {x, {xs, queue |> add_multiples_of(x, xs)}}
    end
  end

  defp add_multiples_of(queue, x, xs) do
    queue |> Queue.insert(x*x, xs |> Iterator.multiply(x))
  end

  defp skip_values_less_than_or_equal_to(queue, x) do
    {y, ys} = Queue.current(queue)
    if y <= x do
      {z, zs} = Iterator.next(ys)

      queue
      |> Queue.reinsert(z, zs)
      |> skip_values_less_than_or_equal_to(x)
    else
      queue
    end
  end
end
