package EJ1;

public class CarreraMontana extends Carrera{
    @Override
    public void carrera(){
        System.out.println("Carrera de montaña");
    }

    CarreraMontana(int tam){
        super(tam);
    }
}
