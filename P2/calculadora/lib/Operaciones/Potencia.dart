import 'dart:math';
import 'Operacion.dart';

class Potencia extends Operacion{
  @override
  double calculate(double num1, double num2){ return pow(num1, num2).toDouble(); }
}