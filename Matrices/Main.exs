defmodule Main do
  def menu do
    matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    fila = 0
    columna = 2

    IO.puts("=== ACCESO A MATRIZ ===")

    # Opción A: Uso correcto del Pipe Operator
    # Cada |> pasa el resultado anterior como PRIMER argumento
    valor_a =
      matriz
      |> Enum.at(fila)      # Paso 1: Obtiene
      |> Enum.at(columna)   # Paso 2: Obtiene 3 de esa sublista

    # Opción B: Uso correcto de get_in
    # Para listas, get_in acepta una lista de índices directamente
    valor_b = get_in(matriz, [Access.at(fila), Access.at(columna)])

    IO.puts("Resultado Opción A (Pipe + Enum.at): #{valor_a}")
    IO.puts("Resultado Opción B (get_in + Access): #{valor_b}")
  end
end

Main.menu()
