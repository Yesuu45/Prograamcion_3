defmodule Util do
  def ingresar(mensaje) do
      mensaje
      |> IO.gets()
      |> String.trim()
  end

  def ingresar_entero(mensaje) do
      entrada =
        IO.gets(mensaje)
        |> String.trim()

      case Integer.parse(entrada) do
        {numero, ""} -> numero
        _ ->
          IO.puts("Error: Ingrese un número entero válido.")
          ingresar_entero(mensaje)
      end
  end

  def mostrar_persona(persona) do
      IO.puts("Nombre: #{persona.nombre}, Edad: #{persona.edad}")
  end


end
