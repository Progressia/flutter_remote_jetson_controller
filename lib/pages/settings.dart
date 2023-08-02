import 'package:flutter/material.dart';
import '../globals.dart' as globals;
import '../globals.dart';

class SettingsPage extends StatefulWidget {
  final sendMessage;

  SettingsPage({
    required this.sendMessage,
    super.key,
  }) : super();

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: ListView(
        children: [
          ///PID of Stabilization
          SettingsBox(
            title: 'PID OF STABILIZATION',
            children: [
              ParameterCard(
                  data: globals.settings_var[0], fcn: widget.sendMessage),
              ParameterCard(
                  data: globals.settings_var[1], fcn: widget.sendMessage),
              ParameterCard(
                  data: globals.settings_var[2], fcn: widget.sendMessage),
              ParameterCard(
                  data: globals.settings_var[3], fcn: widget.sendMessage),
              ParameterCard(
                  data: globals.settings_var[4], fcn: widget.sendMessage),
            ],
          ),

          ///PID of Velocity
          SettingsBox(
            title: 'PID OF VELOCITY',
            children: [
              ParameterCard(
                  data: globals.settings_var[5], fcn: widget.sendMessage),
              ParameterCard(
                  data: globals.settings_var[6], fcn: widget.sendMessage),
              ParameterCard(
                  data: globals.settings_var[7], fcn: widget.sendMessage),
              ParameterCard(
                  data: globals.settings_var[8], fcn: widget.sendMessage),
              ParameterCard(
                  data: globals.settings_var[9], fcn: widget.sendMessage),
            ],
          ),

          ///Low Pass Filters
          SettingsBox(
            title: 'LOW PASS FILTERS',
            children: [
              ParameterCard(
                  data: globals.settings_var[10], fcn: widget.sendMessage),
              ParameterCard(
                  data: globals.settings_var[11], fcn: widget.sendMessage),
              ParameterCard(
                  data: globals.settings_var[12], fcn: widget.sendMessage),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsBox extends StatefulWidget {
  String title;
  List<Widget> children = const <Widget>[];

  SettingsBox({
    required this.title,
    required this.children,
    super.key,
  });

  @override
  State<SettingsBox> createState() => _SettingsBoxState();
}

class _SettingsBoxState extends State<SettingsBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        child: Column(
          children: [
            //Title
            Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                alignment: Alignment.center,
                // height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.grey[800],
                    shape: BoxShape.rectangle),
                child: Column(
                  children: widget.children,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParameterCard extends StatefulWidget {
  final fcn;
  Parameter data;
  final int valuePrecision;
  final double value_min;
  final double value_max;
  final bool grainSelector;

  ParameterCard({
    required this.data,
    required this.fcn,
    this.value_min = -1000,
    this.value_max = 1000,
    this.valuePrecision = 2,
    this.grainSelector = true,
    super.key,
  });

  @override
  State<ParameterCard> createState() => _ParameterCardState();
}

class _ParameterCardState extends State<ParameterCard> {
  double _value = 0;

  double _increaseValue(double value, double g, double max) {
    _value = value;

    _value += g;
    if (_value > max) _value = max;

    return _value;
  }

  double _decreaseValue(double value, double g, double min) {
    _value = value;

    _value -= g;
    if (_value <= min) _value = min;

    return _value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Name
        Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            alignment: Alignment.center,
            width: 75,
            height: 25,
            child: Text(widget.data.name),
          ),
        ),

        //Add
        Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            alignment: Alignment.center,
            width: 40,
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 25,
                  height: 25,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.data.value = _increaseValue(widget.data.value,
                              widget.data.g, widget.value_max);
                        });
                        widget.fcn(widget.data.cmd +
                            widget.data.value
                                .toStringAsFixed(widget.valuePrecision) +
                            '\n');
                      },
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                      )),
                ),
              ],
            ),
          ),
        ),
        //Value

        Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2.5)),
                color: Colors.green,
                shape: BoxShape.rectangle),
            alignment: Alignment.center,
            width: 75,
            height: 25,
            child: Text(
              widget.data.value.toStringAsFixed(widget.valuePrecision),
              style: TextStyle(
                  fontFamily: 'Digital',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  letterSpacing: 3),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            alignment: Alignment.center,
            width: 40,
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 25,
                  height: 25,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.data.value = _decreaseValue(widget.data.value,
                              widget.data.g, widget.value_min);
                        });

                        widget.fcn(widget.data.cmd +
                            widget.data.value
                                .toStringAsFixed(widget.valuePrecision) +
                            '\n');
                      },
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.blue,
                      )),
                ),
              ],
            ),
          ),
        ),

        //Grain setter
        if (widget.grainSelector)
          Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              alignment: Alignment.center,
              width: 80,
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2.5)),
                  // color: Colors.grey,
                  shape: BoxShape.rectangle),
              child: SizedBox(
                width: 80,
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      widget.data.g *= 10;
                      if (widget.data.g > 1000) widget.data.g = 0.01;
                    });
                  },
                  child: Text(widget.data.g.toString()),
                ),
              ),
            ),
          ),

        if (!widget.grainSelector)
          Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              alignment: Alignment.center,
              width: 75,
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2.5)),
                  // color: Colors.grey,
                  shape: BoxShape.rectangle),
            ),
          ),
      ],
    );
  }
}

class ProtoContainer extends StatelessWidget {
  const ProtoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Container(
        alignment: Alignment.center,
        width: 80,
        height: 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2.5)),
            color: Colors.grey,
            shape: BoxShape.rectangle),
      ),
    );
  }
}
