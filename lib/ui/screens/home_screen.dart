import 'package:dispositivos_iot/ui/widgets/Item_card.dart';
import 'package:dispositivos_iot/ui/widgets/control_remoto_item_card.dart';
import 'package:dispositivos_iot/ui/widgets/sensorLuz_item_card.dart';
import 'package:dispositivos_iot/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
        backgroundColor: Color.fromRGBO(24, 32, 45, 1.0),
        elevation: 0.0,
      ),
      backgroundColor: Color.fromRGBO(24, 32, 45, 1.0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.all(60.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'record_audio');
          },
          backgroundColor: Colors.white10,
          child: Icon(Icons.mic),
        ),
      ),
      body: ListView(
        children: [
          SensorLuzCard(),
          FocoItemCard(),
          ControlItemCard(),
          /* ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'record_audio');
              },
              child: Text('Speech to text')), */
        ],
      ),
    );
  }
}
