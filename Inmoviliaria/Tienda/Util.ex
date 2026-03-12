# =============================================================================
# PROYECTO: Sistema de Gestion Inmobiliaria UQ
# COMPONENTE: Modulo de Utilidades (Util)
# AUTOR: Yesuu Esteban Aros Tique
# LICENCIA: GNU General Public License v3.0 (GPL-3.0)
# FECHA: 2026
# =============================================================================

defmodule Util do
  @moduledoc """
  Modulo de funciones utilitarias para manejo de entrada/salida,
  persistencia de datos y manipulacion de listas de mapas.
  """

  @doc """
  Muestra un mensaje en consola y captura la entrada del usuario como texto.
  Limpia los saltos de linea al final del String.
  """
  def ingresar_texto(label), do: IO.gets("#{label}: ") |> String.trim()

  @doc """
  Captura una entrada de texto y la convierte a un numero entero.
  """
  def ingresar_entero(label) do
    ingresar_texto(label) |> String.to_integer()
  end

  @doc """
  Guarda cualquier estructura de datos (listas/mapas) en un archivo fisico
  usando el formato de inspeccion de Elixir.
  """
  def guardar_en_archivo(lista, nombre_archivo) do
    contenido = inspect(lista, limit: :infinity)
    File.write(nombre_archivo, contenido)
    IO.puts("archivo guardado en #{nombre_archivo}")
  end

  @doc """
  Lee un archivo y reconstruye la estructura de datos original.
  Si el archivo no existe o falla, retorna una lista vacia.
  """
  def cargar_desde_archivo(nombre_archivo) do
    case File.read(nombre_archivo) do
      {:ok, contenido} ->
        {lista, _} = Code.eval_string(contenido)
        lista
      {:error, _} -> []
    end
  end

  @doc """
  Verifica si un ID ya existe dentro de una lista de mapas.
  Retorna true si es unico, false si ya existe.
  """
  def validar_id_unico(id, lista) do
    existe = Enum.any?(lista, fn elemento -> elemento.id == id end)

    if existe do
      IO.puts("Error: El ID '#{id}' ya se encuentra registrado.")
      false
    else
      true
    end
  end

  @doc """
  Elimina un mapa de la lista basandose en su ID.
  Retorna la lista actualizada.
  """
  def eliminar_elemento_id(id, lista) do
    nueva_lista = Enum.reject(lista, fn elemento -> elemento.id == id end)

    if length(nueva_lista) == length(lista) do
      IO.puts("no se encontro ningun elemento con la id #{id}")
    else
      IO.puts("eliminado #{id}")
    end
    nueva_lista
  end

  @doc """
  Actualiza un campo especifico de un mapa dentro de una lista.
  Utiliza manejo de excepciones (try/rescue) para evitar errores si el
  campo ingresado no existe como Atomo en la memoria.
  """
  def actualizar(lista, id_buscado, campo_string, nuevo_valor) do
    try do
      # Conversion segura a atomo existente
      llave_atomo = String.to_existing_atom(campo_string)

      nueva_lista = Enum.map(lista, fn elemento ->
        if elemento.id == id_buscado do
          if Map.has_key?(elemento, llave_atomo) do
            Map.put(elemento, llave_atomo, nuevo_valor)
          else
            IO.puts("[!] El campo '#{campo_string}' no existe en este registro.")
            elemento
          end
        else
          elemento
        end
      end)

      nueva_lista
    rescue
      ArgumentError ->
        IO.puts("[!] Error: El campo '#{campo_string}' no es valido.")
        lista
    end
  end
end
