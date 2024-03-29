package controlador;


import modelo.Cliente;
import modelo.EstadoMotor;
import modelo.Objetivo;
import vista.Salpicadero;

public class Controlador {
    Cliente cliente;
    Salpicadero salpicadero;
    EstadoMotor estado;
    Objetivo objetivo;

    public  Controlador(Objetivo o ,Cliente c, Salpicadero s) {
        this.cliente = c;
        this.salpicadero = s;
        this.objetivo = o;
        
    }

    public void conduce(){
        boolean continuar = true;
        
        while(continuar){
            /*Este try-catch sirve para que el entre bucles espere un poco para que no vaya tan rapido */
            
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {}
            
            estado = salpicadero.getEstado();

            this.cliente.ejecutar(estado);

            this.salpicadero.actualiza(this.objetivo);
        }
    }
}
