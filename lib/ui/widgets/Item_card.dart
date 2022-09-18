import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Widget child;

  const ItemCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: this.child,
        // height: 300,
        decoration: BoxDecoration(
          border: Border.all(
              //color: Color.fromRGBO(164, 164, 166, 1.0),
              ),
          color: Color.fromRGBO(45, 55, 75, 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          /* boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(164, 164, 166, 1.0),
              spreadRadius: 0.2,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ], */
        ),
      ),
    );
  }
}
