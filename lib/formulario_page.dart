import 'package:ejercicio_final/menu_page.dart';
import 'package:ejercicio_final/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:dni_nie_validator/dni_nie_validator.dart';

List<String> list = <String>['Particular', 'Empresa']; //Lista dropdownmenu

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  StateClaseFormulario createState() => StateClaseFormulario();
}

class StateClaseFormulario extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = list.first;

  TextEditingController nombreController = TextEditingController();
  TextEditingController apellido1Controller = TextEditingController();
  TextEditingController apellido2Controller = TextEditingController();
  TextEditingController fechaController = TextEditingController();
  TextEditingController dniController = TextEditingController();
  TextEditingController tipoUsuarioController = TextEditingController();

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
    //Dar atributos al usuario desde clase Usuarios
    var nombre = nombreController.text;
    var apellido1 = apellido1Controller.text;
    var apellido2 = apellido2Controller.text;
    var fecha = fechaController.text;
    var dni = dniController.text;
    var tipo = tipoUsuarioController.text;

    return Usuarios(nombre, apellido1, apellido2, fecha, dni, tipo);
  }

  agregarUsuario(usuario) {
    //Agregar usuario a lista
    var usuario = usuarioAtributos();
    listaUsuarios.add(usuario);
  }

  String? validarCampo(String? valorCampo) {
    //Validar campo obligatorio
    if (valorCampo!.isEmpty) {
      return "Este campo es obligatorio";
    }
    return null;
  }

  _validateDocument(String value) {
    //validar documento de identidad
    String validation = '';
    if (value.isValidDNI() || value.isValidNIE()) {
      return null;
    } else {
      validation = 'DNI/NIE inválido';
    }
    return validation;
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
            controller: dniController,
            decoration: InputDecoration(
              labelText: "DNI",
              suffixIcon: IconButton(
                onPressed: () => dniController.clear(),
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
            decoration: const InputDecoration(hintText: "Fecha de nacimiento"),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: DropdownMenu<String>(
              controller: tipoUsuarioController,
              initialSelection: list.first,
              onSelected: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  list.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    agregarUsuario(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Usuario Guardado')));
                  }
                },
                child: const Text('Guardar'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Saliendo')));
                },
                child: const Text('Volver'),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
