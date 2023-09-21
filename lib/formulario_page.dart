import 'package:flutter/material.dart';

class ClaseFormulario extends StatefulWidget {
  const ClaseFormulario({super.key});

  @override
  StateFormulario createState() => StateFormulario();
}

class StateFormulario extends State<ClaseFormulario>{
  @override
  Widget build(BuildContext context){
    const appTitle = 'Formulario';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title:  const Text(appTitle),
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
 final _formKey = GlobalKey<FormState>();

  TextEditingController nombreController = TextEditingController();
  TextEditingController apellido1Controller = TextEditingController();
  TextEditingController apellido2Controller = TextEditingController();
  

    String? validarCampo(String? valorCampo){
    if(valorCampo!.isEmpty){
      return "Please enter some text";
    }
    return null;
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
        ],
      ),
    );
  }
}
