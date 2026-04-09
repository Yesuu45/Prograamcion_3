defmodule Aerolinea do

  # PUNTO 1: Códigos de vuelos disponibles ordenados alfabéticamente
  def obtener_codigos_disponibles(vuelos) do
    vuelos
    |> Enum.filter(fn %{disponible: d} -> d == true end)
    |> Enum.map(fn %{codigo: c} -> c end)
    |> Enum.sort()
  end

  # PUNTO 2: Pasajeros totales por aerolínea (agrupados)
  def pasajeros_por_aerolinea(vuelos) do
    vuelos
    |> Enum.group_by(fn vuelo -> vuelo.aerolinea end)
    |> Map.new(fn {nombre_aerolinea, lista_vuelos} ->
      total_pasajeros =
        lista_vuelos
        |> Enum.map(&(&1.pasajeros))
        |> Enum.sum()

      {nombre_aerolinea, total_pasajeros}
    end)
  end

  # PUNTO 3: Generar cadenas de itinerario con formato de tiempo Xh Ym
  def generar_itinerarios(vuelos) do
    vuelos
    |> Enum.map(fn v ->
      # Cálculo de horas y minutos
      horas = div(v.duracion, 60)
      minutos = rem(v.duracion, 60)

      # Formateo de minutos: añade un cero si es menor a 10
      minutos_texto =
        minutos
        |> Integer.to_string()
        |> String.pad_leading(2, "0")

      "#{v.codigo} — #{v.origen} → #{v.destino}: #{horas}h #{minutos_texto}m"
    end)
  end

  def ejecutar do
    vuelos = [
      %{codigo: "AV201", aerolinea: "Avianca", origen: "BOG", destino: "MDE", duracion: 45, precio: 180_000, pasajeros: 120, disponible: true},
      %{codigo: "LA305", aerolinea: "Latam", origen: "BOG", destino: "CLO", duracion: 55, precio: 210_000, pasajeros: 98, disponible: true},
      %{codigo: "AV410", aerolinea: "Avianca", origen: "MDE", destino: "CTG", duracion: 75, precio: 320_000, pasajeros: 134, disponible: false},
      %{codigo: "VV102", aerolinea: "Viva Air", origen: "BOG", destino: "BAQ", duracion: 90, precio: 145_000, pasajeros: 180, disponible: true},
      %{codigo: "LA512", aerolinea: "Latam", origen: "CLO", destino: "CTG", duracion: 110, precio: 480_000, pasajeros: 76, disponible: false},
      %{codigo: "AV330", aerolinea: "Avianca", origen: "BOG", destino: "CTG", duracion: 135, precio: 520_000, pasajeros: 155, disponible: true},
      %{codigo: "VV215", aerolinea: "Viva Air", origen: "MDE", destino: "BOG", duracion: 50, precio: 130_000, pasajeros: 190, disponible: true},
      %{codigo: "LA620", aerolinea: "Latam", origen: "BOG", destino: "MDE", duracion: 145, precio: 390_000, pasajeros: 112, disponible: true},
      %{codigo: "AV505", aerolinea: "Avianca", origen: "CTG", destino: "BOG", duracion: 120, precio: 440_000, pasajeros: 143, disponible: false},
      %{codigo: "VV340", aerolinea: "BAQ", origen: "BAQ", destino: "BOG", duracion: 85, precio: 160_000, pasajeros: 175, disponible: true}
    ]

    IO.puts("=== 1. CÓDIGOS DISPONIBLES ===")
    vuelos |> obtener_codigos_disponibles() |> IO.inspect()

    IO.puts("\n=== 2. PASAJEROS POR AEROLÍNEA ===")
    vuelos |> pasajeros_por_aerolinea() |> IO.inspect()

    IO.puts("\n=== 3. ITINERARIOS FORMATEADOS ===")
    vuelos |> generar_itinerarios() |> Enum.each(&IO.puts/1)
  end
end

# Arrancar el programa
Aerolinea.ejecutar()
