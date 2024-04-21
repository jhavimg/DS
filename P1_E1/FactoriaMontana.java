package P1_E1;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class FactoriaMontana implements FactoriaCarreraYBicicleta{
    public Carrera crearCarrera(){
        Carrera carrera = new CarreraMontana(N);

        System.out.println("Carrera inicio: " + N);

        for(int i = 0; i < N; i++){
            carrera.bicicletas.add(crearBicicleta());
        }

        double porcentajeEliminar = 0.2;
        int cantidadEliminar = (int) (carrera.bicicletas.size() * porcentajeEliminar);

        List<Integer> todosIndices = new ArrayList<>();
        for (int i = 0; i < carrera.bicicletas.size(); i++) {
            todosIndices.add(i);
        }

        Collections.shuffle(todosIndices);
        List<Integer> indicesEliminar = todosIndices.subList(0, cantidadEliminar);

        int nuevaLongitud = carrera.bicicletas.size() - cantidadEliminar;

        // Crear un nuevo array con la longitud calculada
        Carrera nuevaCarrera = new CarreraMontana(nuevaLongitud);

        // Copiar los elementos del array original al nuevo array, omitiendo los elementos a eliminar
        for (int i = 0; i < carrera.bicicletas.size(); i++) {
            if (!indicesEliminar.contains(i)) {
                nuevaCarrera.bicicletas.add(carrera.bicicletas.get(i));
            }
        }

        carrera = nuevaCarrera;

        System.out.println("Carrera inicio: " + nuevaLongitud);

        return carrera;
    }
    public Bicicleta crearBicicleta(){
        Bicicleta bicicleta = new BicicletaMontana();

        Random r = new Random();
        bicicleta.id = r.nextInt(1000)+1;

        return bicicleta;
    }
}
