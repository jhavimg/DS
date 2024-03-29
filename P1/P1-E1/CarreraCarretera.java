package EJ1;

public class CarreraCarretera extends Carrera{
    @Override
    public void carrera(){
        System.out.println("Carrera de carretera");
    }

    CarreraCarretera(int tam){
        super(tam);
    }
}
