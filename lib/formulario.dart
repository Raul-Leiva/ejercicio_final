import 'package:ejercicio_final/formulario_page.dart';
import 'package:flutter/material.dart';

class ClaseFormulario extends StatefulWidget {
  const ClaseFormulario({super.key});

  @override
  StateFormulario createState() => StateFormulario();
}

class StateFormulario extends State<ClaseFormulario> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Formulario';
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: const Formulario(),
    );
  }
}