import 'package:ejercicio_final/menu_page.dart';
import 'package:flutter/material.dart';

class ClaseListaUsuarios extends StatefulWidget {
  const ClaseListaUsuarios({super.key});

  @override
  StateListaUsuarios createState() => StateListaUsuarios();
}

class StateListaUsuarios extends State<ClaseListaUsuarios> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de usuarios"),
      ),
      body: ListView.builder(
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
