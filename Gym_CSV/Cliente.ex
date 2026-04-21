defmodule Cliente do
  defstruct nombre: "", edad: 0, altura: 0.0

  def crear(nombre, edad, altura) do
    %Cliente{nombre: nombre, edad: edad, altura: altura}
  end

  def ingresar(mensaje) do
    Util.mostrar_mensaje(mensaje)

    nombre = Util.ingresar("ingrese nombre", :texto)
    edad   = Util.ingresar("ingrese edad", :numero)
    altura = Util.ingresar("ingrese altura", :real)

    crear(nombre, edad, altura)
  end

  # --- RECURSIVIDAD PARA LISTAS ---

  def ingresar(mensaje, :clientes) do
    ingresar(mensaje, [], :clientes)
  end

  defp ingresar(mensaje, lista, :clientes) do
    cliente_nuevo = ingresar(mensaje)
    nueva_lista = lista ++ [cliente_nuevo]

    mas_clientes = Util.ingresar("¿Desea ingresar otro cliente? (s/n)", :boolean)

    case mas_clientes do
      true  -> ingresar(mensaje, nueva_lista, :clientes)
      false -> nueva_lista
    end
  end

  # --- PERSISTENCIA Y FORMATO (CSV) ---

  def escribir_csv(clientes, nombre_archivo) do
    clientes
    |> generar_mensaje_clientes(&convertir_cliente_linea_csv/1)
    |> (fn datos -> "nombre, edad, altura\n" <> datos end).() # Agregamos el header al contenido
    |> (&File.write(nombre_archivo, &1)).()                   # Escribimos el contenido en el archivo
  end

  def generar_mensaje_clientes(lista_clientes, parser) do
    lista_clientes
    |> Enum.map(parser)
    |> Enum.join("\n")
  end

  defp convertir_cliente_linea_csv(cliente) do
    "#{cliente.nombre},#{cliente.edad},#{cliente.altura}"
  end
end
