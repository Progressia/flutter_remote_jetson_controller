import 'package:flutter/material.dart';
import '../globals.dart';
import 'dart:math' as math;

class StateDetectionButton extends StatelessWidget {
  final onTapDownFcn;
  final onTapUpFcn;
  Icon icon;
  int angle;

  StateDetectionButton(
      {required this.icon,
      this.angle = 0,
      required this.onTapDownFcn,
      required this.onTapUpFcn,
      super.key})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topLeft,
      height: 50,
      width: 50,
      //decoration: BoxDecoration(border: Border.all()),
      child: IconButton(
        onPressed: () {},
        icon: GestureDetector(
          onTapDown: (_) {
            onTapDownFcn();
          },
          onTapUp: (_) {
            onTapUpFcn();
          },
          child: Transform.rotate(
            angle: angle * math.pi / 180,
            child: icon,
          ),
        ),
      ),
    );
  }
}
