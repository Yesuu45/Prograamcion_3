defmodule Main do
  def main do
    # 0. Datos Iniciales
    lista = [{"Hola"}, {"Mundo"}, {"Elixir"}, {"Programación"}, {"Recursión"}]

    # 1. Entradas de Texto
    caracter = IO.gets("Ingrese un caracter o palabra: ") |> String.trim()
    caracter2 = IO.gets("Ingrese otro caracter o palabra: ") |> String.trim()

    # 2. Entradas Numéricas
    n_input = IO.gets("Ingrese el número (n) para potencia: ") |> String.trim() |> String.to_integer()
    b_input = IO.gets("Ingrese la base (b) para potencia: ") |> String.trim() |> String.to_integer()
    n_perfecto = IO.gets("Ingrese un número para verificar si es perfecto: ") |> String.trim() |> String.to_integer()
    n_reversible = IO.gets("Ingrese un número para verificar si es reversible: ") |> String.trim() |> String.to_integer()

    # 3. Conversiones y Preparación
    convertir_caracter = String.graphemes(caracter)
    convertir_caracter2 = String.split(caracter2, "")

    # 4. Ejecución de Lógicas (Tu lógica original)
    resultado = suma_de_carcteres(convertir_caracter)
    resultado2 = sumar_caracteres_recursivo_dos(convertir_caracter2)
    es_potencia = potencia(n_input, b_input)
    suma_divisores = numero_perfecto(n_perfecto)
    reversible_resultado = es_reversible?(n_reversible)
    lista_larga = lista_mas_larga(Enum.map(lista, &elem(&1, 0)))

    # 5. Salidas Finales
    IO.puts("\n--- RESULTADOS ---")
    IO.puts("La cantidad de caracteres (Graphemes): #{resultado}")
    IO.puts("La cantidad de caracteres (Split): #{resultado2}")
    IO.puts("¿Es #{n_input} potencia de #{b_input}?: #{es_potencia}")
    IO.puts("#{n_perfecto} es un número perfecto?: #{suma_divisores == n_perfecto}")
    IO.puts("#{n_reversible} es un número reversible?: #{reversible_resultado}")
    IO.puts("La longitud de la cadena más larga en la lista es: #{lista_larga}")
  end

  # --- Lógica 1: suma_de_carcteres ---
  def suma_de_carcteres(lista), do: suma_de_carcteres(lista, 0)
  def suma_de_carcteres([], acumulador), do: acumulador
  def suma_de_carcteres([_head | tail], acumulador), do: suma_de_carcteres(tail, acumulador + 1)

  # --- Lógica 2: sumar_caracteres_recursivo_dos ---
  def sumar_caracteres_recursivo_dos(caracteres), do: sumar_caracteres_recursivo_dos(caracteres, 0)
  def sumar_caracteres_recursivo_dos([], acumulador), do: acumulador
  def sumar_caracteres_recursivo_dos([_head | tail], acumulador), do: sumar_caracteres_recursivo_dos(tail, acumulador + 1)

  # --- Lógica 3: Potencia ---
  def potencia(1, _b), do: true
  def potencia(n, b) when rem(n, b) != 0, do: false
  def potencia(n, b), do: potencia(div(n, b), b)

  # --- Lógica 4: Número Perfecto ---
  def numero_perfecto(n), do: numero_perfecto(n, 1, 0)
  def numero_perfecto(n, acc, suma) when acc == n, do: suma
  def numero_perfecto(n, acc, suma) do
    if rem(n, acc) == 0 do
      numero_perfecto(n, acc + 1, suma + acc)
    else
      numero_perfecto(n, acc + 1, suma)
    end
  end

  # --- Lógica 5: Lista más larga ---
  def lista_mas_larga(lista), do: lista_mas_larga(lista, 0)
  def lista_mas_larga([], max), do: max
  def lista_mas_larga([head | tail], max) do
    longitud = String.length(head)
    IO.puts("Revisando: #{head} (Longitud: #{longitud}), Max hasta ahora: #{max}")
    if longitud > max do
      lista_mas_larga(tail, longitud)
    else
      lista_mas_larga(tail, max)
    end
  end

  # --- Lógica 6: Número Reversible ---
  def es_reversible?(n) do
    if n > 0 and rem(n, 10) != 0 do
      invertido = invertir(n, 0)
      suma = n + invertido
      todos_impares?(suma)
    else
      false
    end
  end

  defp invertir(0, acc), do: acc
  defp invertir(n, acc) do
    invertir(div(n, 10), acc * 10 + rem(n, 10))
  end

  defp todos_impares?(0), do: true
  defp todos_impares?(n) do
    digito = rem(n, 10)
    if rem(digito, 2) != 0 do
      todos_impares?(div(n, 10))
    else
      false
    end
  end
end

Main.main()
