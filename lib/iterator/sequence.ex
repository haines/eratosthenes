defmodule Iterator.Sequence do
  alias __MODULE__
  
  defstruct [:value, :step]

  def from(value, [step: step] \\ [step: 1]) do
    %Sequence{value: value, step: step}
  end
end

defimpl Iterator, for: Iterator.Sequence do
  alias Iterator.Sequence

  def next(%Sequence{value: value, step: step}) do
    {value, Sequence.from(value + step, step: step)}
  end
end
