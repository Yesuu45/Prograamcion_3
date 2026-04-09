defmodule Medio do
  def main do
    matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
    valor_a_contar = 2
    contador = contar_elementos(matriz, valor_a_contar)
    IO.puts("El número #{valor_a_contar} aparece #{contador} veces en la matriz.")
    IO.puts("Elementos de la Diagonal Principal:")
    diagonal_principal(matriz)
    IO.puts("Elementos de la Diagonal Secundaria:")
    diagonal_secundaria(matriz)
  end

  def contar_elementos(matriz, valor) do
    contar_elementos(matriz, valor, 0)
  end

  defp contar_elementos([], _, contador), do: contador

  defp contar_elementos([fila | resto], valor, contador) do
    contador_fila = Enum.count(fila, &(&1 == valor))
    contar_elementos(resto, valor, contador + contador_fila)
  end


  def diagonal_principal(matriz) do
    diagonal_principal(matriz, 0)
  end

  defp diagonal_principal([], _i), do: :ok

  defp diagonal_principal([fila | resto], i) do
    elemento = Enum.at(fila, i)
    IO.puts(elemento)
    diagonal_principal(resto, i + 1)
  end


  def diagonal_secundaria(matriz) do
    n = length(matriz)
    diagonal_secundaria(matriz, n, 0)
  end

  defp diagonal_secundaria([], _n, _i), do: :ok
  defp diagonal_secundaria([fila | resto], n, i) do
    elemento = Enum.at(fila, n - 1 - i)
    IO.puts(elemento)
    diagonal_secundaria(resto, n, i + 1)
  end
end
Medio.main()
