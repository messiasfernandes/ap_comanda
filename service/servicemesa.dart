import 'dart:convert';

import 'package:app_comanda/utils/filtro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../model/mesa.dart';
import 'package:http/http.dart' as http;

class MesaService  with  ChangeNotifier{
  var url = "http://192.168.1.3:8080/mesas/";
  List<Mesa> mesas = [];
  List<Mesa> mesas2=[];
  var filtro = Filtro();
  int size=30;
  late dynamic response;
  Future <List<Mesa>> pesquisar(String parametro, int pagina) async {


    if (parametro.isEmpty) {


      response =
      await http.get(Uri.parse("$url?=page$pagina&paramentro=$parametro&size=$size"));
    } else {

      response = await http.get(Uri.parse("$url?paramentro=$parametro"));
    }

    var responseData = json.decode(utf8.decode(response.bodyBytes));
    Iterable list = ((responseData['content']));
    filtro.totalregistro = responseData['totalElements'];
    filtro.itensPorPagina = responseData['totalPages'];
    filtro.pagina = responseData['numberOfElements'];
      mesas.clear();
    for (var item in list) {
      print(item);
      var mesa = Mesa.fromJson(item);

      mesas.add(mesa);
      mesas2.add(mesa);
      notifyListeners();
    }

    return mesas;
  }
  int? totalmesas(){
    print('total${filtro.totalregistro}');
    return filtro.totalregistro;
  }
  Color corStatus(String status){

    if (status=='Livre'){
      return Colors.blueAccent;
    }
    return Colors.red;
  }

}

void main() {

  var mesaservice = MesaService();
  var pagina = 10;
  var paramentro = '3';
  mesaservice.pesquisar(paramentro, pagina);
  ///
  ///print( mesaservice.mesasProvider.toString());
}
