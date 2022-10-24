import 'package:app_comanda/form/form_mesas.dart';
import 'package:app_comanda/pages/telacomanda.dart';
import 'package:app_comanda/pages/telalogin.dart';
import 'package:flutter/material.dart';


class MenuLateral extends StatefulWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  State<MenuLateral> createState() => _MenuLateralState();
}
class _MenuLateralState extends State<MenuLateral> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Messias Fernndes'),
            accountEmail: Text('messiasfernandes@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('MS'),
            ),
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
          ),
          ListTile(
              leading: const Icon(Icons.account_circle_sharp),
              title: const Text("Usuaário"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TelaLogin();
                }));
              }),
          ListTile(
              leading: const Icon(Icons.gif_box_outlined),
              title: const Text("Pedidos"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TelaComada();
                }));
              }),
          ListTile(
              leading: const Icon(Icons.gif_box_outlined),
              title: const Text("Mesas"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  const Telamesa();
                }));
              }),
          ListTile(
              leading: const Icon(Icons.shop),
              title: const Text("Produtos3"),
              onTap: () {

              }),
        ],
      ),
    );
  }
}
