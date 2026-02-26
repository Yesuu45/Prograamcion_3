defmodule Creacion do
  def main do
  nombre = Util.ingresar_texto("Ingrese el nombre: ")
  edad = Util.ingresar_entero("Ingrese la edad: ")
  credenciales_usuario = Util.ingresar_texto("Ingrese las credenciales del usuario: ")
  end
end

Creacion.main()
