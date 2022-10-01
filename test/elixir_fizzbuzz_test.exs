defmodule ElixirFizzbuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided" do
      expected = {:ok, [1, 2, :fizz, 4, :buzz, :buzz, :fizzbuzz, :buzz]}

      assert(
        "./priv/numbers.txt"
        |> ElixirFizzbuzz.build() == expected
      )
    end

    test "when a invalid file is provided" do
      expected = {:error, :enoent}

      assert(
        "./priv/$$numbers.txt"
        |> ElixirFizzbuzz.build() == expected
      )
    end
  end
end
