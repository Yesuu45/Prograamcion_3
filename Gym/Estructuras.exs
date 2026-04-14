defmodule Estructuras do
  def main do
    "Ingrese los datos del cliente: "
    |> Clientes.ingresar(:clientes)
    |> generar_mensaje_clientes(&generar_mensaje/1)
    |> Util.mostrar_mensaje()
  end

  def generar_mensaje(cliente) do
    altura = cliente.altura |> Float.round(2)
    "Hola #{cliente.nombre}, tienes #{cliente.edad} años y mides #{altura} metros."
  end

  # Agregamos 'parser' para que reciba el &generar_mensaje/1 que envías en el pipe
  def generar_mensaje_clientes(clientes, parser) do
    clientes
    |> Enum.map(parser) # Usamos el parser que pasaste por parámetro
    |> Enum.join("\n")
  end
end

Estructuras.main()
