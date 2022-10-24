import 'package:app_comanda/model/mesa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardsMesas extends StatelessWidget {
  final Color? cor;

  final Mesa mesaItem;

  const CardsMesas({super.key, this.cor, required this.mesaItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            mesaItem.statusMesa.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            mesaItem.numeroDaMesa.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
