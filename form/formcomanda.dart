import 'package:app_comanda/model/mesa.dart';
import 'package:app_comanda/pages/telacomanda.dart';
import 'package:app_comanda/service/servicemesa.dart';
import 'package:flutter/material.dart';

class Formcomanda extends State<TelaComada> {
  List<Mesa> mesas = [];
  final serviceMesa = MesaService();
  int? indicselecionado = 0;

  String paramentro = '';
  int pagina = 0;

  Future getMesas() async {
    return   serviceMesa.pesquisar(paramentro, pagina).then((respose) => {
          mesas = (respose),
        });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }
  @override
  dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesas'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _getData,

        child: GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: mesas.length,
          itemBuilder: (BuildContext context, int indice) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  indice == indicselecionado;

                  indicselecionado = mesas[indice].numeroDaMesa;
                  print(indicselecionado);
                });
              },
              child: Card(
                //    padding: const EdgeInsets.all(16),
                color:
                    serviceMesa.corStatus(mesas[indice].statusMesa.toString()),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      mesas[indice].statusMesa.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      mesas[indice].numeroDaMesa.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


  Future _getData() async {
    //  context.watch<MesaService>().pesquisar(paramentro, pagina);
    setState(() {
     getMesas();
    });
  }
}
