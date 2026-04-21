defmodule Util do
  def ingresar(mensaje, :texto) do
    IO.gets("#{mensaje}: ") |> String.trim()
  end

  def ingresar(mensaje, :numero) do
    IO.gets("#{mensaje}: ")
    |> String.trim()
    |> String.to_integer()
  end

  def ingresar(mensaje, :real) do
    IO.gets("#{mensaje}: ")
    |> String.trim()
    |> String.to_float()
  end

  def ingresar(mensaje, :boolean) do
    valor =
      ingresar(mensaje, :texto)
      |> String.downcase()

    Enum.member?(["s", "si", "sí", "y", "yes"], valor)
  end

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end
end
