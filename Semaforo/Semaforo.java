import java.util.concurrent.Semaphore;

// El nombre de la clase debe coincidir con el nombre del archivo .java
public class Semaforo { 
    public static void main(String[] args) {
        // Permitimos 1 ventanilla activa a la vez
        Semaphore semaforo = new Semaphore(1);

        for (int i = 1; i <= 10; i++) {
            new Thread(new AccesoVentanillas(semaforo, i)).start();
        }
    }
}

class AccesoVentanillas implements Runnable {
    private final int id;
    private final Semaphore semaforo;

    public AccesoVentanillas(Semaphore semaforo, int id) {
        this.semaforo = semaforo;
        this.id = id;
    }

    @Override
    public void run() {
        try {
            System.out.println("Hilo " + id + " esperando para acceder a la ventanilla...");
            
            // Solicitar permiso al semáforo
            semaforo.acquire(); 
            
            System.out.println(">>> Hilo " + id + " EN LA VENTANILLA (atendiendo)");
            
            // Simular el tiempo que tarda el trámite (2 segundos)
            Thread.sleep(2000); 
            
            System.out.println("<<< Hilo " + id + " LIBERANDO ventanilla y saliendo");
            
            // Soltar el permiso para que otro hilo pueda entrar
            semaforo.release(); 
            
        } catch (InterruptedException e) {
            System.err.println("El hilo " + id + " fue interrumpido.");
            Thread.currentThread().interrupt();
        }
    }
}