defmodule Util do
  def ingresar_texto(mensaje) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end


  def ingresar_entero(mensaje) do
    entrada = ingresar_texto(mensaje)
    case Integer.parse(entrada) do
      {numero, ""} -> numero
      _ ->
        IO.puts("Error: Ingrese un número entero válido.")
        ingresar_entero(mensaje)
    end
  end

  def crear_lista(elemento), do: [elemento]

  def mostrar_mensaje(lista) do
    if lista == [] do
      IO.puts("La lista está vacía.")
    else
      IO.puts("\n--- Listado de Personas ---")
      Enum.each(lista, fn elemento ->
        if is_map(elemento) do
          IO.puts("- ID: #{elemento.id} | Nombre: #{elemento.nombre} | #{elemento.edad} años")
        else
          IO.puts("- #{elemento}")
        end
      end)
    end
  end

  def eliminar_elemento(lista, elemento), do: Enum.filter(lista, &(&1 != elemento))
  def agregar_elemento(lista, elemento), do: lista ++ [elemento]
  def actualizar_elemento(lista, indice, nuevo_elemento), do: List.replace_at(lista, indice, nuevo_elemento)

  def validar_elemento(lista, elemento) do
    if elemento in lista do
      # Usamos inspect para evitar el error de protocolo con el Mapa
      {:ok, "La persona #{elemento.nombre} (ID: #{elemento.id}) está en la lista."}
    else
      {:error, "El elemento no se encuentra en la lista."}
    end
  end
end
