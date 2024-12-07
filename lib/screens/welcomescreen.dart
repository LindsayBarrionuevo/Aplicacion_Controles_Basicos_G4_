import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'menuscreen.dart';


class PantallaLogin extends StatefulWidget {
  const PantallaLogin({super.key});

  @override
  PantallaLoginState createState() => PantallaLoginState();
}

class PantallaLoginState extends State<PantallaLogin> {


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 50.0,
                  spreadRadius: 1.0,
                  offset: Offset(5.0, 5.0)
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        margin: const EdgeInsets.only(top: 50, left: 40, right: 40, bottom: 50),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/Logo_ESPE.png'),
              ),
              const SizedBox(height: 30),
              const Text(
                "Universidad de las Fuerzas Armadas",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Departamento de Ciencias de la Computación",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                  height: 20
              ),
              const Text(
                "Tarea/Res Controles Básicos",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                  height: 30
              ),
              const Text(
                "Lindsay Barrionuevo\nJuan Pablo Pinza\nJoel Rivera\nLeonardo Yaranga",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                  height: 50
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_)=>Menu()));
                  },
                  child: const Text("Ir a Menú", style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
