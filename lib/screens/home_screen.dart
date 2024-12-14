import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // El parámetro 'key' se pasa como superparameter.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MTDev Planificador de Comidas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bienvenida a tu planificador de comidas',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                developer.log('Botón "Empezar" pulsado'); // Sustituye print.
              },
              child: const Text('Empezar'),
            ),
          ],
        ),
      ),
    );
  }
}
