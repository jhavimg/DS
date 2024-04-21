// ignore_for_file: file_names, non_constant_identifier_names

import 'Strategy.dart';

class ColorAzul implements Strategy{
  @override
  String buildColor(){
    String color_vehicle = "azul";
    return color_vehicle;
  }
}