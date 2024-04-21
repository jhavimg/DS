// ignore_for_file: file_names, non_constant_identifier_names, use_super_parameters

import 'VehicleBuilder.dart';

//Tengo que crear la clase TruckBuilder abstracta para no implementar algunos metodos de la superclase
class TruckBuilder extends VehicleBuilder{
  
//No estoy seguro de si se llama así con super. Faltaría el baseCost
  TruckBuilder({required double baseCost}) : super(baseCost: baseCost){
    createNewVehicle();
  }

  @override
  void buildEngine(String engine){
    vehicle.engine = engine;
  }

  @override
  void buildWheels(){
    vehicle.wheels = 6;
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