import 'package:dispositivos_iot/domain/services/items_services.dart';
import 'package:dispositivos_iot/ui/widgets/button_tv.dart';
import 'package:dispositivos_iot/ui/widgets/hsv_picker.dart';
import 'package:flutter/material.dart';

class TVRemoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(32, 39, 45, 1.0),
          title: Text('Foco LED'),
        ),
        backgroundColor: Color.fromRGBO(32, 39, 45, 1.0),
        body: GridView.count(
          crossAxisCount: 2,
          children: getWidgets(),
        ) //getWidgets(),

        );
  }

  List<Widget> getWidgets() {
    List<Widget> list = [];
    list.add(powerButton());
    list.add(emptyButton());

    list.add(volUpButton());
    list.add(channelUpButton());
    list.add(volDownButton());
    list.add(channelDownButton());

    return list;
  }

  Widget powerButton() {
    return ButtonTV(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(45, 55, 75, 1.0),
          ),
        ),
        onPressed: () {
          ItemRepository.powertv();
        },
        child: Center(
            child: Icon(
          Icons.power_settings_new_sharp,
        )),
      ),
    );
  }

  Widget volUpButton() {
    return ButtonTV(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(45, 55, 75, 1.0),
          ),
        ),
        onPressed: () {
          ItemRepository.volume('0');
        },
        child: Center(
          child: Text(
            'Vol +',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  Widget volDownButton() {
    return ButtonTV(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(45, 55, 75, 1.0),
          ),
        ),
        onPressed: () {
          ItemRepository.volume('100');
        },
        child: Center(
          child: Text(
            'Vol -',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  Widget channelUpButton() {
    return ButtonTV(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(45, 55, 75, 1.0),
          ),
        ),
        onPressed: () {
          ItemRepository.channel('0');
        },
        child: Center(
          child: Text(
            'CH +',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  Widget channelDownButton() {
    return ButtonTV(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(45, 55, 75, 1.0),
          ),
        ),
        onPressed: () {
          ItemRepository.channel('100');
        },
        child: Center(
          child: Text(
            'CH -',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  Widget emptyButton() {
    return ButtonTV(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(45, 55, 75, 1.0),
          ),
        ),
        onPressed: () {},
        child: Center(
          child: Text(
            '',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
