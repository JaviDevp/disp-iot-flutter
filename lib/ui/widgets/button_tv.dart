import 'package:flutter/material.dart';

class ButtonTV extends StatelessWidget {
  final Widget child;

  const ButtonTV({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(9.0),
        padding: EdgeInsets.all(8.0),
        child: child);
  }
}
