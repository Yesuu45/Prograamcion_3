defmodule Util do
  def ingresar_texto(mensaje) do
    IO.gets(mensaje)
    |> String.trim()
  end

  def ingresar_numero(mensaje) do
    IO.gets(mensaje)
    |> String.trim()
    |> Integer.parse()
    |> case do
      {num, _} -> num
      :error -> nil
    end
  end

  def imprimir_matriz(matriz) do
    Enum.each(matriz, fn fila ->
      IO.puts(Enum.join(fila, " "))
    end)
  end




end
