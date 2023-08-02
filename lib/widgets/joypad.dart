import 'package:flutter/material.dart';
import 'dart:async';

/* Joypad widget */
class JoypadWidget extends StatefulWidget {
  final msgFcn;

  JoypadWidget({
    this.msgFcn,
    super.key,
  }) : super();

  @override
  _JoypadWidgetState createState() => _JoypadWidgetState();
}

class _JoypadWidgetState extends State<JoypadWidget> {
  double _drag_X = 0.0;
  double _drag_Y = 0.0;
  Size _joy_area = const Size(150.0, 150.0);
  double _joy_area_scale_factor = 100.0;
  double _joy_area_scale = 0.0;

  //Colors style
  Color _color_sign = Colors.blue;
  Color _color_splash = Colors.blue;
  dynamic _color_back = Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Joypad
        Container(
          width: _joy_area.width,
          height: _joy_area.height,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 0.6,
              colors: [Colors.white10, Colors.white24, Colors.black],
            ),
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.keyboard_arrow_up,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.keyboard_arrow_left,
                    ),
                  ),
                  Container(
                    child: Draggable(
                      child: Center(
                        child: UndraggedItem(),
                      ),
                      feedback: DraggedItem(),
                      childWhenDragging: Container(
                          // child: UndraggedItem(),
                          ),
                      onDragUpdate: (drag) {
                        setState(() {
                          _drag_X -= (drag.delta.dx);
                          _drag_Y += (drag.delta.dy);

                          if (_drag_X > (_joy_area.width / 2))
                            _drag_X = (_joy_area.width / 2);

                          if (_drag_X < (-1 * (_joy_area.width / 2)))
                            _drag_X = (-1 * (_joy_area.width / 2));

                          if (_drag_Y > (_joy_area.height / 2))
                            _drag_Y = (_joy_area.height / 2);

                          if (_drag_Y < (-1 * (_joy_area.height / 2)))
                            _drag_Y = (-1 * (_joy_area.height / 2));

                          // _joy_area_scale =
                          //     ((100 * _joy_area_scale_factor) / (155 / 2));
                          _joy_area_scale =
                              ((_joy_area_scale_factor) / (155 / 2));

                          if (_drag_Y <= 0) {
                            widget.msgFcn(_drag_X * _joy_area_scale,
                                _drag_Y * _joy_area_scale);
                          } else {
                            widget.msgFcn((-1) * _drag_X * _joy_area_scale,
                                _drag_Y * _joy_area_scale);
                          }
                        });
                      },
                      onDragEnd: (drag) {
                        setState(() {
                          _drag_X = 0.0;
                          _drag_Y = 0.0;
                          widget.msgFcn(_drag_X, _drag_Y);
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.keyboard_arrow_down,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DraggedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.green,
          shape: BoxShape.circle),
    );
  }
}

class UndraggedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.grey[600],
          shape: BoxShape.circle),
    );
  }
}
