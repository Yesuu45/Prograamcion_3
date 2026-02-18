import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Mensaje {
    public static void main(String[] args) {
        String mensaje = "Hola mundo";

        try {
            Process proceso = new ProcessBuilder("cmd", "/c", "elixir eco.exs \"" + mensaje + "\"")
                                    .start();

            try (BufferedReader reader = new BufferedReader(new InputStreamReader(proceso.getInputStream()))) {
                reader.lines().forEach(line -> System.out.println("Respuesta desde Elixir: " + line));
            }

            proceso.waitFor();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
