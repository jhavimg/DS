package modelo;

public class calcularVelocidad implements Filtro{
    private  double incrementoVelocidad;
    private final double  MAX_REVOLUCIONES = 5000;

    private void setIncrementoVelocidad(double revoluciones,EstadoMotor estado){
        switch (estado) {
            case APAGADO:
                this.incrementoVelocidad = 0;
                break;
            case ENCENDIDO:
                this.incrementoVelocidad = 0;
                break;
            case ACELERANDO:
                if(revoluciones > MAX_REVOLUCIONES - 100)
                    this.incrementoVelocidad = 0;
                else{
                    this.incrementoVelocidad = 100;
                }
                break;
            case FRENANDO:
                this.incrementoVelocidad = (-100);
                break;
        }
        
    }

    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor) {
        double r = revoluciones;
        setIncrementoVelocidad(revoluciones , estadoMotor);
        r += incrementoVelocidad;
        
        if(r < 0)
            r = 0;

        return r;
    }
    
}
