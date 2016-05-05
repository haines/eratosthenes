defmodule Iterator.Multiples do
  defstruct [:of, :factor]
end

defimpl Iterator, for: Iterator.Multiples do
  alias Iterator.Multiples

  def next(%Multiples{of: numbers, factor: factor}) do
    {x, xs} = Iterator.next(numbers)
    {x * factor, %Multiples{of: xs, factor: factor}}
  end
end
