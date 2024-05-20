// ignore_for_file: file_names, non_constant_identifier_names

import 'VehicleBuilder.dart';

class VehicleDirector {
  late VehicleBuilder builder;

  //VehicleDirector({required this.builder});
  VehicleDirector(VehicleBuilder builder){
    this.builder = builder;
  }

  void constructVehicle(){
    builder.buildEngine(builder.vehicle.engine!);
    builder.buildWheels();
    builder.buildAudioSystem(builder.vehicle.audioSystem ?? false);
    builder.buildTransmission(builder.vehicle.transmission ?? false);
  }
}
