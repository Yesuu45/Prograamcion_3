defmodule Util do
  @moduledoc """
  Funciones utilitarias para entrada/salida de texto.

  - `ingresar_texto/1`: muestra un mensaje y lee una línea desde stdin.
  - `convertir_a_lista/1`: separa un texto por comas y limpia espacios.
  - `mostrar_mensaje/1`: imprime (y devuelve) un valor para depuración.
  """

  @doc """
  Muestra `mensaje` por pantalla y devuelve la línea ingresada sin espacios
  alrededor.

  Ejemplo:

      iex> Util.ingresar_texto("Ingrese números: ")
  """
  def ingresar_texto(mensaje) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  @doc """
  Convierte un `texto` con elementos separados por comas en una lista de
  cadenas limpias (sin espacios alrededor).

  Devuelve una lista de strings.
  """
  def convertir_a_lista(texto) do
    texto
    |> String.split(",")
    |> Enum.map(&String.trim/1)
  end

  @doc """
  Imprime `mensaje` usando `IO.inspect/1` y retorna el mismo valor.
  """
  def mostrar_mensaje(mensaje) do
    IO.inspect(mensaje)
  end
end
