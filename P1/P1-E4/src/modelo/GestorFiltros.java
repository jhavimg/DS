package modelo;

public class GestorFiltros {
    private CadenaFiltros cadena;

    public GestorFiltros( Objetivo o){
        cadena = new CadenaFiltros();
        this.cadena.setObejtivo(o);
    }

    public void addFiltro(Filtro f){
        this.cadena.addFiltro(f);
    }

    public void ejecutar(EstadoMotor estadoMotor ){
        cadena.ejecutar(estadoMotor);
    }
}
