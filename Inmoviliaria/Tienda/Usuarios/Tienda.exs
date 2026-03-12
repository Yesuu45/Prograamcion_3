# =============================================================================
# PROYECTO: Sistema de Gestion Inmobiliaria UQ
# AUTOR: Yesuu Esteban Aros Tique
# LICENCIA: GNU General Public License v3.0 (GPL-3.0)
#           Usted es libre de copiar, modificar y distribuir este software
#           siempre que mantenga esta nota de autor y licencia.
# FECHA: 2026
# =============================================================================

# Carga del modulo de utilidades
Code.require_file("../Util.ex")

# =============================================================================
# MODULO PRINCIPAL: TIENDA
# =============================================================================
defmodule Tienda do
  @moduledoc """
  Modulo principal que controla el flujo del programa, menus y persistencia.
  """

  def main() do
    lista_u = Util.cargar_desde_archivo("usuarios.txt") || []
    lista_p = Util.cargar_desde_archivo("propiedades.txt") || []
    inicio_sesion(lista_u, lista_p)
  end

  def inicio_sesion(lista_u, lista_p) do
    IO.puts("\n--- BIENVENIDO A INMOBILIARIA UQ ---")
    IO.puts("1. Iniciar Sesion")
    IO.puts("2. Registrarse")
    IO.puts("3. Salir")

    opcion = Util.ingresar_entero("Ingrese la opcion")

    case opcion do
      1 ->
        if Autenticacion.iniciar_sesion(lista_u) do
          menu(lista_u, lista_p)
        else
          inicio_sesion(lista_u, lista_p)
        end

      2 ->
        nuevo_u = Usuario.registrar_usuario(lista_u)
        IO.puts("[OK] Registro exitoso. Ahora puede iniciar sesion.")
        inicio_sesion([nuevo_u | lista_u], lista_p)

      3 -> IO.puts("Finalizando programa. Autor: Yesuu Esteban Aros. Adios.")
      _ -> inicio_sesion(lista_u, lista_p)
    end
  end

  def menu(lista_u, lista_p) do
    IO.puts("\n--- PANEL DE GESTION ---")
    IO.puts("1. Registrar Propiedad")
    IO.puts("2. Alquilar Propiedad")
    IO.puts("3. Ver todo (Reporte)")
    IO.puts("4. Eliminar usuario")
    IO.puts("5. Eliminar propiedad")
    IO.puts("6. Guardar y Cerrar Sesion")

    opcion = Util.ingresar_entero("Ingrese la opcion")

    case opcion do
      1 ->
        propiedad = Propiedades.crear_propiedad(lista_p)
        menu(lista_u, [propiedad | (lista_p || [])])

      2 ->
        {nueva_lista_p, lista_u_nueva} = alquilar_propiedad(lista_p, lista_u)
        menu(lista_u_nueva, nueva_lista_p)

      3 ->
        mostrar_reporte(lista_u, lista_p)
        menu(lista_u, lista_p)

      4 ->
        id_a_eliminar = Util.ingresar_texto("Ingrese la ID del usuario a eliminar")
        lista_nueva_usuarios = Util.eliminar_elemento_id(id_a_eliminar, lista_u)
        menu(lista_nueva_usuarios, lista_p)

      5 ->
        id_eliminar = Util.ingresar_texto("Ingrese el ID de la propiedad a eliminar")
        lista_nueva_propiedades = Util.eliminar_elemento_id(id_eliminar, lista_p)
        menu(lista_u, lista_nueva_propiedades)

      6 ->
        Util.guardar_en_archivo(lista_u, "usuarios.txt")
        Util.guardar_en_archivo(lista_p, "propiedades.txt")
        IO.puts("[OK] Datos guardados correctamente.")
        inicio_sesion(lista_u, lista_p)

      _ -> menu(lista_u, lista_p)
    end
  end

  defp mostrar_reporte(u, p) do
    IO.puts("\n--- REPORTE DE USUARIOS ---")
    IO.inspect(u)
    IO.puts("\n--- REPORTE DE PROPIEDADES ---")
    IO.inspect(p)
  end

  defp alquilar_propiedad(lista_p, lista_u) do
    propiedades_limpias = Enum.filter(lista_p || [], fn x -> is_map(x) end)
    id_buscado = Util.ingresar_texto("Ingrese ID de la propiedad")

    case Enum.find(propiedades_limpias, fn p -> p.id == id_buscado end) do
      nil ->
        IO.puts("[!] No existe")
        {propiedades_limpias, lista_u}
      propiedad ->
        cond do
          propiedad.opcion_negocio != "alquiler" ->
            IO.puts("[!] Solo disponible para venta")
            {propiedades_limpias, lista_u}
          propiedad.estado == :alquilado ->
            IO.puts("[!] Ya se encuentra alquilada")
            {propiedades_limpias, lista_u}
          true ->
            nueva_lista = Enum.map(propiedades_limpias, fn p ->
              if p.id == id_buscado, do: %{p | estado: :alquilado}, else: p
            end)
            IO.puts("[OK] Alquilada con exito")
            {nueva_lista, lista_u}
        end
    end
  end
end

# =============================================================================
# MODULOS DE SOPORTE
# =============================================================================

defmodule Autenticacion do
  @moduledoc """
  Modulo encargado de la validacion de identidad.
  """
  def iniciar_sesion(lista_usuarios) do
    usuarios = Enum.filter(lista_usuarios || [], &is_map/1)
    IO.puts("\n--- INICIO DE SESION ---")
    id_ingresado = Util.ingresar_texto("Ingrese su numero de identificacion")
    nombre_ingresado = Util.ingresar_texto("Ingrese su nombre")

    encontrado = Enum.find(usuarios, fn u ->
      u.id == id_ingresado and u.nombre == nombre_ingresado
    end)

    if encontrado do
      IO.puts("\n[OK] Bienvenido(a)!")
      true
    else
      IO.puts("[ERROR] Usuario no encontrado.")
      false
    end
  end
end

defmodule Usuario do
  @moduledoc """
  Modulo para la gestion de datos de usuarios.
  """
  def registrar_usuario(lista_u) do
    nombre = Util.ingresar_texto("Nombre")
    id = pedir_id_valido(lista_u)
    edad = pedir_edad_valida()
    %{nombre: nombre, id: id, edad: edad}
  end

  defp pedir_id_valido(lista_u) do
    id = Util.ingresar_texto("Identificacion")
    if Util.validar_id_unico(id, lista_u) do
      id
    else
      pedir_id_valido(lista_u)
    end
  end

  defp pedir_edad_valida() do
    edad = Util.ingresar_entero("Edad")
    if edad >= 0 do
      edad
    else
      IO.puts("[!] Error: No se permiten edades negativas.")
      pedir_edad_valida()
    end
  end
end

defmodule Propiedades do
  @moduledoc """
  Modulo para la creacion de propiedades.
  """
  @tipos [CASA: "casa", APARTAMENTOS: "apartamento", LOCAL: "local", VENTA: "venta", ALQUILER: "alquiler"]

  def crear_propiedad(lista_p) do
    tipo_elegido = seleccionar_opcion()
    id = pedir_id_propiedad(lista_p)
    direccion = Util.ingresar_texto("Direccion")
    opcion_negocio = seleccionar_opcion_compra()
    precio = Util.ingresar_entero("Precio")

    %{tipo: tipo_elegido, id: id, direccion: direccion, opcion_negocio: opcion_negocio, precio: precio, estado: :disponible}
  end

  defp pedir_id_propiedad(lista_p) do
    id = Util.ingresar_texto("ID de propiedad")
    if Util.validar_id_unico(id, lista_p) do
      id
    else
      pedir_id_propiedad(lista_p)
    end
  end

  defp seleccionar_opcion do
    opcion = Util.ingresar_texto("Tipo (casa/apartamento/local)") |> String.downcase()
    case opcion do
      "casa" -> @tipos[:CASA]
      "apartamento" -> @tipos[:APARTAMENTOS]
      "local" -> @tipos[:LOCAL]
      _ -> seleccionar_opcion()
    end
  end

  defp seleccionar_opcion_compra do
    opcion = Util.ingresar_texto("Alquiler/Venta") |> String.downcase()
    case opcion do
      "alquiler" -> @tipos[:ALQUILER]
      "venta" -> @tipos[:VENTA]
      _ -> seleccionar_opcion_compra()
    end
  end
end

# Disparador del programa
Tienda.main()
