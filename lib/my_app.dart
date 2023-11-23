import 'package:ac6/my_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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