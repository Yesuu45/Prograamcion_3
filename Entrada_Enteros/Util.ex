defmodule Util do
  def ingresar(mensaje, :texto) do
    mensaje
    |>IO.gets()
    |>String.trim()

  end

  def ingresar(mensaje, :entero) do
    mensaje
    |> ingresar(:texto)
    |> String.to_integer()
    rescue
      ArgumentError ->
        "Entrada no válida. Por favor, ingrese un número entero."
        |> mostrar_error()

        mensaje
        |> ingresar(:entero)
  end


  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  def mostrar_error(mensaje) do
    IO.puts("Error: #{mensaje}")
  end


end
