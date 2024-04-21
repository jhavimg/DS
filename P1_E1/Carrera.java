package P1_E1;

import java.util.ArrayList;

public abstract class Carrera {
    protected int tam;
    protected ArrayList<Bicicleta> bicicletas = new ArrayList<>(tam);

    public abstract void carrera();

    Carrera(int tam){
        this.tam = tam;
    }
}
