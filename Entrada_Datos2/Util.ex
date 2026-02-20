defmodule Util do
  # Pide input usando Java
  def ingresar(mensaje, :texto) do
    case System.cmd("java", ["-cp", ".", "Mensaje", "input", mensaje]) do
      {output, 0} ->
        IO.puts("Texto ingresado correctamente en Java.")
        String.trim(output)

      {error, code} ->
        IO.puts("Error al ejecutar el programa Java. Código de salida: #{code}")
        IO.puts("Mensaje de error: #{error}")
        nil
    end
  end

  # Muestra mensaje usando Java
  def mostrar_mensaje(mensaje) do
    # Aquí no es input, solo mostramos el mensaje
    System.cmd("java", ["-cp", ".", "Mensaje", mensaje])
  end
end
