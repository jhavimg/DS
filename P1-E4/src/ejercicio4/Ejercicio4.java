/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4;

import controlador.Controlador;
import modelo.Cliente;
import modelo.GestorFiltros;
import modelo.Objetivo;
import modelo.calcularVelocidad;
import modelo.repercutirRozamiento;
import vista.Salpicadero;

/**
 * 
 * @author jezuz
 */


public class Ejercicio4 {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Objetivo objetivo = new Objetivo(); // Creo el objetivo
        GestorFiltros gestor = new GestorFiltros(objetivo); //Creo el gestor de filtro y le paso el objetivo
        
        //Añado los filtros
        gestor.addFiltro(new calcularVelocidad());
        gestor.addFiltro(new repercutirRozamiento());

        Cliente cliente = new Cliente(gestor);
        Salpicadero salpicadero = new Salpicadero();

        Controlador controlador = new Controlador(objetivo , cliente, salpicadero);

        //Llamo a la funcion del controlador que es la que inicia la conducción
        controlador.conduce();
    }
}