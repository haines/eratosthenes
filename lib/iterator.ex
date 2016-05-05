defprotocol Iterator do
  def next(numbers)
  defdelegate multiply(numbers, by_factor), to: Iterator.Multiplier
end
