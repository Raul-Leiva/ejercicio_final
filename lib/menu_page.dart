import 'package:flutter/material.dart';

class ClaseMenu extends StatefulWidget {
  const ClaseMenu({super.key});

  @override
  StateClaseMenu createState() => StateClaseMenu();
}

class StateClaseMenu extends State<ClaseMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú Formulario"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/formulario');
                },
                child: const Text('Formulario'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
