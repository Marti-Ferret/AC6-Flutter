import 'package:flutter/material.dart';

void main() => runApp(CalculadoraIOSApp());

class CalculadoraIOSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora iOS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculadoraIOS(),
    );
  }
}

class CalculadoraIOS extends StatefulWidget {
  @override
  _CalculadoraIOSState createState() => _CalculadoraIOSState();
}

class _CalculadoraIOSState extends State<CalculadoraIOS> {
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
      child: GestureDetector(
        onTap: () {
          _presionarBoton(valor);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
          margin: EdgeInsets.all(8.0),
          child: Text(
            valor == "0" ? "0" : valor,  // Ajusta el contenido del número 0
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          width: valor == "0" ? 300.0 : null,  // Ajusta el ancho del número 0
          height: valor == "0" ? 200.0 : null,  // Ajusta el alto del número 0
        ),
      ),
    );
  }

  Widget _construirBotonNaranja(String valor) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _presionarBoton(valor);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange[200],
          ),
          margin: EdgeInsets.all(8.0),
          child: Text(
            valor == "0" ? "0" : valor,  // Ajusta el contenido del número 0
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          width: valor == "0" ? 80.0 : null,  // Ajusta el ancho del número 0
          height: valor == "0" ? 100.0 : null,  // Ajusta el alto del número 0
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora iOS'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(16.0),
            child: Text(
              _output,
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  _construirBoton("AC"),
                  _construirBoton("+/-"),
                  _construirBoton("%"),
                  _construirBotonNaranja("/"),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  _construirBoton("7"),
                  _construirBoton("8"),
                  _construirBoton("9"),
                  _construirBotonNaranja("x"),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  _construirBoton("4"),
                  _construirBoton("5"),
                  _construirBoton("6"),
                  _construirBotonNaranja("-"),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  _construirBoton("1"),
                  _construirBoton("2"),
                  _construirBoton("3"),
                  _construirBotonNaranja("+"),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  _construirBoton("0"),
                  _construirBoton(","),
                  _construirBotonNaranja("="),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
