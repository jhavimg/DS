// ignore_for_file: file_names, non_constant_identifier_names

import 'Strategy.dart';

class ColorRojo implements Strategy{
  @override
  String buildColor(){
    String color_vehicle = "rojo";
    return color_vehicle;
  }
}