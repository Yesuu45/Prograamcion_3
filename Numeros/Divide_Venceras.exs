defmodule DivideVenceras do

  def main do
    lista =[1,2,3,4,5,6]
    IO.puts "Procesando lista: #{inspect(lista)}"
    sumar(lista)
  end

  defp sumar([]), do: 0

  defp sumar([elemento]), do: elemento

  defp sumar(lista) do
    mitad = div(length(lista), 2)
    {izquierda, derecha} = Enum.split(lista, mitad)

    sumar(izquierda) + sumar(derecha)
  end

end

IO.puts "Resultado final: #{DivideVenceras.main()}"
