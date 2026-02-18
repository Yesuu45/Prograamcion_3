defmodule Util do
  # Llama a Java para pedir input o mostrar mensaje
  def ingresar(mensaje,:texto) do
  # Llama al programa Java para ingresar texto y capturar la entrada
    case System.cmd("java", ["-cp", ".", "Mensaje","input", mensaje]) do
      {output, 0} ->
        IO.puts("Texto ingresado correctamente.")
        IO.puts("Entrada: #{output}")
        String.trim(output) # Retorna la entrada sin espacios extra
      {error, code} ->
        IO.puts("Error al ingresar el texto. Código: #{code}")
        IO.puts("Detalles: #{error}")
        nil
    end
  end

  def mostrar_mensaje(mensaje) do
    System.cmd("java", ["Mensaje", mensaje])
  end
end
