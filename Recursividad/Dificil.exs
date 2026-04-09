defmodule Dificil do
  def main do
    
    lista =[1, 2, 3, 4, 2, 5, 2]
    maximo = obtener_maximo(lista)
    IO.puts("El número máximo en la lista #{inspect(lista)} es: #{maximo}")
  end

  # Punto de entrada: inicializamos el máximo con el primer elemento
  def obtener_maximo([primero | resto]) do
    do_maximo(resto, primero)
  end

  # CASO BASE: Cuando la lista se vacía, el acumulador 'max_actual' es el ganador
  defp do_maximo([], max_actual), do: max_actual

  # CASO RECURSIVO 1: El nuevo valor es mayor que nuestro máximo actual
  defp do_maximo([cabeza | resto], max_actual) when cabeza > max_actual do
    do_maximo(resto, cabeza)
  end

  # CASO RECURSIVO 2: El nuevo valor es menor o igual (lo ignoramos)
  defp do_maximo([_cabeza | resto], max_actual) do
    do_maximo(resto, max_actual)
  end
end

Dificil.main()
