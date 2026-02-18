defmodule Util do
  def mostrar_mensaje(mensaje) do
    mensaje
  |> IO.puts()
  end

  def generar_mensaje(devuelta) do
    "El valor de la devuelta es: #{devuelta}"
  end

  def calcular_devuelta(valor_total, valor_entregado)  do
   valor_total - valor_entregado
  end

end
