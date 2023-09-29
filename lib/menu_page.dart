import 'package:ejercicio_final/usuarios.dart';
import 'package:flutter/material.dart';

List<Usuarios> listaUsuarios =
    List.empty(growable: true); //Crear Lista Usuarios

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/formulario'); //Boton ruta formulario
                  },
                  child: const Text('Formulario'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          '/listview'); //Boton ruta listview(listausuarios)
                    },
                    child: const Text('Lista usuarios')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
