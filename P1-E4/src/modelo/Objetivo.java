package modelo;

public class Objetivo {
    private double velocidad_lineal;
    private double velocidad_angular;
    private float distancia;
    private double revoluciones;
    private final double RADIO = 0.15; 
    private long tiempoInicial;

    public Objetivo(){
        this.distancia = 0;
        this.velocidad_lineal=0;
        this.velocidad_angular=0;
        this.tiempoInicial = System.currentTimeMillis();
    }

    public double getVelocidad_lineal() {
        return this.velocidad_lineal;
    }

    public double getVelocidad_angular() {
        return this.velocidad_angular;
    }

    public double getDistancia() {
        return this.distancia;
    }

    public double getRevoluciones() {
        return revoluciones;
    }

    public void calcula_velocidad_lineal(){
        double MH = 2.0 * Math.PI * RADIO * this.revoluciones  * 60;
        double KM = MH / 1000;

        this.velocidad_lineal = KM; 
    }

    public void calcula_velocidad_angular(){
        this.velocidad_angular = 2* Math.PI * 60;
    }

    public void calcula_distancia(){
        long tiempoTranscurrido = 0;
        long tiempoActual = System.currentTimeMillis();
    
        // Calcular el tiempo transcurrido en segundos
        tiempoTranscurrido = (tiempoActual - tiempoInicial) / 1000;
        tiempoInicial = tiempoActual;
        
        // Calcular la distancia en base a la velocidad lineal y el tiempo transcurrido
        double d = (float) (velocidad_lineal * tiempoTranscurrido / 1000.0);
        this.distancia += d;
    }

    public void ejecutar(double revoluciones , EstadoMotor estadoMotor ){
        this.revoluciones = revoluciones;
        calcula_velocidad_lineal();
        calcula_velocidad_angular();
        calcula_distancia();
        
    } 
}
