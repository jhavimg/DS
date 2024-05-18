// ignore_for_file: file_names, non_constant_identifier_names

import 'Strategy.dart';
import 'package:flutter/material.dart';

class Vehicle{
//Atributos de la clase
  late String tipo = "";
  late Strategy strategy;
  late double baseCost;
  late String engine;
  late int wheels;
  late bool color = false;
  late String color_vehicle = "blanco por defecto";
  late bool audioSystem = false;
  late bool transmission = false;

//Funciones de la clase
  void setStrategy(Strategy strategy){
    this.strategy = strategy;
  }

  double calculateCost(baseCost){
    this.baseCost = baseCost;

    double additionalCost = 0;

    additionalCost += color ? 500 : 0;
    additionalCost += audioSystem ? 1000 : 0;
    additionalCost += transmission ? 1500 : 0;

    return baseCost + additionalCost;
  }

  void buildColor(){
    color_vehicle = strategy.buildColor();
  }

  @override
  String toString(){
    String colorString = color ? "Personalizado" : "No personalizado";
    String audioSystemString = audioSystem ? "Personalizado" : "No personalizado";
    String transmissionString = transmission ? "Personalizado" : "No personalizado";

    String formato = "Tipo de vehiculo: $tipo \nMotor: $engine \nRuedas: $wheels";
    formato += "\nColor: $colorString \nColor del vehiculo: $color_vehicle";
    formato += "\nSistema de audio: $audioSystemString \nTransmision: $transmissionString";
    return  formato;
  }
}