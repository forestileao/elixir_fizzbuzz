defmodule ElixirFizzbuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, content}) do
    result =
      content
      |> String.split(",")
      |> evaluate_numbers()

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, reason}

  defp evaluate_numbers(numbers) do
    numbers
    |> Enum.map(fn number ->
      number
      |> String.to_integer()
      |> assign_value()
    end)
  end

  defp assign_value(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp assign_value(number) when rem(number, 3) == 0, do: :fizz
  defp assign_value(number) when rem(number, 5) == 0, do: :buzz
  defp assign_value(number), do: number
end
