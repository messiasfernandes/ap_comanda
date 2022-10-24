import 'package:app_comanda/model/enumerado/statusmesa.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Mesa  extends ChangeNotifier{
  int? id;
  int? numeroDaMesa;
  String? statusMesa;

  Mesa({this.id, this.numeroDaMesa, this.statusMesa});

  Mesa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numeroDaMesa = json['numeroDaMesa'];
     statusMesa = json['statusMesa'];
     notifyListeners();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['numeroDaMesa'] = numeroDaMesa;
    data['statusMesa'] = statusMesa;

    return data;
  }

}
