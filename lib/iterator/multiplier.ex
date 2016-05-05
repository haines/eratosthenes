defmodule Iterator.Multiplier do
  alias Iterator.Multiples

  def multiply(%Multiples{of: numbers, factor: factor}, by_factor) do
    %Multiples{of: numbers, factor: factor * by_factor}
  end

  def multiply(numbers, by_factor) do
    %Multiples{of: numbers, factor: by_factor}
  end
end
