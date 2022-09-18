import 'dart:async';
import 'package:dispositivos_iot/domain/services/items_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:rxdart/rxdart.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';

DialogflowGrpcV2Beta1? dialogflow;

class SpeechScreen extends StatefulWidget {
  @override /*  */
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Presiona el botón y comienza a hablar';
  String _textResponse = "";
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    initPlugin();
  }

  Future<void> initPlugin() async {
    final serviceAccount = ServiceAccount.fromString(
        '${(await rootBundle.loadString('assets/credentials.json'))}');
    // Create a DialogflowGrpc Instance
    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(24, 32, 45, 1.0),
        title: Center(
            child: Text(
                'Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%')),
        elevation: 0.0,
      ), */
      backgroundColor: Color.fromRGBO(24, 32, 45, 1.0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Colors.green,
        endRadius: 100.0,
        duration: const Duration(milliseconds: 500),
        repeatPauseDuration: const Duration(milliseconds: 200),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          backgroundColor: Colors.white10,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
              child: Column(
                children: [
                  TextHighlight(
                    text: _text,
                    words: {},
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  TextHighlight(
                    text: _textResponse,
                    words: {},
                    textStyle: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        _textResponse = "";
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
      //todo:Enviar el texto convertido al dialogflow
      handleSubmitted(_text);
    }
  }

  void handleSubmitted(text) async {
    print('handleSubmit:');
    print('_text: $_text');
    DetectIntentResponse data = await dialogflow!.detectIntent(text, 'en-US');
    Map<String, dynamic> params = data.queryResult.parameters.writeToJsonMap();
    String fulfillmentText = data.queryResult.fulfillmentText;
    if (fulfillmentText.isNotEmpty) {
      _textResponse = fulfillmentText;
      setState(() {});
      //print('params: ${parametros}');
      print('params: ${params.toString()}');
      // * POSIBLE LUGAR PARA VER LO QUE LLEGA Y LLAMAR AL SERVICE
      print('fulfillmentText is not empty');
      print(fulfillmentText);

      _ejecutarAccion(fulfillmentText, params);
    }
  }

  void _ejecutarAccion(String response, [var params = ""]) {
    switch (response) {
      case "apagando el foco":
        ItemRepository.sendCommandFoco("off");
        break;
      case "encendiendo foco":
        ItemRepository.sendCommandFoco("on");
        break;
      case "cambiando brillo":
        cambiarBrillo(params);
        break;
      case "aumentando volumen":
        ItemRepository.volume('0');
        break;
      case "bajando volumen":
        ItemRepository.volume('100');
        break;
      case "encendiendo television":
        ItemRepository.powertv();
        break;
      case "apagando television":
        ItemRepository.powertv();
        break;
      case "cambiando color a rojo":
        ItemRepository.setColorFoco('356', '90');
        break;
      case "cambiando color a verde":
        ItemRepository.setColorFoco('124', '90');
        break;

      default:
        return;
    }
  }

  cambiarBrillo(dynamic params) {
    print(params);
    List<dynamic> lista = params["1"];
    var obj = lista[0];
    var obj2 = obj["2"];
    double value = obj2["2"];
    int val = value.toInt();
    ItemRepository.setBrilloFoco(val.toString());
  }
}
