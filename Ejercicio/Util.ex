defmodule Util do

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
    IO.puts(mensaje)
  end

end
