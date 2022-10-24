import 'package:app_comanda/componentes/app.dart';
import 'package:app_comanda/model/mesa.dart';
import 'package:app_comanda/service/servicemesa.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
void main() {

  runApp (
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Mesa()),
          ],
        child: const ComandaApp(),
      ),
  );
}



