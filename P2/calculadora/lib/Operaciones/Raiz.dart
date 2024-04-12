import 'dart:math';
import 'Operacion.dart';

class Raiz extends Operacion{
  @override
  double calculate(double num1, double num2){ return pow(num2, (1/num1)).toDouble(); }
}