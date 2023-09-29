import 'package:ejercicio_final/formulario_page.dart';
import 'package:ejercicio_final/listview_usuarios.dart';
import 'package:ejercicio_final/menu_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/menu',
    routes: {
      '/menu': (context) => const ClaseMenu(), // Ruta menu
      '/formulario': (context) => const ClaseFormulario(), //Ruta formulario
      '/listview': (context) => const ClaseListaUsuarios(), //Ruta listview
    },
  ));
}
