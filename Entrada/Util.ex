defmodule Util do
  def ingresar_texto(mensaje, :texto) do
    mensaje
    |>IO.gets()
    |>String.trim()

  end

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end
end
