import 'package:flutter_test/flutter_test.dart';

import '../lib/CarBuilder.dart';
import '../lib/ColorAzul.dart';
import '../lib/GestorVehiculos.dart';
import '../lib/MotorcycleBuilder.dart';
import '../lib/Strategy.dart';
import '../lib/TruckBuilder.dart';
import '../lib/Vehicle.dart';
import '../lib/VehicleBuilder.dart';
import '../lib/VehicleDirector.dart';


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
      if (vehicle.wheels != null) {
        vehicle.wheels = (vehicle.wheels! - 1);
        expect(vehicle.wheels, 3);

        // Se le ha cambiado la rueda pinchada
        vehicle.wheels = (vehicle.wheels! + 1);
        expect(vehicle.wheels, 4);

      }

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
      if (vehicle.wheels != null) {
        vehicle.wheels = (vehicle.wheels! - 1);
        expect(vehicle.wheels, 1);

        // Se le ha cambiado la rueda pinchada
        vehicle.wheels = (vehicle.wheels! + 1);
        expect(vehicle.wheels, 2);

      }

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
      if (vehicle.wheels != null) {
        vehicle.wheels = (vehicle.wheels! - 1);
        expect(vehicle.wheels, 5);

        // Se le ha cambiado la rueda pinchada
        vehicle.wheels = (vehicle.wheels! + 1);
        expect(vehicle.wheels, 6);

      }

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

  group ('For de Vehiculos', (){

    test('GestorVehiculos Test', () {
      // Crear una instancia de GestorVehiculos
      final gestor = GestorVehiculos([]);

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

      gestor.vehiculos.add(vehicle1);
      gestor.vehiculos.add(vehicle2);
      gestor.vehiculos.add(vehicle3);
      
      // Verificar que el número de vehículos en GestorVehiculos
      expect(gestor.vehiculos.length, 3);

      // Eliminar un vehículo
      gestor.vehiculos.remove(vehicle2);

      // Verificar que el número de vehículos en GestorVehiculos haya disminuido en uno
      expect(gestor.vehiculos.length, 2);

      // Agregar otro vehículo a GestorVehiculos
      final vehicle4 = Vehicle();
      vehicle4.tipo = 'Coche';
      vehicle4.engine = 'Diesel';

      gestor.vehiculos.add(vehicle4);

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

      bool estaPintado1 = vehiclePintado.color!;
      bool estaPintado2 = vehicleNoPintado.color!;

      expect(estaPintado1, true); // Verifica que la pintura esté marcada en el primer vehículo
      expect(estaPintado2, false); // Verifica que la pintura no esté marcada en el segundo vehículo
    });

    test('Gestor vehiculo con gestor de vehiculos', () async {
      final gestor = GestorVehiculos([]);

      VehicleBuilder moto = MotorcycleBuilder(baseCost: 3000);
      var usuario = "Adri";
      moto.buildEngine("gasolina");
      moto.buildAudioSystem(true);
      moto.buildTransmission(true);

      VehicleDirector d = new VehicleDirector(moto);
      d.constructVehicle();
      Vehicle vehiculoMoto = moto.getVehicle();
      vehiculoMoto.usuario = usuario;

      List<Vehicle> lista = [];
      lista.add(vehiculoMoto);

      await gestor.agregarVehiculo(vehiculoMoto);

      expect(gestor.vehiculos.first.tipo, lista.first.tipo);
      expect(gestor.vehiculos.first.engine, lista.first.engine);
      expect(gestor.vehiculos.first.audioSystem, lista.first.audioSystem);
      expect(gestor.vehiculos.first.transmission, lista.first.transmission);
      expect(gestor.vehiculos.first.color, lista.first.color);
      expect(gestor.vehiculos.first.color_vehicle, lista.first.color_vehicle);


      expect(gestor.vehiculos.length, 1);

    });

    test('Eliminar vehiculo con gestor de vehiculos', () async{
      final gestor = GestorVehiculos([]);

      VehicleBuilder moto = MotorcycleBuilder(baseCost: 3000);
      var usuario = "Adri";
      moto.buildEngine("gasolina");
      moto.buildAudioSystem(true);
      moto.buildTransmission(true);

      VehicleDirector d = new VehicleDirector(moto);
      d.constructVehicle();
      Vehicle vehiculoMoto = moto.getVehicle();
      vehiculoMoto.usuario = usuario;

      List<Vehicle> lista = [];
      lista.add(vehiculoMoto);

      await gestor.agregarVehiculo(vehiculoMoto);

      expect(gestor.vehiculos.first.tipo, lista.first.tipo);
      expect(gestor.vehiculos.first.engine, lista.first.engine);
      expect(gestor.vehiculos.first.audioSystem, lista.first.audioSystem);
      expect(gestor.vehiculos.first.transmission, lista.first.transmission);
      expect(gestor.vehiculos.first.color, lista.first.color);
      expect(gestor.vehiculos.first.color_vehicle, lista.first.color_vehicle);


      expect(gestor.vehiculos.length, 1);

      await gestor.eliminarVehiculo(gestor.vehiculos.first);

      expect(gestor.vehiculos.length, 0);
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

    test('Update de coche con gestor de vehiculos', () async {
      final gestor = GestorVehiculos([]);

      VehicleBuilder moto = MotorcycleBuilder(baseCost: 3000);
      var usuario = "Adri";
      moto.buildEngine("gasolina");
      moto.buildAudioSystem(true);
      moto.buildTransmission(true);

      VehicleDirector d = new VehicleDirector(moto);
      d.constructVehicle();
      Vehicle vehiculoMoto = moto.getVehicle();
      Vehicle vehiculoMotoRoja = moto.getVehicle();
      vehiculoMoto.usuario = usuario;
      vehiculoMotoRoja.usuario = usuario;


      await gestor.agregarVehiculo(vehiculoMoto);
      String color = "Blanco por defecto";

      expect(gestor.vehiculos.first.color_vehicle, color);


      gestor.vehiculos.first.color = true;

      late Strategy estrategia;
      estrategia = ColorAzul();

      gestor.vehiculos.first.setStrategy(estrategia);
      gestor.vehiculos.first.buildColor();

      await gestor.actualizarVehiculo(gestor.vehiculos.first);

      expect(gestor.vehiculos.first.color_vehicle, "azul");


    });

    test('Cargar Vehiculos con gestor de vehiculos', () async {
      final gestor = GestorVehiculos([]);

      VehicleBuilder moto = MotorcycleBuilder(baseCost: 3000);
      var usuario = "testUser";
      moto.buildEngine("gasolina");
      moto.buildAudioSystem(true);
      moto.buildTransmission(true);

      VehicleDirector d = new VehicleDirector(moto);
      d.constructVehicle();
      Vehicle vehiculoMoto = moto.getVehicle();
      vehiculoMoto.usuario = usuario;

      VehicleBuilder coche = CarBuilder(baseCost: 3000);

      coche.buildEngine("gasolina");
      coche.buildAudioSystem(true);
      coche.buildTransmission(false);

      d = new VehicleDirector(coche);
      d.constructVehicle();
      Vehicle vehiculoCoche = coche.getVehicle();
      vehiculoCoche.usuario = usuario;


      await gestor.agregarVehiculo(vehiculoMoto);
      
      await gestor.cargarVehiculos(usuario);

      expect(gestor.vehiculos.length, 1);
      
      await gestor.eliminarVehiculo(gestor.vehiculos.first);


    });
  });
});
}
