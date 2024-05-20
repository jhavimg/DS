// ignore_for_file: file_names, non_constant_identifier_names

import 'Strategy.dart';

class Vehicle{
//Atributos de la clase
  String? tipo;
  late Strategy strategy;
  double? baseCost;
  String? engine;
  int? wheels;
  bool? color = false;
  String color_vehicle;
  bool? audioSystem = false;
  bool? transmission = false;

  int? id;
  String? usuario;

  //Constructor de la clase
  Vehicle({
    this.tipo, 
    this.baseCost, 
    this.engine, 
    this.wheels, 
    this.color, 
    this.color_vehicle = "Blanco por defecto", 
    this.audioSystem, 
    this.transmission, 
    this.id, 
    this.usuario});

  factory Vehicle.fromJson(Map<String, dynamic> json){
    return Vehicle(
      tipo: json['tipo'] as String?,
      baseCost: json['baseCost'] as double?,
      engine: json['engine'] as String?,
      wheels: json['wheels'] as int?,
      color: json['color'] as bool?,
      color_vehicle: json['color_vehicle'] as String,
      audioSystem: json['audioSystem'] as bool?,
      transmission: json['transmission'] as bool?,
      id: json['id'] as int?,
      usuario: json['usuario'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tipo': tipo,
      'baseCost': baseCost,
      'engine': engine,
      'wheels': wheels,
      'color': color,
      'color_vehicle': color_vehicle,
      'audioSystem': audioSystem,
      'transmission': transmission,

      if (id != null) 'id': id,
      'usuario': usuario,
    };
  }

//Funciones de la clase
  void setStrategy(Strategy strategy){
    this.strategy = strategy;
  }

  double calculateCost(baseCost){
    this.baseCost = baseCost;

    double additionalCost = 0;

    additionalCost += (color == true) ? 500 : 0;
    additionalCost += (audioSystem == true) ? 1000 : 0;
    additionalCost += (transmission == true) ? 1500 : 0;

    return baseCost + additionalCost;
  }

  void buildColor(){
    color_vehicle = strategy.buildColor();

  }

  @override
  String toString(){
    String colorString = (color == true) ? "Personalizado" : "No personalizado";
    String audioSystemString = (audioSystem == true) ? "Personalizado" : "No personalizado";
    String transmissionString = (transmission == true) ? "Personalizado" : "No personalizado";

    String formato = "Tipo de vehiculo: $tipo \nMotor: $engine \nRuedas: $wheels";
    formato += "\nColor: $colorString \nColor del vehiculo: $color_vehicle";
    formato += "\nSistema de audio: $audioSystemString \nTransmision: $transmissionString";
    return  formato;
  }
}