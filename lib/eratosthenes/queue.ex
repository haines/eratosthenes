defmodule Eratosthenes.Queue do
  alias __MODULE__

  # Invariant: x <= left.x and x <= right.x
  defstruct [:x, :xs, :left, :right]

  def empty do
    %Queue{}
  end

  def current(%Queue{x: nil}) do
    nil
  end

  def current(%Queue{x: x, xs: xs}) do
    {x, xs}
  end

  def current_value(%Queue{x: nil}) do
    nil
  end

  def current_value(%Queue{x: x}) do
    x
  end

  def insert(queue, x, xs) do
    union(queue, singleton(x, xs))
  end

  def reinsert(%Queue{left: nil, right: nil}, x, xs) do
    singleton(x, xs)
  end

  def reinsert(%Queue{left: left, right: nil}, x, xs) do
    left |> insert(x, xs)
  end

  def reinsert(%Queue{left: left, right: right}, x, xs) do
    left |> insert(x, xs) |> union(right)
  end

  defp singleton(x, xs) do
    %Queue{x: x, xs: xs}
  end

  defp union(a, %Queue{x: nil}) do
    a
  end

  defp union(%Queue{x: nil}, b) do
    b
  end

  defp union(%Queue{x: x_a, left: nil} = a, %Queue{x: x_b} = b) when x_a <= x_b do
    %{a | left: b}
  end

  defp union(%Queue{x: x_a, right: nil} = a, %Queue{x: x_b} = b) when x_a <= x_b do
    %{a | right: b}
  end

  defp union(%Queue{x: x_a} = a, %Queue{x: x_b} = b) when x_a <= x_b do
    %{a | left: a.right, right: union(a.left, b)}
  end

  defp union(a, b) do # x_a > x_b
    union(b, a)
  end
end
