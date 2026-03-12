defmodule Util do
  def ingresar_texto(label), do: IO.gets("#{label}: ") |> String.trim()

  def ingresar_entero(label) do
    ingresar_texto(label) |> String.to_integer()
  end

  def guardar_en_archivo(lista, nombre_archivo) do
    contenido = inspect(lista, limit: :infinity)
    File.write(nombre_archivo, contenido)
    IO.puts("archivo guardado en #{nombre_archivo}")
  end

  def cargar_desde_archivo (nombre_archivo)do
    case File.read(nombre_archivo) do
      {:ok, contenido} ->
        {lista, _} = Code.eval_string(contenido)
        lista
      {:error, _} -> []
    end
  end


  def validar_id_unico(id, lista) do
    # Enum.any? devuelve true si encuentra al menos un elemento que coincida
    existe = Enum.any?(lista, fn elemento -> elemento.id == id end)

    if existe do
      IO.puts("❌ Error: El ID '#{id}' ya se encuentra registrado.")
      false
    else
      true
    end

  end


  def eliminar_elemento_id(id, lista) do
    nueva_lista = Enum.reject(lista , fn elemento -> elemento.id == id end)

    if length(nueva_lista) == length(lista)do
      IO.puts("no se encontro ningun elemeto con la id #{id}")
    else
      IO.puts("eliminado #{id}")
    end
    nueva_lista
  end

end
