defmodule IPCLocal do
  # Función principal
  def main() do
    # Nota: Asegúrate de tener el módulo Util definido o cámbialo por IO.puts
    IO.puts("PROCESO PRINCIPAL")

    crear_servicio()
    |> producir_elementos()

    recibir_respuestas()
  end

  def producir_elementos(servicio) do
    {:mayusculas, "Juan"} |> enviar_mensaje(servicio)
    {:minusculas, "Ana"} |> enviar_mensaje(servicio)
    {:mayusculas, "Diana"} |> enviar_mensaje(servicio)
    {&String.reverse/1, "Julian"} |> enviar_mensaje(servicio)

    "Uniquindio" |> enviar_mensaje(servicio)
    :fin |> enviar_mensaje(servicio)

    servicio # Devolvemos el PID para seguir el pipeline si fuera necesario
  end

  defp crear_servicio(), do: spawn(IPCLocal, :activar_servicio, [])

  defp enviar_mensaje(mensaje, servicio), do: send(servicio, {self(), mensaje})

  def recibir_respuestas() do
    receive do
      :fin ->
        :ok

      mensaje ->
        IO.puts("\t -> #{mensaje}")
        recibir_respuestas()
    end
  end

  # Moví esta función dentro del módulo para que spawn funcione correctamente
 def activar_servicio() do
    receive do
      {productor, :fin} ->
        send(productor, :fin)

      {productor, {:mayusculas, mensaje}} ->
        send(productor, String.upcase(mensaje))
        activar_servicio()

      {productor, {:minusculas, mensaje}} ->
        send(productor, String.downcase(mensaje))
        activar_servicio()

      {productor, {funcion, mensaje}} ->
        # Aquí ejecutamos la función que mande el productor (como String.reverse)
        send(productor, funcion.(mensaje))
        activar_servicio()

      {productor, mensaje} ->
        send(productor, "El mensaje \"#{mensaje}\" es desconocido.")
        activar_servicio()
    end
  end
end

# Ejecución
IPCLocal.main()
