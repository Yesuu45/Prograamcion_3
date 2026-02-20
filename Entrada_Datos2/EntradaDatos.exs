
defmodule EntradaDatos do
  def main do
    "Ingrese el nombre del empleado:"
    |> Util.ingresar(:texto)        # Pide input usando Java
    |> generar_mensaje()            # Genera el mensaje de bienvenida
    |> Util.mostrar_mensaje()       # Muestra mensaje usando Java
  end

  # Función privada para construir mensaje de bienvenida
  defp generar_mensaje(nil), do: "No se ingresó ningún nombre."

  defp generar_mensaje(nombre), do: "Bienvenido #{nombre} a la empresa Once Ltda"
end

# Ejecutar el flujo
EntradaDatos.main()
