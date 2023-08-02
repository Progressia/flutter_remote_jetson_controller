import 'package:flutter/material.dart';
import '../globals.dart';

class Indicator extends StatelessWidget {
  late Parameter data;

  Indicator({required this.data, super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Container(
        width: 80,
        height: 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2.5)),
            // color: Colors.green,
            shape: BoxShape.rectangle),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${data.name}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Digital',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  letterSpacing: 3),
            ),
            Text(
              '${data.value.toString()}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Digital',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  letterSpacing: 3),
            ),
            Text(
              '${data.unit.toString()}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Digital',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  letterSpacing: 3),
            ),
          ],
        ),
      ),
    );
  }
}
