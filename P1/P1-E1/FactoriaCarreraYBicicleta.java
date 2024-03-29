package EJ1;

import java.util.Random;

public interface FactoriaCarreraYBicicleta {
    Random r = new Random();
    public int N = r.nextInt(50)+10;
    
    Carrera crearCarrera();
    Bicicleta crearBicicleta();
}