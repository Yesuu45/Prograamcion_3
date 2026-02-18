defmodule Eco do
  @moduledoc """
  Dado un mensaje, imprimirlo en mayúsculas.
  """

  @doc """
  Dado un mensaje, imprimirlo en mayúsculas.
  ## Ejemplo

      iex> Eco.main("hola mundo")
      "HOLA MUNDO"

  """
  def main do
    mensaje = System.argv()
    |> List.first()
    mensaje_mayus = String.upcase(mensaje)
    IO.puts(mensaje_mayus)
  end
end

Eco.main()
