import 'Vehicle.dart';

class GestorVehiculos{
  List<Vehicle> vehiculos = [];

  void agregarVehiculo(Vehicle v){
    vehiculos.add(v);
  }

  void eliminarVehiculo(Vehicle v){
    vehiculos.remove(v);
  }

  List<Vehicle> obtenerVehiculos(){
    return vehiculos;
  }
}