import 'Operacion.dart';

class Modulo extends Operacion{
  @override
  double calculate(double num1, double num2){ return (num1 % num2); }
}