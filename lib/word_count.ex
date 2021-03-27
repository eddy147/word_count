defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.replace(~r"[!&@\$%\^&]+", "")
    |> String.split([" ", ":", ",","_"], trim: true)
    |> list_to_map(%{})
  end

  def list_to_map([], %{} = m), do: m

  def list_to_map([head | tail], %{} = m) do
    list_to_map(tail, Map.update(m, head, 1, &(&1 + 1)))
  end
end
