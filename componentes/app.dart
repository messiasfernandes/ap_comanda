

import 'package:app_comanda/pages/telalogin.dart';
import 'package:flutter/material.dart';

class ComandaApp extends StatelessWidget {
  const ComandaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.indigo[800],
          textTheme: ButtonTextTheme.normal,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: TelaLogin(),
      ),
    );
  }
  
}