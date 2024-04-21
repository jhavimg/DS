package P1_E1;

public class Main {
    public static void main (String[] args) {
        // Crear las factorías y carreras
        FactoriaCarreraYBicicleta factoriaMontana = new FactoriaMontana();
        Carrera carreraMontana = factoriaMontana.crearCarrera();

        FactoriaCarreraYBicicleta factoriaCarretera = new FactoriaCarretera();
        Carrera carreraCarretera = factoriaCarretera.crearCarrera();

        // Crear e iniciar las hebras
        Thread hebraMontana = new Thread(new CarreraRunnable(carreraMontana));
        Thread hebraCarretera = new Thread(new CarreraRunnable(carreraCarretera));

        hebraMontana.start();
        hebraCarretera.start();

        // Esperar 60 segundos
        try {
            hebraMontana.interrupt();
            hebraCarretera.interrupt();
            Thread.sleep(60000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // Mostrar el contenido de las carreras
        System.out.println("Contenido de la carrera de montaña:");
        for (Bicicleta bicicleta : carreraMontana.bicicletas) {
            bicicleta.bicicleta();
        }

        System.out.println("Contenido de la carrera de carretera:");
        for (Bicicleta bicicleta : carreraCarretera.bicicletas) {
            bicicleta.bicicleta();
        }
    }
}

class CarreraRunnable implements Runnable {
    private Carrera carrera;

    public CarreraRunnable(Carrera carrera) {
        this.carrera = carrera;
    }

    @Override
    public void run() {
        while (!Thread.currentThread().isInterrupted()) {
            for (int i = 0; i < carrera.bicicletas.size(); i++) {
                carrera.bicicletas.get(i).bicicleta();
            }
        }
    }
}
