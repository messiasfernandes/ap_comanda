import 'package:app_comanda/model/mesa.dart';
import 'package:app_comanda/service/servicemesa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Telamesa extends StatefulWidget {
  const Telamesa({super.key});

  @override
  State<StatefulWidget> createState() {
    return FormMesas();
  }
}

class FormMesas extends State<Telamesa> {
  List<Mesa> mesas = [];

  final serviceMesa = MesaService();
  int? indicselecionado = 0;

  String paramentro = '';
  int pagina = 0;

  Future getMesas() async {
    serviceMesa.pesquisar(paramentro, pagina).then((respose) => {
          mesas = (respose),
        });
  }

  final serviceProvider = ChangeNotifierProvider<MesaService>((ref) {
    return MesaService();
  });

  @override
  Widget build(BuildContext context) {
    /// mesas = ref.watch(serviceProvider).pesquisar('', 1) as List<Mesa> ;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesas 2'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Mesa>>(
              future: load(),

              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<Mesa>? mesas = snapshot.data;

                return mesas != null && mesas.isNotEmpty
                    ? GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(10.0),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 180,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: mesas.length,
                        itemBuilder: (_, indice) {

                          return  Card(

                            color: serviceMesa.corStatus(mesas[indice].statusMesa.toString()),
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

                          );
                        },
                      )
                    :  const Card(
                  color: Colors.blueAccent,

                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future _getData() async {
    ///serviceProvider.notifier;
    return getMesas();
  }

  Future<List<Mesa>> load() {
    return serviceMesa
        .pesquisar(paramentro, pagina)
        .then((respose) => mesas = (respose));
  }
}
