import 'package:flutter/material.dart';



class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _output = "0";
  String _num1 = "";
  String _num2 = "";
  String _operador = "";
  double _resultado = 0.0;

  void _presionarBoton(String valor) {
    if (valor == "C") {
      _limpiar();
    } else if (valor == "+" || valor == "-" || valor == "x" || valor == "/") {
      _num1 = _output;
      _operador = valor;
      _output = "0";
    } else if (valor == "=") {
      _num2 = _output;
      _realizarOperacion();
    } else {
      if (_output == "0") {
        _output = valor;
      } else {
        _output += valor;
      }
    }

    setState(() {
      _output = _output;
    });
  }

  void _limpiar() {
    _output = "0";
    _num1 = "";
    _num2 = "";
    _operador = "";
    _resultado = 0.0;
  }

  void _realizarOperacion() {
    double num1 = double.parse(_num1);
    double num2 = double.parse(_num2);

    switch (_operador) {
      case "+":
        _resultado = num1 + num2;
        break;
      case "-":
        _resultado = num1 - num2;
        break;
      case "x":
        _resultado = num1 * num2;
        break;
      case "/":
        _resultado = num1 / num2;
        break;
      default:
        _resultado = 0.0;
    }

    _output = _resultado.toString();
    _num1 = "";
    _num2 = "";
    _operador = "";
  }

  Widget _construirBoton(String valor) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        onPressed: () {
          _presionarBoton(valor);
        },
        child: Text(
          valor,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _construirBoton("7"),
                    _construirBoton("8"),
                    _construirBoton("9"),
                    _construirBoton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _construirBoton("4"),
                    _construirBoton("5"),
                    _construirBoton("6"),
                    _construirBoton("x"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _construirBoton("1"),
                    _construirBoton("2"),
                    _construirBoton("3"),
                    _construirBoton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _construirBoton("C"),
                    _construirBoton("0"),
                    _construirBoton("="),
                    _construirBoton("+"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
