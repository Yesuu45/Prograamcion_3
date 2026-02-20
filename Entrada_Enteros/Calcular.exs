defmodule EntradaEnteros do

  def main do
    valoir_total=
      "Ingrese el valor del producto: "
      |> Util.ingresar(:entero)

    valor_entregzdo =
      "Ingrese el valor entregado: "
      |> Util.ingresar(:entero)


    calcular_cambio(valoir_total, valor_entregzdo)
    |>generar_mensaje()
    |>Util.mostrar_mensaje()
  end


  def calcular_cambio(valoir_total, valor_entregzdo) do
    valor_entregzdo - valoir_total
  end

  def generar_mensaje(cambio) do
    "El cambio a entregar es: $#{cambio}"
  end


end

EntradaEnteros.main()
