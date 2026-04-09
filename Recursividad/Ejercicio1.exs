defmodule Ejercicio do
  def main do
    lista =[1, 2, 3, 4, 2, 5, 2]
    valor_a_contar = 2

    cantidad = contar_elementos(lista, valor_a_contar)
    factorial = calcular_factorial(5)

    IO.puts("La lista es: #{inspect(lista)}")
    IO.puts("El número #{valor_a_contar} aparece #{cantidad} veces.")
    IO.puts("El factorial de 5 es: #{factorial}")
  end

  # --- Contador de Elementos ---
  def contar_elementos([], _valor), do: 0

  # Caso A: El elemento coincide
  def contar_elementos([valor | resto], valor) do
    1 + contar_elementos(resto, valor)
  end

  # Caso B: El elemento NO coincide (Esta es la que faltaba)
  def contar_elementos([_otro | resto], valor) do
    contar_elementos(resto, valor)
  end

  # --- Factorial (Versión de Cola / Optimizada) ---
  def calcular_factorial(n), do: do_factorial(n, 1)

  defp do_factorial(0, acumulador), do: acumulador
  defp do_factorial(n, acumulador) when n > 0 do
    do_factorial(n - 1, acumulador * n)
  end
end

Ejercicio.main()
