package modelo;

import java.util.*;

public class CadenaFiltros {
    private  ArrayList<Filtro> filtros = new ArrayList();
    Objetivo objetivo;
    double revoluciones = 0.0;

    public void addFiltro(Filtro f){
        this.filtros.add(f);
    }

    public void setObejtivo(Objetivo o){
        this.objetivo = o;
    }

    public void ejecutar(EstadoMotor estadoMotor ){
        for(Filtro filtro: filtros){
            revoluciones = filtro.ejecutar(revoluciones, estadoMotor);
        }
        
        if(objetivo != null){
            objetivo.ejecutar(revoluciones, estadoMotor);
        }
    }

}

