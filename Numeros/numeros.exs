defmodule Numeros do
  def main do
    lista =[1, 2,3 ,4 ,5]

    IO.puts("\n---- Recorriendo lista con RECURSIVIDAD -----")
    recursividad_lista(lista)

    total = sumar_lista(lista)
    IO.puts("\nLa suma total es: #{total}")
  end

  def recursividad_lista([]), do: IO.puts("Fin de la lista.")
  def recursividad_lista([ x | lista]) do
    IO.puts("Procesando elemento: #{x}")
    recursividad_lista(lista)
  end

  def sumar_lista([]) do
    IO.puts("--- Suma Finalizada ---")
    0
  end

  def sumar_lista([x| lista]) do
    x + sumar_lista(lista)
  end
end

Numeros.main()
