import 'package:ejercicio_final/menu_page.dart';
import 'package:ejercicio_final/usuarios.dart';
import 'package:flutter/material.dart';

class ClaseListaUsuarios extends StatefulWidget {
  const ClaseListaUsuarios({super.key});

  @override
  StateListaUsuarios createState() => StateListaUsuarios();
}

class StateListaUsuarios extends State<ClaseListaUsuarios> {
  List<Usuarios> usuariosFiltrados = List.empty(growable: true);
  String filtroSeleccionado = "Todos";

  eliminarElemento(int indice) {
    //Eleminar usuario de la lista
    setState(() {
      listaUsuarios.removeAt(indice);
    });
  }

  tratarElemento(BuildContext context, int indice) {
    //Snackbar con nombre de usuario
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(listaUsuarios[indice].nombre)));
  }

  void filtrarUsuarios(String tipo) {
    setState(() {
      filtroSeleccionado = tipo;
    });
  }

  List<Usuarios> getUsuariosfiltrados() {
    if (filtroSeleccionado == "Particular") {
      return listaUsuarios
          .where((usuario) => usuario.tipo == "Particular")
          .toList();
    } else if (filtroSeleccionado == 'Empresa') {
      return listaUsuarios
          .where((usuario) => usuario.tipo == '')
          .toList();
    } else {
      return listaUsuarios;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de usuarios"),
        actions: [
          PopupMenuButton<String>(
            onSelected: filtrarUsuarios,
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: "Particular",
                child: Text("Filtrar por particular"),
              ),
              const PopupMenuItem<String>(
                value: "Empresa",
                child: Text("Filtrar por empresa"),
              ),
              const PopupMenuItem<String>(
                value: "Todos",
                child: Text("Mostrar todos"),
              ),
            ],
          ),
        ],
      ),
      body:  ListView.builder(
              itemCount: listaUsuarios.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(listaUsuarios[index].nombre),
                  onDismissed: (direction) {
                    eliminarElemento(index);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(listaUsuarios[index].nombre),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(listaUsuarios[index].apellido1),
                            Text(listaUsuarios[index].apellido2),
                            Text(listaUsuarios[index].dni),
                            Text(listaUsuarios[index].fecha),
                            Text(listaUsuarios[index].tipo)
                          ]),
                      onTap: () {
                        tratarElemento(context, index);
                      },
                    ),
                  ),
                );
              },
            ),
    );  
  }
}
