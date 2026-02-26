defmodule Creacion_listas do

  def main do
    menu([]) # Llamamos al menú iniciando con lista vacía
  end

  # La función menu debe estar FUERA de main
  defp menu(lista) do
    IO.puts("\n--- Menú Principal ---")
    IO.puts("1. Agregar elemento")
    IO.puts("2. Mostrar lista")
    IO.puts("3. Validar por ID")
    IO.puts("4. Eliminar por ID")
    IO.puts("5. Actualizar por índice")
    IO.puts("6. Salir")

    # Usamos ingresar_texto para que coincida con los "1", "2" del case
    opcion = Util.ingresar_texto("Seleccione una opción: ")

    case opcion do
      "1" ->
        nombre = Util.ingresar_texto("Ingrese el nombre: ")
        edad = Util.ingresar_entero("Ingrese la edad: ")
        id = Util.ingresar_texto("Ingrese el ID: ") # Corregido typo 'inngresar'
        persona = %{id: id, nombre: nombre, edad: edad}
        nueva_lista = Util.agregar_elemento(lista, persona)
        IO.puts("Elemento agregado exitosamente.")
        menu(nueva_lista)

      "2" ->
        Util.mostrar_mensaje(lista)
        menu(lista)

      "3" ->
        id_buscar = Util.ingresar_texto("Ingrese el ID de la persona a validar: ")
        encontrado = Enum.find(lista, fn elemento -> is_map(elemento) and elemento.id == id_buscar end)

        case Util.validar_elemento(lista, encontrado) do
          {:ok, mensaje} -> IO.puts("✅ #{mensaje}")
          {:error, mensaje} -> IO.puts("❌ #{mensaje}")
        end
        menu(lista)

      "4" ->
        id_eliminar = Util.ingresar_texto("ID de la persona a eliminar: ")
        persona_a_borrar = Enum.find(lista, fn persona -> persona.id == id_eliminar end)
        nueva_lista = Util.eliminar_elemento(lista, persona_a_borrar)
        IO.puts("🗑️ Elemento procesado.")
        menu(nueva_lista)

      "5" ->
        Util.mostrar_mensaje(lista)
        indice = Util.ingresar_entero("Ingrese el índice del elemento a actualizar: ")
        persona_actual = Enum.at(lista, indice)

        if persona_actual do
          nombre_nuevo = Util.ingresar_texto("Nuevo nombre (actual: #{persona_actual.nombre}): ")
          edad_nueva = Util.ingresar_entero("Nueva edad (actual: #{persona_actual.edad}): ")
          persona_actualizada = %{nombre: nombre_nuevo, edad: edad_nueva, id: persona_actual.id}

          nueva_lista = Util.actualizar_elemento(lista, indice, persona_actualizada)
          IO.puts("Elemento actualizado exitosamente.")
          menu(nueva_lista)
        else
          IO.puts("Error: Índice fuera de rango.")
          menu(lista)
        end

      "6" ->
        IO.puts("¡Hasta luego!")
        Util.mostrar_mensaje(lista)
        :ok

      _ ->
        IO.puts("Opción no válida. Intente nuevamente.")
        menu(lista)
    end # Aquí cierra el case correctamente
  end # Aquí cierra menu
end # Aquí cierra el módulo

# Ejecutar
Creacion_listas.main()
