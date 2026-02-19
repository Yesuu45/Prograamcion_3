defmodule Util do
  def mostrar_mensaje(mensaje) do
    mensaje
    |> IO.puts()
  end

  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def calcular_valor_descuento(valor_producto, porcentaje_descuento) do
    valor_producto * (porcentaje_descuento / 100)
  end

  def calcular_valor_final(valor_producto, valor_descuento) do
    valor_producto - valor_descuento
  end

  def  ingresar(mensaje, :entero),do: ingresar(mensaje, &String.to_integer/1, :entero)
  def ingresar(mensaje, :real),do: ingresar(mensaje, &String.to_float/1, :real)


  defp ingresar(mensaje , parser , tipo_dato) do
    mensaje
    |> ingresar(:texto)
    |> parser.()
    rescue
      ArgumentError ->
        "Error: Ingrese un valor #{tipo_dato} \n"
        |>mostrar_error()

        mensaje
        ingresar(mensaje, parser, tipo_dato)

  end

  defp mostrar_error(mensaje) do
    mensaje
    |> IO.puts()
  end
  
end
