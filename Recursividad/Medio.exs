defmodule Medio do
  def main do
    lista = [1, 2, 3, 4, 2, 5, 2]
    contador = contar_elementos(lista, 2)
    valor_a_contar = 2
    IO.puts("El número #{valor_a_contar} aparece #{contador} veces.")
  end

  def contar_elementos([], _valor), do: 0
  def contar_elementos([valor | resto], valor) do
    1 + contar_elementos(resto, valor)
  end
end
Medio.main()
