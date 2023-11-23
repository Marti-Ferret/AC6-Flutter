import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculadoraIOS extends StatefulWidget {
  @override
  _CalculadoraIOSState createState() => _CalculadoraIOSState();
}

class _CalculadoraIOSState extends State<CalculadoraIOS> {

  String text = '0'; // Definir la variable text
  String result = '';
  String finalResult = '';
  double primerNumero = 0;
  double segonNumero = 0;
  String simbolo = '';

  Widget btnZero(String btnText, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: ElevatedButton(
        onPressed: () {
          calcular(btnText);
        },
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
          shape: StadiumBorder(),
        ),
      ),
    );
  }


  Widget btn(String btnText, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: ElevatedButton(
        onPressed: () {
          calcular(btnText);
        },
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.all(20.0),
          shape: CircleBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
              Expanded(
                child:Container(
                  padding: EdgeInsets.only(right: 20.0),
                    child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 90.00,
                    color: Colors.white,

                  ),
                  textAlign: TextAlign.right,
                ),
              )
              ),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('AC', Colors.grey),
                btn('+/-', Colors.grey),
                btn('%', Colors.grey),
                btn('/', Colors.orange),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('7',Colors.grey),
                btn('8',Colors.grey),
                btn('9',Colors.grey),
                btn('x',Colors.orange),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('4',Colors.grey),
                btn('5',Colors.grey),
                btn('6',Colors.grey),
                btn('-',Colors.orange),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('1',Colors.grey),
                btn('2',Colors.grey),
                btn('3',Colors.grey),
                btn('+',Colors.orange),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btnZero('0',Colors.grey),
                btn(',',Colors.grey),
                btn('=',Colors.orange),
              ],),
          ],
        ),
      ),
    );
  }

void calcular(btnText){
  if(btnText == 'AC'){
    text = '0';
    result = '';
    finalResult = '';
  }else if(btnText == '+/-'){
    if(double.parse(finalResult) > 0){
      finalResult = '-' + finalResult;
    }
  } else if (btnText == '%'){
    double temp = double.parse(finalResult);
    temp = temp / 100;
    finalResult = temp.toString();
  }else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/'){
    primerNumero = double.parse(finalResult);
    finalResult = '';
    simbolo = btnText;
  }else if(btnText == '='){
    segonNumero = double.parse(finalResult);
    if(simbolo == '+'){

      finalResult = suma(primerNumero,segonNumero);

    }else if(simbolo == '-'){
      finalResult = resta(primerNumero,segonNumero);
    }else if(simbolo == 'x'){
      finalResult = multiplicacion(primerNumero,segonNumero);
    }else if(simbolo == '/'){
      finalResult = division(primerNumero,segonNumero);
    }
  }
  else{
    finalResult  = finalResult + btnText;
  }


  setState(() {
    if(finalResult != ''){
      text = finalResult;
    }
  });
}

  String suma(double primerNumero, double segonNumero){
    return (primerNumero + segonNumero).toString();
  }
  String resta(double primerNumero, double segonNumero){
    return (primerNumero - segonNumero).toString();
  }
  String multiplicacion(double primerNumero, double segonNumero){
    return (primerNumero * segonNumero).toString();
  }
  String division(double primerNumero, double segonNumero){
    return (primerNumero / segonNumero).toString();
  }
}


