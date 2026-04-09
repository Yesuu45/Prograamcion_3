defmodule Diagonal do
  def main do
    matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]

    ]

    IO.puts("Recorriendo Diagonal Principal:")
    recorrer_matriz_diagonal(matriz, 0)

    n = length(matriz)
    suma_ds = sumar_diagonal_secundaria(matriz, n, 0)
    IO.puts("\nSuma de la Diagonal Secundaria: #{suma_ds}")
  end

  def recorrer_matriz_diagonal([], _i), do: :ok

  def recorrer_matriz_diagonal([fila | resto], i) do
    elemento = Enum.at(fila, i)
    IO.puts(elemento)
    recorrer_matriz_diagonal(resto, i + 1)
  end


  def sumar_diagonal_secundaria([], _n, _i), do: 0

  def sumar_diagonal_secundaria([fila | resto], n, i) do
    elemento = Enum.at(fila, n - 1 - i)
    elemento + sumar_diagonal_secundaria(resto, n, i + 1)
  end
end

Diagonal.main()
