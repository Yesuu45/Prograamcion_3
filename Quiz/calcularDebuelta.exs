defmodule CalcularDevuelta do
 def main do

  valor_total = " ingrese el valor total de la factura"
  |> Util.ingresar(:entero)
  valor_entregado = "Ingrese el valor entregado por el cliente"
  |> Util.ingresar(:entero)

  calcular_devuelta(valor_total, valor_entregado)
  |> Util.generar_mensaje()
  |> Util.mostrar_mensaje()
 end





  def calcular_devuelta(valor_total, valor_entregado)  do
   valor_total - valor_entregado
    |>
  end
end
