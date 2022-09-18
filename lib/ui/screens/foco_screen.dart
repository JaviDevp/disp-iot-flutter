import 'package:dispositivos_iot/domain/services/items_services.dart';
import 'package:dispositivos_iot/ui/widgets/hsv_picker.dart';
import 'package:flutter/material.dart';

class FocoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(32, 39, 45, 1.0),
        title: Text('Foco LED'),
      ),
      backgroundColor: Color.fromRGBO(32, 39, 45, 1.0),
      body: ListView(
        children: getWidgets(),
      ),
    );
  }

  List<Widget> getWidgets() {
    List<Widget> list = [];
    list.add(SwitchFoco());
    list.add(SliderBrillo());
    list.add(SizedBox(
      height: 20.0,
    ));
    list.add(HSVPickerPage());
    return list;
  }

  Widget onButton() {
    return ElevatedButton(
        onPressed: () async {
          print('on pressed');
          String response = await ItemRepository.sendCommandFoco('ON');
        },
        child: Text('on'));
  }
}

class SliderBrillo extends StatefulWidget {
  @override
  _SliderBrilloState createState() => _SliderBrilloState();
}

class _SliderBrilloState extends State<SliderBrillo> {
  double sliderValue = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color.fromRGBO(45, 55, 75, 1.0),
      ),
      margin: EdgeInsets.only(right: 12.0, left: 12.0, top: 12.0, bottom: 12.0),
      padding: EdgeInsets.only(right: 12.0, left: 12.0, top: 2.0, bottom: 2.0),
      child: Row(
        children: [
          Text(
            'Brillo',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          Expanded(
            child: Slider(
                value: sliderValue,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                    ItemRepository.setBrilloFoco(
                        sliderValue.round().toString());
                  });
                }),
          ),
        ],
      ),
    );
  }
}

class SwitchFoco extends StatefulWidget {
  @override
  _SwitchFocoState createState() => _SwitchFocoState();
}

class _SwitchFocoState extends State<SwitchFoco> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color.fromRGBO(45, 55, 75, 1.0),
      ),
      margin: EdgeInsets.only(right: 12.0, left: 12.0, top: 12.0, bottom: 12.0),
      padding: EdgeInsets.only(right: 12.0, left: 12.0, top: 2.0, bottom: 2.0),
      child: Row(
        children: [
          Text(
            'Off / On',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          Expanded(child: SizedBox()),
          Switch.adaptive(
            value: isSwitched,
            onChanged: (value) async {
              isSwitched = value;
              setState(() {});
              print(isSwitched);
              String message = (isSwitched) ? 'ON' : 'OFF';
              await ItemRepository.sendCommandFoco(message);
            },
          ),
        ],
      ),
    );
  }
}
