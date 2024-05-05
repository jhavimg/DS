import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:practica2/main.dart';
import '../lib/VehicleBuilder.dart';
import '../lib/Vehicle.dart';
import '../lib/VehicleDirector.dart';

import '../lib/CarBuilder.dart';
import '../lib/MotorcycleBuilder.dart';
import '../lib/TruckBuilder.dart';

import '../lib/GestorVehiculos.dart';
import '../lib/Strategy.dart';
import '../lib/ColorAzul.dart';
import '../lib/ColorRojo.dart';
import '../lib/ColorVerde.dart';


void main() {
  group("Builder test", () {
    VehicleBuilder carBuilder = CarBuilder(baseCost: 5000);
    VehicleBuilder motorcycleBuilder = MotorcycleBuilder(baseCost: 3000);
    VehicleBuilder truckBuilder = TruckBuilder(baseCost: 10000);

    Vehicle vehicle;
    VehicleDirector director;

    test("CarBuilder Test", (){
      carBuilder.buildEngine("Diesel");
      carBuilder.buildWheels();
      vehicle = carBuilder.getVehicle();

      expect(vehicle.engine, "Diesel");
      expect(vehicle.wheels, 4);

      //Le cambiamos el motor al coche
      carBuilder.buildEngine("Gasolina");
      vehicle = carBuilder.getVehicle();
      expect(vehicle.engine, "Gasolina");

      //Se le ha pinchado una rueda
      vehicle.wheels -= 1;
      expect(vehicle.wheels, 3);

      //Se le ha cambiado la rueda pinchada
      vehicle.wheels += 1;
      expect(vehicle.wheels, 4);

      expect(vehicle.tipo, "Coche");
      expect(carBuilder.getVehicle(), vehicle);
    });

    test("MotorcycleBuilder Test", (){
      motorcycleBuilder.buildEngine("Gasolina");
      motorcycleBuilder.buildWheels();
      vehicle = motorcycleBuilder.getVehicle();

      expect(vehicle.engine, "Gasolina");
      expect(vehicle.wheels, 2);

      //Le cambiamos el motor a la moto
      motorcycleBuilder.buildEngine("Diesel");
      vehicle = motorcycleBuilder.getVehicle();
      expect(vehicle.engine, "Diesel");

      //Se le ha pinchado una rueda
      vehicle.wheels -= 1;
      expect(vehicle.wheels, 1);

      //Se le ha cambiado la rueda pinchada
      vehicle.wheels += 1;
      expect(vehicle.wheels, 2);

      expect(vehicle.tipo, "Moto");
      expect(motorcycleBuilder.getVehicle(), vehicle);
    });

    test("TruckBuilder Test", (){
      truckBuilder.buildEngine("Diesel");
      truckBuilder.buildWheels();
      vehicle = truckBuilder.getVehicle();

      expect(vehicle.engine, "Diesel");
      expect(vehicle.wheels, 6);

      //Le cambiamos el motor al camión
      truckBuilder.buildEngine("Gasolina");
      vehicle = truckBuilder.getVehicle();
      expect(vehicle.engine, "Gasolina");

      //Se le ha pinchado una rueda
      vehicle.wheels -= 1;
      expect(vehicle.wheels, 5);

      //Se le ha cambiado la rueda pinchada
      vehicle.wheels += 1;
      expect(vehicle.wheels, 6);

      expect(vehicle.tipo, "Camión");
      expect(truckBuilder.getVehicle(), vehicle);
    });

    test("AudioSystem test", (){
      //Comprobamos el sistema de audio para el coche
      vehicle = carBuilder.getVehicle();
      expect(vehicle.calculateCost(carBuilder.baseCost), 5000);

      vehicle.audioSystem = true;
      expect(vehicle.calculateCost(carBuilder.baseCost), 6000);

      vehicle.audioSystem = false;
      expect(vehicle.calculateCost(carBuilder.baseCost), 5000);

      //Comprobamos el sistema de audio para la moto
      vehicle = motorcycleBuilder.getVehicle();
      expect(vehicle.calculateCost(motorcycleBuilder.baseCost), 3000);

      vehicle.audioSystem = true;
      expect(vehicle.calculateCost(motorcycleBuilder.baseCost), 4000);

      vehicle.audioSystem = false;
      expect(vehicle.calculateCost(motorcycleBuilder.baseCost), 3000);

      //Comprobamos el sistema de audio para el camión
      vehicle = truckBuilder.getVehicle();
      expect(vehicle.calculateCost(truckBuilder.baseCost), 10000);

      vehicle.audioSystem = true;
      expect(vehicle.calculateCost(truckBuilder.baseCost), 11000);

      vehicle.audioSystem = false;
      expect(vehicle.calculateCost(truckBuilder.baseCost), 10000);
    });

    test("Transmission test", (){
      //Comprobamos la transmisión para el coche
      vehicle = carBuilder.getVehicle();
      expect(vehicle.calculateCost(carBuilder.baseCost), 5000);

      vehicle.transmission = true;
      expect(vehicle.calculateCost(carBuilder.baseCost), 6500);

      vehicle.transmission = false;
      expect(vehicle.calculateCost(carBuilder.baseCost), 5000);

      //Comprobamos la transmisión para la moto
      vehicle = motorcycleBuilder.getVehicle();
      expect(vehicle.calculateCost(motorcycleBuilder.baseCost), 3000);

      vehicle.transmission = true;
      expect(vehicle.calculateCost(motorcycleBuilder.baseCost), 4500);

      vehicle.transmission = false;
      expect(vehicle.calculateCost(motorcycleBuilder.baseCost), 3000);

      //Comprobamos la transmisión para el camión
      vehicle = truckBuilder.getVehicle();
      expect(vehicle.calculateCost(truckBuilder.baseCost), 10000);

      vehicle.transmission = true;
      expect(vehicle.calculateCost(truckBuilder.baseCost), 11500);

      vehicle.transmission = false;
      expect(vehicle.calculateCost(truckBuilder.baseCost), 10000);
    });

    test("VehicleDirector AND BaseCost Test", (){
      //Comprobamos que el director ha construido el coche con los valores por defecto
      director = VehicleDirector(carBuilder);
      director.constructVehicle();
      expect(director.builder, carBuilder);

      vehicle = director.builder.getVehicle();

      expect(vehicle.engine, "Gasolina");
      expect(vehicle.wheels, 4);
      expect(vehicle.audioSystem, false);
      expect(vehicle.transmission, false);

      expect(vehicle.calculateCost(carBuilder.baseCost), 5000);

      vehicle.audioSystem = true;
      expect(vehicle.calculateCost(carBuilder.baseCost), 6000);

      vehicle.transmission = true;
      expect(vehicle.calculateCost(carBuilder.baseCost), 7500);

      vehicle.audioSystem = false;
      expect(vehicle.calculateCost(carBuilder.baseCost), 6500);

      //Comprobamos que el director ha construido la moto con los valores por defecto
      director = VehicleDirector(motorcycleBuilder);
      director.constructVehicle();
      expect(director.builder, motorcycleBuilder);

      vehicle = director.builder.getVehicle();

      expect(vehicle.engine, "Diesel");
      expect(vehicle.wheels, 2);
      expect(vehicle.audioSystem, false);
      expect(vehicle.transmission, false);

      expect(vehicle.calculateCost(motorcycleBuilder.baseCost), 3000);

      vehicle.audioSystem = true;
      expect(vehicle.calculateCost(motorcycleBuilder.baseCost), 4000);

      vehicle.transmission = true;
      expect(vehicle.calculateCost(motorcycleBuilder.baseCost), 5500);

      vehicle.audioSystem = false;
      expect(vehicle.calculateCost(motorcycleBuilder.baseCost), 4500);

      //Comprobamos que el director ha construido el camión con los valores por defecto
      director = VehicleDirector(truckBuilder);
      director.constructVehicle();
      expect(director.builder, truckBuilder);

      vehicle = director.builder.getVehicle();

      expect(vehicle.engine, "Gasolina");
      expect(vehicle.wheels, 6);
      expect(vehicle.audioSystem, false);
      expect(vehicle.transmission, false);

      expect(vehicle.calculateCost(truckBuilder.baseCost), 10000);

      vehicle.audioSystem = true;
      expect(vehicle.calculateCost(truckBuilder.baseCost), 11000);

      vehicle.transmission = true;
      expect(vehicle.calculateCost(truckBuilder.baseCost), 12500);

      vehicle.audioSystem = false;
      expect(vehicle.calculateCost(truckBuilder.baseCost), 11500);
    });

    testWidgets('Alerta cuando no se selecciona tipo de motor', (WidgetTester tester) async {
      // Crea el widget y añádelo al árbol de widgets.
      await tester.pumpWidget(const MyApp());

      // Llega a la pantalla donde se selecciona el motor.
      // Suponiendo que la acción para construir el vehículo se activa mediante un botón.
      await tester.tap(find.text('Construir'));
      await tester.pump(); // Reconstruye el widget después de que el estado cambie (simulación de frame).

      // Verifica que la alerta de tipo de motor se muestra.
      expect(find.text('Introducide que tipo de motor(diesel / gasolina).'), findsOneWidget);
    });
  });

  group ('Gestor de Vehiculos', (){

    test('GestorVehiculos Test', () {
      // Crear una instancia de GestorVehiculos
      final gestor = GestorVehiculos();

      // Agregar varios vehículos a GestorVehiculos
      final vehicle1 = Vehicle();
      vehicle1.tipo = 'Coche';
      vehicle1.engine = 'Gasolina';

      final vehicle2 = Vehicle();
      vehicle2.tipo = 'Moto';
      vehicle2.engine = 'Gasolina';

      final vehicle3 = Vehicle();
      vehicle3.tipo = 'Camion';
      vehicle3.engine = 'Diesel';

      gestor.agregarVehiculo(vehicle1);
      gestor.agregarVehiculo(vehicle2);
      gestor.agregarVehiculo(vehicle3);

      // Verificar que el número de vehículos en GestorVehiculos
      expect(gestor.vehiculos.length, 3);

      // Eliminar un vehículo
      gestor.eliminarVehiculo(vehicle2);

      // Verificar que el número de vehículos en GestorVehiculos haya disminuido en uno
      expect(gestor.vehiculos.length, 2);

      // Agregar otro vehículo a GestorVehiculos
      final vehicle4 = Vehicle();
      vehicle4.tipo = 'Coche';
      vehicle4.engine = 'Diesel';

      gestor.agregarVehiculo(vehicle4);

      // Verificar que el número de vehículos en GestorVehiculos sea igual al número esperado
      expect(gestor.vehiculos.length, 3);

      // Verificar que el orden de los vehículos en GestorVehiculos sea el esperado
      expect(gestor.vehiculos, [vehicle1, vehicle3, vehicle4]);
    });

    test('Pintura Marcada Test', () {
      Vehicle vehiclePintado = Vehicle();
      vehiclePintado.color = true; // Marca la pintura en este vehículo

      Vehicle vehicleNoPintado = Vehicle();
      vehicleNoPintado.color = false; // No marca la pintura en este vehículo

      bool estaPintado1 = vehiclePintado.color;
      bool estaPintado2 = vehicleNoPintado.color;

      expect(estaPintado1, true); // Verifica que la pintura esté marcada en el primer vehículo
      expect(estaPintado2, false); // Verifica que la pintura no esté marcada en el segundo vehículo
    });

    test('Obtener vehiculo con gestor de tareas', () {
      final gestor = GestorVehiculos();

      final moto = Vehicle();
      moto.audioSystem = true;
      moto.tipo = "Moto";
      moto.engine = "gasolina";
      moto.wheels = 2;

      final coche = Vehicle();
      coche.transmission = true;
      coche.tipo = "Coche";
      coche.engine = "diesel";
      coche.wheels = 4;

      List<Vehicle> lista = [];
      lista.add(moto);
      lista.add(coche);

      gestor.agregarVehiculo(moto);
      gestor.agregarVehiculo(coche);
      gestor.obtenerVehiculos();

      expect(gestor.obtenerVehiculos(), lista);

      final obtenidos = gestor.obtenerVehiculos().length;
      expect(obtenidos, 2);

    });

    test('Eliminar vehiculo con gestor de tareas', () {
      final gestor = GestorVehiculos();

      final camion = Vehicle();
      camion.audioSystem = true;
      camion.tipo = "Camion";
      camion.engine = "gasolina";
      camion.wheels = 6;

      final moto = Vehicle();
      moto.transmission = true;
      moto.tipo = "Moto";
      moto.engine = "diesel";
      moto.wheels = 2;

      final coche = Vehicle();
      coche.audioSystem = true;
      coche.tipo = "Coche";
      coche.engine = "gasolina";
      coche.wheels = 4;

      List<Vehicle> lista = [];
      lista.add(moto);
      lista.add(coche);
      lista.add(camion);

      gestor.agregarVehiculo(moto);
      gestor.agregarVehiculo(coche);
      gestor.agregarVehiculo(camion);

      expect(gestor.obtenerVehiculos().length, 3);

      gestor.eliminarVehiculo(moto);
      lista.removeAt(0);

      expect(gestor.obtenerVehiculos().length, 2);
      expect(gestor.obtenerVehiculos(), lista);

    });

    test('Crear un coche completo sin pintura', () {
      VehicleBuilder builder = new CarBuilder(baseCost: 5000);
      builder.buildEngine("gasolina");
      builder.buildTransmission(true);
      builder.buildAudioSystem(true);

      VehicleDirector director = new VehicleDirector(builder);
      director.constructVehicle();
      Vehicle vehiculo = builder.getVehicle();
      vehiculo.color = false;

      expect(vehiculo.wheels, 4);
      expect(vehiculo.engine, "gasolina");
      expect(vehiculo.color, false);
      expect(vehiculo.transmission, true);
      expect(vehiculo.audioSystem, true);
      expect(vehiculo.calculateCost(builder.baseCost), 7500);
      print("");
    });

    test('Crear un coche completo con pintura azul', () {
      VehicleBuilder builder = new CarBuilder(baseCost: 5000);
      builder.buildEngine("gasolina");
      builder.buildTransmission(true);
      builder.buildAudioSystem(true);

      VehicleDirector director = new VehicleDirector(builder);
      director.constructVehicle();
      Vehicle vehiculo = builder.getVehicle();

      vehiculo.color = true;
      Strategy estrategia = ColorAzul();
      vehiculo.setStrategy(estrategia);
      vehiculo.buildColor();

      expect(vehiculo.wheels, 4);
      expect(vehiculo.engine, "gasolina");
      expect(vehiculo.color, true);
      expect(vehiculo.color_vehicle, "azul");
      expect(vehiculo.transmission, true);
      expect(vehiculo.audioSystem, true);
      expect(vehiculo.calculateCost(builder.baseCost), 8000);
      print("");
    });
  });
}
