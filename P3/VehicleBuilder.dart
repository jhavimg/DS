// ignore_for_file: file_names, non_constant_identifier_names

import 'Vehicle.dart';

abstract class VehicleBuilder{
  late Vehicle vehicle;
  late double baseCost;

  VehicleBuilder({required this.baseCost});


  Vehicle getVehicle(){
    return vehicle;
  }

  void createNewVehicle(){
    vehicle = Vehicle();
  }

//Metodos abstractos
  void buildEngine(String engine);
  void buildWheels();
  void buildAudioSystem(bool audioSystem);
  void buildTransmission(bool transmission);
}