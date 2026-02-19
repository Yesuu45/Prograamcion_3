defmodule EntradaDatos do
  @moduledoc """
  Dado un mensaje, imprimirlo en mayúsculas.
  """

  @doc """
  Dado un mensaje, imprimirlo en mayúsculas.
  ## Ejemplo

      iex> EntradaDatos.main("hola mundo")
      "HOLA MUNDO"

  """
  def main do
  "Ingrese nombre del empleado: "
    |> Util.ingresar(:texto)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  defp generar_mensaje(nombre) do
    "Bienvenido #{nombre} a la empresa Once Ltda"
  end
end

EntradaDatos.main()
