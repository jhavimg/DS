package modelo;

public class repercutirRozamiento implements Filtro{
    private final double  ROZAMINETO = 5;

    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor){
        double r = revoluciones;
        
        // Si el coche no está en movimineto no existe rozamiento
        if((estadoMotor == EstadoMotor.ENCENDIDO && revoluciones == 0) || estadoMotor == EstadoMotor.APAGADO )
            r = 0;
        else
            r -= ROZAMINETO;

        if(r < 0)
            r = 0;
        
        return r;
    }
    
}
