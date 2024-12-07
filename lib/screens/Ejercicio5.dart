import '../logic/Prime_number_calculator.dart';
import 'package:flutter/material.dart';

class PrimeSearcherScreen extends StatefulWidget {
  const PrimeSearcherScreen({super.key});

  @override
  State<PrimeSearcherScreen> createState() => PrimeSearcherScreenState();
}

class PrimeSearcherScreenState extends State<PrimeSearcherScreen> {
  // Controller
  final PrimeNumberCalculator primeNumberCalculator = PrimeNumberCalculator();

  List<int>? primes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generador de números primos"),
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
            const Text(
              "Generador de números primos entre 3 y 32767",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: findPrimeNumbers,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 45, 105, 99),
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                "Generar números primos",
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 20.0),
            if (primes != null && primes!.isNotEmpty)
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Scrollbar(
                    thumbVisibility: true, // Hace visible el scroll
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        primes!.join(", "),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Color.fromARGB(255, 45, 105, 99),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void findPrimeNumbers() {
    setState(() {
      primes = primeNumberCalculator.generatePrimes(3, 32767);
    });
  }
}
