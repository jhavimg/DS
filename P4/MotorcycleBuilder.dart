// ignore_for_file: file_names, non_constant_identifier_names, use_super_parameters

import 'VehicleBuilder.dart';

//Tengo que crear la clase MotorcycleBuilder abstracta para no implementar algunos metodos de la superclase
class MotorcycleBuilder extends VehicleBuilder{
  
//No estoy seguro de si se llama así con super. Faltaría el baseCost
  MotorcycleBuilder({required double baseCost}) : super(baseCost: baseCost){
    createNewVehicle();
    vehicle.tipo = "Moto";
  }

  @override
  void buildEngine(String engine){
    vehicle.engine = engine;
  }

  @override
  void buildWheels(){
    vehicle.wheels = 2;
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