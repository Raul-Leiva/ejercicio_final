import 'package:ejercicio_final/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:dni_nie_validator/dni_nie_validator.dart';

const List<String> list = <String>['Particular', 'Empresa'];

var opcion = "";

class ClaseFormulario extends StatefulWidget {
  const ClaseFormulario({super.key});

  @override
  StateFormulario createState() => StateFormulario();
}

class StateFormulario extends State<ClaseFormulario> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Formulario';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const Formulario(),
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  StateClaseFormulario createState() => StateClaseFormulario();
}

class StateClaseFormulario extends State<Formulario> {
  List<Usuarios> listaUsuarios = List.empty(growable: true);
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = list.first;

  TextEditingController nombreController = TextEditingController();
  TextEditingController apellido1Controller = TextEditingController();
  TextEditingController apellido2Controller = TextEditingController();
  TextEditingController fechaController = TextEditingController();
  TextEditingController DNIController = TextEditingController();

  crearFecha() async {
    DateTime? fechaSeleccionada = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime(2500));

    setState(() {
      if (fechaSeleccionada != null) {
        String fechaformat =
            "${fechaSeleccionada.year.toString()}-${fechaSeleccionada.month.toString().padLeft(2, '0')}-${fechaSeleccionada.day.toString().padLeft(2, '0')}";
        fechaController.text = fechaformat;
      }
    });
  }

  Usuarios usuarioAtributos() {
    var nombre = nombreController.text;
    var apellido1 = apellido1Controller.text;
    var apellido2 = apellido2Controller.text;
    var fecha = fechaController.text;
    var DNI = DNIController.text;
    var tipo = opcion;

    return Usuarios(nombre, apellido1, apellido2, fecha, DNI, tipo);
  }

  agregarUsuario() {
    var usuario = usuarioAtributos();
    listaUsuarios.add(usuario);
    listaUsuarios;
  }

  String? validarCampo(String? valorCampo) {
    if (valorCampo!.isEmpty) {
      return "Este campo es obligatorio";
    }
    return null;
  }

  _validateDocument(String value) {
    String _validation = '';
    if (value.isValidDNI() || value.isValidNIE()) {
      return null;
    } else {
      _validation = 'DNI/NIE inválido';
    }
    return _validation;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            validator: (value) => validarCampo(value),
            controller: nombreController,
            decoration: InputDecoration(
                labelText: "Nombre",
                suffixIcon: IconButton(
                  onPressed: () {
                    nombreController.clear();
                  },
                  icon: const Icon(Icons.clear),
                )),
          ),
          TextFormField(
            validator: (value) => validarCampo(value),
            controller: apellido1Controller,
            decoration: InputDecoration(
                labelText: "Primer Apellido",
                suffixIcon: IconButton(
                  onPressed: () {
                    apellido1Controller.clear();
                  },
                  icon: const Icon(Icons.clear),
                )),
          ),
          TextFormField(
            controller: apellido2Controller,
            decoration: InputDecoration(
                labelText: "Segundo Apellido(opcional)",
                suffixIcon: IconButton(
                  onPressed: () {
                    apellido2Controller.clear();
                  },
                  icon: const Icon(Icons.clear),
                )),
          ),
          TextFormField(
            validator: (value) => _validateDocument(value!),
            controller: DNIController,
            decoration: InputDecoration(
              labelText: "DNI",
              suffixIcon: IconButton(
                onPressed: () => DNIController.clear(),
                icon: const Icon(Icons.clear),
              ),
            ),
            onTap: () {},
          ),
          TextFormField(
            controller: fechaController,
            onTap: () {
              crearFecha();
            },
            decoration: const InputDecoration(hintText: "Fecha de nacimmiento"),
          ),
          DropdownMenu<String>(
            initialSelection: list.first,
            onSelected: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownMenuEntries:
                list.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: opcion, label: value);
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  agregarUsuario();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Usuario Guardado')));
                }
              },
              child: const Text('Guardar'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, widget.key);
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Saliendo')));
              },
              child: const Text('Volver'),
            ),
          ),
        ],
      ),
    );
  }
}
/*class ClaseistaUsuarios extends StatefulWidget {
  const ClaseistaUsuarios({super.key});

  @override
  StateListaUsuarios createState() => StateListaUsuarios();
}
class StateListaUsuarios extends State<ClaseistaUsuarios>{
      eliminarElemento(int indice){
    setState(() {
      listaUsuarios.removeAt(indice);
    });
  }
  tratarElemento(BuildContext context, int indice){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(listaUsuarios[indice].toString())));
  }
  
   @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: listaUsuarios.length,
            itemBuilder: (context, index){
              return Dismissible(
                key: Key(listaUsuarios[index].toString()), 
                onDismissed: (direction) {
                  eliminarElemento(index);
                },
                child: Card(
                  child: ListTile(
                    title: Text(listaUsuarios[index].toString()),
                    onTap: () {
                      tratarElemento(context, index);
                    },
                  ),
                ),
                );
        
            },
          );
  }
}
*/
