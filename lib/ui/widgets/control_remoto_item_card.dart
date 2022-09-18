import 'package:dispositivos_iot/ui/widgets/Item_card.dart';
import 'package:flutter/material.dart';

class ControlItemCard extends StatefulWidget {
  @override
  _ControlItemCardState createState() => _ControlItemCardState();
}

class _ControlItemCardState extends State<ControlItemCard> {
  @override
  Widget build(BuildContext context) {
    return ItemCard(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          // height: 300.0,
          child: GestureDetector(
            onTap: () {
              print('tv Screen');
              Navigator.pushNamed(context, 'tvScreen');
            },
            child: Row(
              children: [
                titulo(),
                Expanded(child: SizedBox()),
                IconoFoco(),
              ],
            ),
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
          'Control TV',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}

class IconoFoco extends StatefulWidget {
  @override
  _IconoFocoState createState() => _IconoFocoState();
}

class _IconoFocoState extends State<IconoFoco> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Icon(Icons.control_camera),
    );
  }
}
