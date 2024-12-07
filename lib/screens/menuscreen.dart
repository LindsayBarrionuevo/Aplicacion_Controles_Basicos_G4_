import 'package:flutter/material.dart';
import '../models/activitymenu.dart';
import './Ejercicio1.dart';
import './Ejercicio2.dart';
import './Ejercicio3.dart';
import './Ejercicio4.dart';
import './Ejercicio5.dart';


class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final Map<int, Widget> exerciseScreens = {
    1: const ascii_ej1(),
    2: const FactorialScreen(),
    3: const InsertMCDScreen(),
    //4: Ejercicio4(),
    5: const PrimeSearcherScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicios Propuestos"),
        backgroundColor: Colors.white60,
      ),
      backgroundColor: const Color.fromARGB(255, 154, 198, 185),
      body: Container(

        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 121, 108),
              Color.fromARGB(255, 103, 146, 134),
              Color.fromARGB(255, 154, 198, 185),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),

        child: GridView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: ActivityMenu.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10.0,
                    spreadRadius: 0.5,
                    offset: const Offset(0.5, 0.5),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  final selectedExercise = exerciseScreens[ActivityMenu[index].id];
                  if (selectedExercise != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => selectedExercise),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("¡Ejercicio no disponible!")),
                    );
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 125,
                      height: 125,
                      child: Image.asset(
                        'assets/${ActivityMenu[index].photo}',
                      ),
                    ),
                    Text(ActivityMenu[index].name),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

