package modelo;

public class Cliente {
    private GestorFiltros gestor;
    
    public Cliente(GestorFiltros g) {
        this.gestor = g;
    }

    public void ejecutar( EstadoMotor estadoMotor ){
        gestor.ejecutar(estadoMotor);
    }
}
