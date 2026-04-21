defmodule Cliente do
  defstruct nombre: "", edad: 0, altura: 0.0

  # --- CREACIÓN ---
  def crear(nombre, edad, altura) do
    %Cliente{nombre: nombre, edad: edad, altura: altura}
  end

  # --- ENTRADA DE DATOS (CONSOLA) ---
  def ingresar(mensaje) do
    Util.mostrar_mensaje(mensaje)

    nombre = Util.ingresar("ingrese nombre", :texto)
    edad   = Util.ingresar("ingrese edad", :numero)
    altura = Util.ingresar("ingrese altura", :real)

    crear(nombre, edad, altura)
  end

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

  # --- PERSISTENCIA (ESCRITURA CSV) ---
  def escribir_csv(clientes, nombre_archivo) do
    contenido = generar_mensaje_clientes(clientes, &convertir_cliente_linea_csv/1)
    header = "nombre, edad, altura\n"
    File.write(nombre_archivo, header <> contenido)
  end

  def generar_mensaje_clientes(lista_clientes, parser) do
    lista_clientes
    |> Enum.map(parser)
    |> Enum.join("\n")
  end

  defp convertir_cliente_linea_csv(cliente) do
    "#{cliente.nombre},#{cliente.edad},#{cliente.altura}"
  end

  # --- PERSISTENCIA (LECTURA CSV) ---
  def leer_csv(nombre_archivo) do
    nombre_archivo
    |> File.read!()
    |> String.split("\n", trim: true) # Separamos el archivo por líneas
    |> Enum.drop(1)                   # Saltamos el encabezado (header)
    |> Enum.map(&convertir_cadena_cliente/1)
  end

  defp convertir_cadena_cliente(cadena) do
    [nombre, edad_str, altura_str] =
      cadena
      |> String.split(",")
      |> Enum.map(&String.trim/1)

    edad = String.to_integer(edad_str)
    altura = String.to_float(altura_str)

    crear(nombre, edad, altura)
  end
end
