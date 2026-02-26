defmodule CreacionPersonas do
  def main do
    bucle(0, 0)
  end

  defp bucle(exitos, fallos) do
    if fallos >= 3 do
      IO.puts("\nHAS ALCANZADO EL MÁXIMO DE 3 INTENTOS FALLIDOS.")
      IO.puts("El programa se cerrará por seguridad.")
      resumen_final(exitos, fallos)
    else
      IO.puts("\n--- Registro (Éxitos: #{exitos} | Fallos: #{fallos}/3) ---")

      nombre = Util.ingresar("Ingrese el nombre: ")
      edad = Util.ingresar_entero("Ingrese la edad: ")

      # Determinamos los nuevos contadores según el resultado
      {nuevos_exitos, nuevos_fallos} = case validar_credenciales(nombre, edad) do
        {:ok, mensaje} ->
          IO.puts("\n✅ #{mensaje}")
          persona = %{nombre: nombre, edad: edad}
          Util.mostrar_persona(persona)
          {exitos + 1, fallos}

        {:error, mensaje_error} ->
          IO.puts("\n❌ Error: #{mensaje_error}")
          {exitos, fallos + 1}
      end

      if nuevos_fallos < 3 do
        continuar = Util.ingresar("\n¿Desea ingresar otra persona? (s/n): ") |> String.downcase()
        if continuar == "s", do: bucle(nuevos_exitos, nuevos_fallos), else: resumen_final(nuevos_exitos, nuevos_fallos)
      else
        bucle(nuevos_exitos, nuevos_fallos) # Esta llamada disparará el bloqueo al inicio
      end
    end
  end

  defp validar_credenciales(nombre, edad) do
    cond do
      String.length(nombre) <= 3 ->
        {:error, "Nombre demasiado corto o vacío"}

      edad < 18 ->
        {:error, "Debes ser mayor de 18 años"}

      true ->
        {:ok, "Acceso concedido"}
    end
  end

  defp resumen_final(exitos, fallos) do
    IO.puts("\n=======================")
    IO.puts("     RESUMEN FINAL     ")
    IO.puts("=======================")
    IO.puts("Personas creadas: #{exitos}")
    IO.puts("Intentos fallidos: #{fallos}")
    IO.puts("¡Adiós!")
  end
end

CreacionPersonas.main()
