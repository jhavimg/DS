// ignore_for_file: file_names, non_constant_identifier_names

import 'Strategy.dart';

class ColorVerde implements Strategy{
  @override
  String buildColor(){
    String color_vehicle = "verde";
    return color_vehicle;
  }
}