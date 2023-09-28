
import 'package:ejercicio_final/formulario_page.dart';
import 'package:ejercicio_final/menu_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/menu',
    routes: {
      '/menu': (context) => const ClaseMenu(),
      '/formulario': (context) => const ClaseFormulario(),
   //   '/formulario/listview': (context) => const ClaseistaUsuarios(),
    },
  ));
}
