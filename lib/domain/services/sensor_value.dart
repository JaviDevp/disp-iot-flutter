import 'dart:async';
import 'dart:convert';
import 'package:dispositivos_iot/domain/services/items_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';

class SensorService extends ChangeNotifier {
  static String valor = "0";
  final periodo = Duration(seconds: 5);
  SensorService() {
    iniciarLoop();
  }

  void iniciarLoop() {
    /* final conectionService =
        Provider.of<ConnectionStatusModel>(_, listen: false); */
    Timer.periodic(this.periodo, (Timer t) => getSensorValue());
  }

  void detenerLoop() {}

  Future getSensorValue() async {
    valor = '0';
    //await ItemRepository.obtenerValorSensor();
    notifyListeners();
  }
}
