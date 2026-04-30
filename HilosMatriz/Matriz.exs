defmodule Matriz do
  def main do
    matriz = [
      [60, 22, 41,5],
      [13,33, 44,5],
      [89, 10, 100, 99],
      [5, 101, 6, 34]

    ]

    # 1. Construir/Crear los 2 procesos independientes
    t1 = Task.async(fn -> s1(matriz) end)
    t2 = Task.async(fn -> s2(matriz) end)

    # 2. Esperar a que los procesos terminen y obtener sus valores
    resultado_s1 = Task.await(t1)
    {suma_total, _promedio} = Task.await(t2)

    # 3. Usar los resultados en las funciones s3 y s4
    valor_c = s3(resultado_s1, suma_total)
    s4(valor_c)
  end

  def s1(matriz) do
    n = length(matriz)
    suma =
      for i <- 0..(n - 1),
          j <- 0..(n - 1),
          j < i,
          reduce: 0 do
        acc -> acc + (matriz |> Enum.at(i) |> Enum.at(j))
      end

    IO.puts("[t1] S1 - Suma bajo diagonal: #{suma}")
    suma
  end

  def s2(matriz) do
    todos = List.flatten(matriz)
    suma = Enum.sum(todos)
    promedio = suma / length(todos)
    IO.puts("[t2] S2 - Suma total: #{suma}, Promedio: #{promedio}")
    {suma, promedio}
  end

  def s3(a, b) do
    a + b
  end

  def s4(c) do
    IO.puts("El resultado de c (S1 + Suma Total S2) es: #{c}")
  end
end

# Ejecutar el programa
Matriz.main()
