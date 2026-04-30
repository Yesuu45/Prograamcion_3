defmodule Restaurante do

  def atender_mesa do
    IO.puts("--- Cliente llega al restaurante ---")

    # 1. El proceso principal anota su PID
    id = self()

    # 2. Lanzamos 4 procesos independientes (hilos ligeros)
    # Cada uno recibe el ID del padre para poder responderle
    spawn(fn -> preparar_orden("Papas", 3000, id) end)
    spawn(fn -> preparar_orden("Hamburguesa", 1500, id) end)
    spawn(fn -> preparar_orden("Piza", 15000, id) end)
    spawn(fn -> preparar_orden("agua", 2000, id) end)

    IO.puts("El cliente está mirando el celular mientras espera...")

    # 3. El proceso principal entra en un bucle de espera
    esperar_mensajes(4)

    IO.puts("--- Cliente se va feliz con su comida ---")
  end

  def preparar_orden(nombre, tiempo, pid_cliente) do
    # Cada proceso hijo imprime su inicio y el ID de a quién le va a responder
    IO.puts("[Cocina] Iniciando: #{nombre} ")

    # El proceso hijo se duerme, pero el padre sigue libre
    Process.sleep(tiempo)

    # El hijo envía un mensaje al buzón del padre
    send(pid_cliente, {:listo, nombre})
  end

  # 4. Lógica para recolectar los mensajes
  defp esperar_mensajes(0), do: :ok # Si ya recibió los 4, termina
  defp esperar_mensajes(n) do
    receive do
      {:listo, nombre} ->
        # self() aquí muestra que el proceso que recibe es el del cliente
        IO.puts("[Mesa] El cliente recibió su: #{nombre}  y está disfrutando su comida.")
        # Llamada recursiva para esperar el siguiente mensaje
        esperar_mensajes(n - 1)
    end
  end
end

# Ejecución
Restaurante.atender_mesa()
