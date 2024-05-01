import 'package:flutter/material.dart';
import 'Vehicle.dart';
import 'VehicleBuilder.dart';
import 'VehicleDirector.dart';
import 'CarBuilder.dart';
import 'MotorcycleBuilder.dart';
import 'TruckBuilder.dart';
import 'GestorVehiculos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Configurador de vehículos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _gasolina = false , _diesel = false, _pintar = false , _transmision = false , _radio = false;
  String _type = 'predeterminado';
  Color _color = Colors.white;
  List<Color> colores = [Colors.red, Colors.blue, Colors.green];
  late VehicleBuilder b;
  GestorVehiculos gestor = GestorVehiculos();

  void _iniciarAtributos(){
    _gasolina = false ; _diesel = false;
    _pintar = false ;
    _transmision = false ;
    _radio = false;
    _type = '';
    _color = Colors.white;
  }

  void _showAlert_Motor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alerta"),
          content: Text("Introducide que tipo de motor(diesel / gasolina)."),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAttributesDialog(BuildContext context, Vehicle vehicle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Atributos del vehículo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Tipo de vehículo: $_type'),
                Text("Tipo de motor: " + vehicle.engine),
                SwitchListTile(
                  title: const Text('¿Pintar el vehículo?',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  value: _pintar,
                  onChanged: (bool value) {
                    setState(() {
                      _pintar = value;
                    });
                    Navigator.of(context).pop();
                    _showAttributesDialog(context, vehicle);
                  },
                ),
                if (_pintar) Wrap(
                  children: colores.map((color) {
                    bool isSelected = color == _color;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _color = color;
                          vehicle.color = true;
                          if(_color == Colors.green){
                            vehicle.color_vehicle = "Verde";
                          }else if(_color == Colors.blue){
                            vehicle.color_vehicle = "Azul";
                          }else if(_color == Colors.red){
                            vehicle.color_vehicle = "Rojo";
                          }

                        });
                        Navigator.of(context).pop();
                        _showAttributesDialog(context, vehicle);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? Colors.black : Colors.transparent,
                            width: 2.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: color,
                          radius: 15.0,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                if(vehicle.transmission)
                  Text("Transmisión personalizada"),
                if(vehicle.audioSystem)
                  Text("Sistema de audio personalizado"),
                Text("Coste de tu vehiculo: " + vehicle.calculateCost(b.baseCost).toString()),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  vehicle.tipo = _type;
                  gestor.agregarVehiculo(vehicle);
                  _iniciarAtributos();
                });
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
            ElevatedButton(
              onPressed: () {
                _iniciarAtributos();
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          Row(
              children: <Widget>[
                const Text(
                  '1.Por favor, elija el tipo de vehículo   ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _type = 'Coche';
                        b = new CarBuilder(baseCost: 5000);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _type == 'Coche' ? Colors.purple[200] : Colors.white,
                    ),
                    child: Text('Coche'),
                  ),
                ),
                SizedBox(width: 8.0), // Espacio entre botones
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _type = 'Moto';
                        b = new MotorcycleBuilder(baseCost: 2500);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _type == 'Moto' ? Colors.purple[200] : Colors.white,
                    ),
                    child: Text('Moto'),
                  ),
                ),
                SizedBox(width: 8.0), // Espacio entre botones
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _type = 'Camion';
                        b = new TruckBuilder(baseCost: 10000);
                      });
                    },
                    child: Text('Camión'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _type == 'Camion' ? Colors.purple[200] : Colors.white,
                    ),
                  ),
                ),
              ]
          ),
          const SizedBox(height: 10),
          Row(
              children: <Widget>[
                const Text(
                  '2.¿Qué motor tiene su vehículo?   ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Text(
                  'Gasolina',
                ),
                IconButton(
                  icon: _gasolina ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
                  onPressed: () {
                    setState(() {
                      _gasolina = true;
                      _diesel = false;
                      if(_gasolina)
                        b?.buildEngine("Gasolina");
                    });
                  },
                ),
                SizedBox(width: 8.0), // Espacio entre botones
                const Text(
                    'Diesel'
                ),
                IconButton(
                  icon: _diesel ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
                  onPressed: () {
                    setState(() {
                      _gasolina = false;
                      _diesel = true;
                      if(!_gasolina)
                        b?.buildEngine("Diesel");
                    });
                  },
                ),
              ]
          ),
          const SizedBox(height: 10),
          Row(
              children: <Widget>[
                const Text(
                  '4.¿Desea personalizar la transmisión?  ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: _transmision ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
                  onPressed: () {
                    setState(() {
                      _transmision = !_transmision;
                      b?.buildTransmission(_transmision);
                    });
                  },
                ),
              ]
          ),
          const SizedBox(height: 10),
          Row(
              children: <Widget>[
                const Text(
                  '5.¿Desea personalizar el sistema de audio?  ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: _radio ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
                  onPressed: () {
                    setState(() {
                      _radio = !_radio;
                      b?.buildAudioSystem(_radio);
                    });
                  },
                ),
              ]
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if(_diesel || _gasolina) {
                        VehicleDirector d = new VehicleDirector(b);
                        d.constructVehicle();
                        Vehicle v = b.getVehicle();
                        _showAttributesDialog(context, v);
                      } else {
                        _showAlert_Motor();
                      }
                    },
                    child: Text('Construir'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: gestor.vehiculos.length,

              itemBuilder: (context, index) {
                final vehicle = gestor.vehiculos[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Color de la sombra
                        spreadRadius: 5, // Extensión de la sombra
                        blurRadius: 7, // Desenfoque de la sombra
                        offset: Offset(0, 3), // Desplazamiento horizontal y vertical de la sombra
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                      children: <Widget>[

                        Expanded(
                          child: Text(vehicle.toString()),
                        ),

                        //Boton para eliminar vehiculo
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              gestor.eliminarVehiculo(vehicle);
                            });
                          },
                        ),
                      ]
                  ),
                );
              },
            ),
          ),
        ],


      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
