defmodule Clientes do
  defstruct nombre: "", edad: 0, altura: 0.0

  def crear(nombre, edad, altura) do
    %Clientes{nombre: nombre, edad: edad, altura: altura}
  end

  def ingresar(mensaje) do
    mensaje |> Util.mostrar_mensaje()

    nombre = "ingrese su nombre" |> Util.ingresar(:texto)
    edad = "ingrese su edad" |> Util.ingresar(:numero)
    altura = "ingrese su altura" |> Util.ingresar(:real)

    crear(nombre, edad, altura)
  end

  def ingresar(mensaje, :clientes) do
    mensaje |> ingresar([], :clientes)
  end

  defp ingresar(mensaje, lista, :clientes) do
    cliente_nuevo = mensaje |> ingresar()
    nueva_lista = lista ++ [cliente_nuevo]

    mas_clientes = "desea ingresar otro cliente? (s/n)" |> Util.ingresar(:boolean)

    case mas_clientes do
      true -> mensaje |> ingresar(nueva_lista, :clientes)
      false -> nueva_lista
    end
  end

  # Acomodamos para que use el 'parser' recibido
  def generar_mensaje_clientes(lista_clientes, parser) do
    lista_clientes
    |> Enum.map(parser)
    |> Enum.join("\n")
  end
end
