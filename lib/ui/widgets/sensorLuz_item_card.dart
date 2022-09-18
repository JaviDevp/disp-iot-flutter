import 'package:dispositivos_iot/domain/services/sensor_value.dart';
import 'package:dispositivos_iot/ui/widgets/Item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SensorLuzCard extends StatefulWidget {
  @override
  _SensorLuzCardState createState() => _SensorLuzCardState();
}

class _SensorLuzCardState extends State<SensorLuzCard> {
  @override
  Widget build(BuildContext context) {
    return ItemCard(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          // height: 300.0,
          child: Row(
            children: [
              titulo(),
              Expanded(child: SizedBox()),
              ValorSensorLuz(),
            ],
          ),
        ),
      ),
    );
  }

  Widget titulo() {
    return Container(
      //color: Colors.red,
      //padding: EdgeInsets.only(right: 0.0),
      height: 50.0,
      child: Center(
        child: Text(
          'Sensor de luz',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}

class ValorSensorLuz extends StatefulWidget {
  @override
  _ValorSensorLuzState createState() => _ValorSensorLuzState();
}

class _ValorSensorLuzState extends State<ValorSensorLuz> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SensorService>(builder: (context, conection, _) {
      return Container(
        // color: Colors.red,
        child: Text(
          'd', //SensorService.valor,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      );
    });
  }
}
