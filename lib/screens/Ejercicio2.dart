import '../logic/Factorial_calculator.dart';
import 'package:flutter/material.dart';

class FactorialScreen extends StatefulWidget {
  const FactorialScreen({super.key});

  @override
  State<FactorialScreen> createState() => FactorialScreenState();
}

class FactorialScreenState extends State<FactorialScreen>{
//controller

  final TextEditingController _numberController = TextEditingController();

  //factorial calculator
  final FactorialCalculator factorialCalculator = FactorialCalculator();

  
// Resultado del cálculo
  int? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de Factorial"),
        backgroundColor: const Color.fromARGB(255, 45, 105, 99),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 141, 198, 192),
              Color.fromARGB(255, 89, 148, 144),
              Color.fromARGB(255, 45, 105, 99),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.9),
                hintText: "Ingrese un número",
                prefixIcon: const Icon(Icons.calculate, color: Colors.teal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calculateFactorial,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 45, 105, 99),
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                "Calcular Factorial",
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
                
              ),
            ),
            const SizedBox(height: 20.0),
            if (_result != null)
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  "El factorial es: $_result",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 45, 105, 99),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void calculateFactorial() {
    final input = _numberController.text;
    if (input.isNotEmpty) {
      final number = int.tryParse(input);
      if (number != null && number >= 0) {
        setState(() {
          _result = factorialCalculator.calculateFactorial(number);
        });
      } else {
        _showErrorDialog("Por favor, ingrese un número válido.");
      }
    } else {
      _showErrorDialog("El campo no puede estar vacío.");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}



