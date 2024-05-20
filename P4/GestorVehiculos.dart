import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Vehicle.dart';

class GestorVehiculos{
  List<Vehicle> vehiculos = [];
  final String apiUrl = "http://localhost:3000/vehiculos";

  GestorVehiculos(this.vehiculos);
  

  Future<void> cargarVehiculos(String usuario) async {
    final response = await http.get(Uri.parse('$apiUrl?usuario=$usuario'));

    if (response.statusCode == 200) {
      List<dynamic> vehiculosJson = json.decode(response.body);

      vehiculos.clear();
      vehiculos.addAll(vehiculosJson.map((json) => Vehicle.fromJson(json)).toList());
    } 
    else {
      throw Exception("No se pudieron cargar los vehículos");
    }
  }

  Future<void> agregarVehiculo(Vehicle v) async{
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(v.toJson()),
    );

    if (response.statusCode == 201) {
      vehiculos.add(Vehicle.fromJson(json.decode(response.body)));
    } 
    else {
      throw Exception("No se pudo agregar el vehículo: ${response.body}");
    }
  }

  Future<void> eliminarVehiculo(Vehicle v) async{
    final response = await http.delete(
      Uri.parse('$apiUrl/${v.id}'),
    );

    if (response.statusCode == 200) {
      vehiculos.removeWhere((tmp) => tmp.id == v.id);
    } 
    else {
      throw Exception("No se pudo eliminar el vehículo");
    }
  }

  Future<void> actualizarVehiculo(Vehicle v) async{
    final response = await http.put(
      Uri.parse('$apiUrl/${v.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(v.toJson()),
    );

    if (response.statusCode == 200) {
      int index = vehiculos.indexWhere((tmp) => tmp.id == v.id);
      
      if (index != -1) {
        vehiculos[index] = Vehicle.fromJson(json.decode(response.body));
      }
    } 
    else {
      throw Exception("No se pudo actualizar el vehículo");
    }
  }

  Future<List<Vehicle>> obtenerVehiculos() async{
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> vehiculosJson = json.decode(response.body);
      List<Vehicle> listaVehiculos = vehiculosJson.map((json) => Vehicle.fromJson(json)).toList();

      return listaVehiculos;
    } 
    else {
      throw Exception("No se pudieron cargar los vehículos");
    }
  }

  
}