defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.
  """

  @doc """
    main method

  ## Examples
      iex> Identicon.main("hola")
      "Has dicho: hola"
  """
  def main(input) do
    input
    |> hash_function
    |> pick_color
  end

  def hash_function(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def pick_color(%Identicon.Image{hex: [r,g,b | _tail]} = image) do
    %Identicon.Image{image | color: {r,g,b}}
  end
end
