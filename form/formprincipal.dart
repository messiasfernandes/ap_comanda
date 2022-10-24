import 'package:app_comanda/componentes/menu.dart';
import 'package:app_comanda/pages/telainicial.dart';
import 'package:flutter/material.dart';


class FormPrincipal extends StatelessWidget {
  const FormPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      body: const TelaInicial(),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Comanda Mobile'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              print('clicou');
            },
          )
        ],
      ),
    );
  }
}
