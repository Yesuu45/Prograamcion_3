defmodule EntradaReales do

  def main do
    valor_producto =
      "Ingrese el valor del producto: "
      |> Util.ingresar(:entero)

    porcentaje_descuento =
      "Ingrese el porcentaje de descuento: "
      |> Util.ingresar(:real)

    valor_descuento =
      valor_producto * (porcentaje_descuento / 100)

    valor_final =
      valor_producto - valor_descuento

    mensaje =
      "Valor de descuento: $#{Float.round(valor_descuento, 1)} " <>
      "y el valor final: $#{Float.round(valor_final, 1)}"

    Util.mostrar_mensaje(mensaje)
  end

end

EntradaReales.main()
