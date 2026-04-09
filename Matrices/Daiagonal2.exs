defmodule Diagonal2 do
  def main do
    matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    IO.puts("Recorriendo Diagonal Principal:")
    recorrer_diagonal_principal(matriz)
    suma_total = sumar_matriz(matriz)
    IO.puts("Suma Total de la Matriz: #{suma_total}")
    suma_diagonal_secundaria = sumar_diagonal_secundaria(matriz)
    IO.puts("Suma de la Diagonal Secundaria: #{suma_diagonal_secundaria}")
  end

  def recorrer_diagonal_principal(matriz) do
    matriz
    |> Enum.with_index()
    |> Enum.each(fn {fila, i} ->
      elemento = Enum.at(fila, i)
      IO.puts(elemento)
    end)
  end

  def sumar_matriz(matriz) do
    matriz
    |> Enum.map(&Enum.sum/1)
    |> Enum.sum()
  end


  def sumar_diagonal_secundaria(matriz) do
    n = length(matriz)
    matriz
    |> Enum.with_index()
    |> Enum.map(fn {fila, i} ->
      Enum.at(fila, n - 1 - i)
    end)
    |> Enum.sum()
  end
  
  
  def imprimir_diagonal_secundaria(matriz)do
    n =  length(matriz)
    |>Enum.with_index()
    |>Enum.each(fn {fila, i}->
      elemento = Enum.at(fila, n - 1 - i)
      IO.puts(elemento)
    end)
  end

end

Diagonal2.main()
