defmodule Util do
  # Función para ingresar texto usando Java
  def ingresar(mensaje, :texto) do
    case System.cmd("java", ["-cp", ".", "Mensaje", "input", mensaje]) do
      {output, 0} ->
        IO.puts("Texto ingresado correctamente en Java.")
        IO.puts("Entrada Java: #{output}")
        String.trim(output)

      {error, code} ->
        IO.puts("Error al ejecutar el programa Java. Código: #{code}")
        IO.puts("Mensaje de error: #{error}")
        nil
    end
  end

  # Función para mostrar mensaje usando Java
  def mostrar_mensaje(mensaje) do
    System.cmd("java", ["-cp", ".", "Mensaje", mensaje])
  end
end
