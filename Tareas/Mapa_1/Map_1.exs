defmodule Ejercicio do
  def main do
    "Ingrese una lista de números separados por comas: "
    |> Util.ingresar_texto()
    |> Util.convertir_a_lista()
    |> Util.mostrar_mensaje()
  end
end

Ejercicio.main()
