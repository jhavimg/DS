// ignore_for_file: file_names, non_constant_identifier_names, use_super_parameters

import 'VehicleBuilder.dart';

//Tengo que crear la clase CarBuilder abstracta para no implementar algunos metodos de la superclase
class CarBuilder extends VehicleBuilder{
  
//No estoy seguro de si se llama así con super. Faltaría el baseCost
  CarBuilder({required double baseCost}) : super(baseCost: baseCost){
    createNewVehicle();
    vehicle.tipo = "Coche";
  }

  @override
  void buildEngine(String engine){
    vehicle.engine = engine;
  }

  @override
  void buildWheels(){
    vehicle.wheels = 4;
  }

  @override
  void buildAudioSystem(bool audioSystem){
    vehicle.audioSystem = audioSystem;
  }

  @override
  void buildTransmission(bool transmission){
    vehicle.transmission = transmission;
  }
}