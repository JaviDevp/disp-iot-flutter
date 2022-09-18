import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ItemRepository extends ChangeNotifier {
  static Future<String> sendCommandFoco(String message) async {
    var response = await http.post(
        Uri.parse('http://192.168.0.14:8080/rest/items/led_led'),
        headers: {
          'Content-Type': 'text/plain',
        },
        body: message.toUpperCase());
    print('entra');
    // print(response.body);
    if (response.body.contains('name')) {
      //user = User.fromJson(response.body);
    }
    print(response.body);
    print('https send');
    return response.body;
  }

  static Future<String> setBrilloFoco(String message) async {
    var response = await http.post(
        Uri.parse('http://192.168.0.14:8080/rest/items/brilloItem'),
        headers: {
          'Content-Type': 'text/plain',
        },
        body: message);
    print('entra');
    // print(response.body);
    if (response.body.contains('name')) {
      //user = User.fromJson(response.body);
    }
    print(response.body);
    print('https send');
    return response.body;
  }

  static Future<String> setColorFoco(String hue, String sat) async {
    var response = await http.post(
        Uri.parse('http://192.168.0.14:8080/rest/items/esp_colorChannel'),
        headers: {
          'Content-Type': 'text/plain',
        },
        body: "$hue,$sat,50");
    print('cambiar color');
    // print(response.body);
    if (response.body.contains('name')) {
      //user = User.fromJson(response.body);
    }
    print(response.body);
    print('https send');
    return response.body;
  }

  static Future<String> obtenerValorSensor() async {
    var response = await http.get(
      Uri.parse(
          'http://192.168.0.14:8080/rest/items/esp_sensorLuznumero/state'),
      headers: {
        'Content-Type': 'text/plain',
      },
    );
    print('obteniendo el valor del sensor');
    // print(response.body);
    if (response.body.contains('error')) {
      print('error al obtener el valor del sensor');
      return "-1";
    }
    print(response.body);
    return response.body;
  }

  //* control remoto
  static Future<String> powertv() async {
    var response = await http.post(
        Uri.parse('http://192.168.0.14:8080/rest/items/esp_encenderapagartv'),
        headers: {
          'Content-Type': 'text/plain',
        },
        body: 'ON');
    print('powertv ');
    // print(response.body);
    if (response.body.contains('name')) {
      //user = User.fromJson(response.body);
    }
    print(response.body);
    print('https send');
    return response.body;
  }

  static Future<String> volume(String message) async {
    var response = await http.post(
        Uri.parse(
            'http://192.168.0.14:8080/rest/items/led_controlremotovolumen'),
        headers: {
          'Content-Type': 'text/plain',
        },
        body: message);
    print('vol $message');
    // print(response.body);
    if (response.body.contains('name')) {
      //user = User.fromJson(response.body);
    }
    print(response.body);
    print('https send');
    return response.body;
  }

  static Future<String> channel(String message) async {
    var response = await http.post(
        Uri.parse('http://192.168.0.14:8080/rest/items/led_channelUpDown'),
        headers: {
          'Content-Type': 'text/plain',
        },
        body: message);
    print('channel $message');
    // print(response.body);
    if (response.body.contains('name')) {
      //user = User.fromJson(response.body);
    }
    print(response.body);
    print('https send');
    return response.body;
  }
}
