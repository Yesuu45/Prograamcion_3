defmodule Util do

  # Ingresar entero
  def ingresar(mensaje, :entero),
    do: ingresar(mensaje, &String.to_integer/1, :entero)

  # Ingresar real
  def ingresar(mensaje, :real),
    do: ingresar(mensaje, &String.to_float/1, :real)

  # Ingresar texto
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  def mostrar_error(mensaje) do
    IO.puts(mensaje)
  end

  # Función privada genérica
  defp ingresar(mensaje, funcion, tipo) do
    try do
      mensaje
      |> ingresar(:texto)
      |> funcion.()

    rescue
      ArgumentError ->
        mostrar_error("Error, se espera que ingrese un número #{tipo}\n")
        ingresar(mensaje, tipo)
    end
  end



  

end
