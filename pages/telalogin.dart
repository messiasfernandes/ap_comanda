import 'dart:ffi';

import 'package:app_comanda/componentes/input.dart';
import 'package:app_comanda/form/formprincipal.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<StatefulWidget> createState() {
    return FormLogin();
  }
}

class FormLogin extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.filter_vintage_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              print('clicou');

            },

          )
        ],
      ),
      body: Card(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
         height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(

                  //   controller: usuariocontroller,
                  autovalidateMode: AutovalidateMode.always,

                  decoration: const InputDecoration(

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22.5)),
                    ),
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Usuário',
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                TextFormField(

                  //   controller: usuariocontroller,
                  autovalidateMode: AutovalidateMode.always,
                  obscureText: true,
                  decoration: const InputDecoration(

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22.5)),
                    ),
                    prefixIcon: Icon(Icons.password),
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0,),
                ElevatedButton.icon(

                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green[800],
                    padding: const EdgeInsets.all(12.0),
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'RobotoMono',
                        color: Colors.white),
                  ),
                  onPressed: () {
                    print('pasou0');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const FormPrincipal();
                        }));
                  },
                  icon: const Icon(
                    Icons.login_rounded,
                  ),
                  label: const Text('Logar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
