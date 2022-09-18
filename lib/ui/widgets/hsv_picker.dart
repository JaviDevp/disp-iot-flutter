import 'package:dispositivos_iot/domain/services/items_services.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

class HSVPickerPage extends StatefulWidget {
  const HSVPickerPage({Key? key}) : super(key: key);

  @override
  _HSVPickerPageState createState() => _HSVPickerPageState();
}

class _HSVPickerPageState extends State<HSVPickerPage> {
  HSVColor color = HSVColor.fromColor(Colors.blue);
  int hue = 250;
  int sat = 100;
  //static getColor() => color;
  void onChanged(HSVColor value) => color = value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 260,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
          ),
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: color.toColor(),
                ),
                const Divider(),

                ///---------------------------------
                HSVPicker(
                  color: color,
                  onChanged: (value) => super.setState(
                    () {
                      onChanged(value);
                      hue = color.hue.round();
                      sat = color.saturation.round() * 100;
                      print("hue: ${color.hue} sat: ${color.saturation}");
                    },
                  ),
                ),

                ElevatedButton(
                  onPressed: () async {
                    print('object');
                    await ItemRepository.setColorFoco(
                        hue.toString(), sat.toString());
                  },
                  child: Text('cambiar color'),
                )

                ///---------------------------------
              ],
            ),
          ),
        ),
      ),
    );
  }
}
