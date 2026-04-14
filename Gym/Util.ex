defmodule Util do
  # Agregamos la cláusula para :texto
  def ingresar(mensaje, :texto) do
    IO.gets("#{mensaje}: ")
    |> String.trim()
  end

  # Agregamos la cláusula para :numero
  def ingresar(mensaje, :numero) do
    IO.gets("#{mensaje}: ")
    |> String.trim()
    |> String.to_integer()
  end

  # Agregamos la cláusula para :real
  def ingresar(mensaje, :real) do
    IO.gets("#{mensaje}: ")
    |> String.trim()
    |> String.to_float()
  end

  # Tu función de boolean ya estaba como 'ingresar', solo la ajustamos
  def ingresar(mensaje, :boolean) do
    valor =
      mensaje
      |> ingresar(:texto) # Llamamos a la cláusula de texto de arriba
      |> String.downcase()

    Enum.member?(["s", "si", "sí", "y", "yes"], valor)
  end

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end
end
