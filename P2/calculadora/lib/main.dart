// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:calculadora/Operaciones/Operacion.dart';
import 'package:flutter/material.dart';

import 'Operaciones/Suma.dart';
import 'Operaciones/Resta.dart';
import 'Operaciones/Multiplicacion.dart';
import 'Operaciones/Division.dart';
import 'Operaciones/Modulo.dart';
import 'Operaciones/Potencia.dart';
import 'Operaciones/Raiz.dart';
import 'Operaciones/Porcentaje.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String num1 = "";
  String num2 = "";
  String operacion = "";
  String resultado_str = "";

  double primer_valor = 0;
  double segundo_valor = 0;

  void calcular_operacion(){
    setState(() {
      double resultado = 0;

      if (num1[0] == "N"){
        num1 = num1.substring(1);
        num1 = "-$num1";
      }

      if (num2[0] == "N"){
        num2 = num2.substring(1);
        num2 = "-$num2";
      }

      primer_valor = double.parse(num1);
      segundo_valor = double.parse(num2);

      switch(operacion){
        case '+':
          Operacion suma = Suma();
          resultado = suma.calculate(primer_valor, segundo_valor);
          break;
        case '-':
          Operacion resta = Resta();
          resultado = resta.calculate(primer_valor, segundo_valor);
          break;
        case '*':
          Operacion multiplicacion = Multiplicacion();
          resultado = multiplicacion.calculate(primer_valor, segundo_valor);
          break;
        case '/':
          Operacion division = Division();
          resultado = division.calculate(primer_valor, segundo_valor);
          break;
        case '&':
          Operacion modulo = Modulo();
          resultado = modulo.calculate(primer_valor, segundo_valor);
          break;
        case '^':
          Operacion potencia = Potencia();
          resultado = potencia.calculate(primer_valor, segundo_valor);
          break;
        case '√':
          Operacion raiz = Raiz();
          resultado = raiz.calculate(primer_valor, segundo_valor);
          break;
        case '%':
          Operacion porcentaje = Porcentaje();
          resultado = porcentaje.calculate(primer_valor, segundo_valor);
          break;
      }

      resultado_str = resultado.toString();

      num1 = "";
      num2 = "";
      operacion = "";
    });
  }

  void agregar_numero(String num){
    setState(() {
      resultado_str = "";

      if (operacion == ""){
        num1 += num;
      }
      else{
        num2 += num;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center( //Se encarga de centrar el título
          child: Text(widget.title),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//Contenedor que muestra los valores seleccionados
            Container(
              width: 320,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child:Text(
                '$num1 $operacion $num2 $resultado_str',
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
//Primera fila
          Container(
            width: 320,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          num1 = "";
                          num2 = "";
                          operacion = "";
                          resultado_str = "";
                        });
                      },
                      // Aquí va la función que se ejecutará cuando se presione el botón
                      child: const Text(
                          'AC',
                          style: TextStyle(
                            fontSize: 24,
                          )
                      ),
                    ),
                  ),

                  const SizedBox(width: 10, height: 50),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        operacion = "&";
                      });
                    },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '&',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        operacion = "/";
                      });
                    },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '/',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        if (num2 != ""){
                          num2 = num2.substring(0, num2.length-1);
                        }
                        else if (operacion != "") {
                          operacion = operacion.substring(0, operacion.length - 1);
                        }
                        else if (num1 != ""){
                          num1 = num1.substring(0, num1.length-1);
                        }
                      });
                    },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        'DEL',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),
                ]
            ),
          ),

//Segunda fila
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () { agregar_numero("7"); },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '7',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10, height: 80,),
                  FloatingActionButton(
                    onPressed: () { agregar_numero("8"); },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '8',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () { agregar_numero("9"); },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '9',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        operacion = "*";
                      });
                    },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '*',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        operacion = "%";
                      });
                    },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '%',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),
                ]
            ),
//Tercera fila
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () { agregar_numero("4"); },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '4',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () { agregar_numero("5"); },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '5',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () { agregar_numero("6"); },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '6',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        operacion = "-";
                      });
                    },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '-',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        operacion = "^";
                      });
                    },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '^',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),
                ]
            ),
//Cuarta fila
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () { agregar_numero("1"); },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '1',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10, height: 80,),
                  FloatingActionButton(
                    onPressed: () { agregar_numero("2"); },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '2',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () { agregar_numero("3"); },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '3',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        operacion = "+";
                      });
                    },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        operacion = "√";
                      });
                    },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '√',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),
                ]
            ),
//Quinta fila
            Container(
              width: 320,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () { agregar_numero("N"); },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        'N',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () { agregar_numero("0"); },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '0',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        if (!num1.contains('.') && operacion == ""){
                          num1 += ".";
                        }

                        if (!num2.contains('.') && num2 != ""){
                          num2 += ".";
                        }
                      });
                    },
                    // Aquí va la función que se ejecutará cuando se presione el botón
                    child: const Text(
                        '.',
                        style: TextStyle(
                          fontSize: 24,
                        )
                    ),
                  ),

                  const SizedBox(width: 10),
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () { calcular_operacion(); },
                      // Aquí va la función que se ejecutará cuando se presione el botón
                      child: const Text(
                          '=',
                          style: TextStyle(
                            fontSize: 24,
                          )
                      ),
                    ),
                  ),

                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
