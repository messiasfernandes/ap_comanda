
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
 // Input({super.key});

 final  TextEditingController? controller;
  AutovalidateMode? validador;
  Icon? icone;
  String? rotulo;
  String? dica;
 InputDecoration ? decoration;

   Input({super.key, this.controller, this.rotulo, this.dica,  this.icone,  this .decoration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: icone != null ? icone! : null,
          labelText: rotulo,
          hintText: dica,

        ),
      ),
    );
  }

}

