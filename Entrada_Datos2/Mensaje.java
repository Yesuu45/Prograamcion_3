package Entrada_Datos2;

import javax.swing.JOptionPane;

public class Mensaje {
    public static void main(String[] args) {
        if (args.length > 0 && args[0].equals("input")) {
            // Pedir input con ventana
            String mensaje = args.length > 1 ? args[1] : "Ingrese un valor:";
            String input = JOptionPane.showInputDialog(null, mensaje);
            System.out.println(input); // Retorna valor a Elixir
        } else if (args.length > 0) {
            // Mostrar mensaje en ventana
            JOptionPane.showMessageDialog(null, args[0]);
        } else {
            JOptionPane.showMessageDialog(null, "No se proporcionó ningún mensaje");
        }
    }
}

