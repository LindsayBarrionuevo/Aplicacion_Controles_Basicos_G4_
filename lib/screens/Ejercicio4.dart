import 'package:flutter/material.dart';

class Ejercicio4 extends StatefulWidget {
  const Ejercicio4({super.key});

  @override
  State<Ejercicio4> createState() => _Ejercicio4State();
}

class _Ejercicio4State extends State<Ejercicio4> {
  final TextEditingController _numberController = TextEditingController();
  String _result = "";

  List<int> _calculateFactors(int number) {
    List<int> factors = [];
    for (int i = 1; i <= number; i++) {
      if (number % i == 0) {
        factors.add(i);
      }
    }
    return factors;
  }

  void _findFactors() {
    final input = _numberController.text;
    if (input.isNotEmpty) {
      final number = int.tryParse(input);
      if (number != null && number > 0) {
        final factors = _calculateFactors(number);
        setState(() {
          _result = "Factores de $number: ${factors.join(", ")}";
        });
      } else {
        setState(() {
          _result = "Por favor, introduce un número entero positivo.";
        });
      }
    } else {
      setState(() {
        _result = "La entrada está vacía. Ingresa un número.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 4: Factores de un Número"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Introduce un número entero para encontrar sus factores:",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Número",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.calculate),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _findFactors,
              child: const Text("Calcular Factores"),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
