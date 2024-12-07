import '../logic/MCD_calculator.dart';
import 'package:flutter/material.dart';

class InsertMCDScreen extends StatefulWidget {
  const InsertMCDScreen({super.key});

  @override
  State<InsertMCDScreen> createState() => _InsertMCDScreenState();
}

class _InsertMCDScreenState extends State<InsertMCDScreen> {
  // Declarar controladores
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  String? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calcular MCD",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 58, 183, 64),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 68, 183, 58),
              Color.fromARGB(255, 64, 76, 251)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Ingrese dos números",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 73, 183, 58),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildInputField("Número 1", _number1Controller),
                  const SizedBox(height: 15),
                  _buildInputField("Número 2", _number2Controller),
                  const SizedBox(height: 15),
                  if (_result != null)
                    Text(
                      "El MCD es: $_result",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      int num1 =
                          int.tryParse(_number1Controller.text.trim()) ?? 0;
                      int num2 =
                          int.tryParse(_number2Controller.text.trim()) ?? 0;

                      if (num1 > 0 && num2 > 0) {
                        int mcd = calcularMCD(num1, num2);
                        setState(() {
                          _result = mcd.toString();
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Por favor ingrese números válidos."),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 25, 134, 43)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                      ),
                    ),
                    child: const Text(
                      "Calcular MCD",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Construye un campo de entrada
  Widget _buildInputField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 58, 183, 64)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromARGB(255, 58, 183, 64)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 64, 83, 251), width: 2),
        ),
        prefixIcon: const Icon(
          Icons.numbers,
          color: Color.fromARGB(255, 58, 183, 64),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 230, 245, 229),
      ),
    );
  }
}
