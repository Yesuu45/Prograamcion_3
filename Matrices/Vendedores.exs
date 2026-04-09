defmodule Vendedore do
  def main do
    matriz = [
      [{"Juan", 100}, {"Pedro", 150}, {"Maria", 200}],
      [{"Juan", 120}, {"Pedro", 180}, {"Maria", 220}],
      [{"Juan", 110}, {"Pedro", 170}, {"Maria", 190}],
      [{"Juan", 130}, {"Pedro", 160}, {"Maria", 210}]
    ]

    vendedor_a_contar = "Juan"

    cantidad_ventas = contar_ventas(matriz, vendedor_a_contar)
    cantidad_semanas = contar_semanas(matriz)

    IO.puts("=== REPORTE DE VENTAS ===")
    IO.puts("Vendedor: #{vendedor_a_contar}")
    IO.puts("Ventas realizadas: #{cantidad_ventas}")
    IO.puts("Total de semanas procesadas: #{cantidad_semanas}")
  end

  def contar_semanas(matriz) do
    contar_semanas(matriz, 0)
  end

  defp contar_semanas([], contador), do: contador

  defp contar_semanas([_fila | resto], contador) do
    contar_semanas(resto, contador + 1)
  end

  def contar_ventas(matriz, vendedor) do
    contar_ventas(matriz, vendedor, 0)
  end

  # Usamos defp para las funciones privadas de recursión
  defp contar_ventas([], _vendedor, contador), do: contador

  defp contar_ventas([fila | resto], vendedor, contador) do
    contador_fila = Enum.count(fila, fn {nombre, _monto} -> nombre == vendedor end)
    contar_ventas(resto, vendedor, contador + contador_fila)
  end
end

# Ejecución
Vendedore.main()
