import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../widgets/joypad.dart';
import '../globals.dart' as globals;
import 'dart:math' as math;

class DashboardPage extends StatefulWidget {
  final sendMessage;

  DashboardPage({
    required this.sendMessage,
    super.key,
  }) : super();

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  _getJoypadPosition(double dx, double dy) {
    print('dx' + dx.toStringAsFixed(0));
    print('dy' + dy.toStringAsFixed(0));

    widget.sendMessage('T=' + dy.toStringAsFixed(0) + '\n');
    widget.sendMessage('S=' + dx.toStringAsFixed(0) + '\n');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 75,
              ),
              DropdownMenu(fcn: widget.sendMessage),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2.5)),
                      // color: Colors.grey,
                      shape: BoxShape.rectangle),
                  child: SizedBox(
                    width: 50,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: GestureDetector(
                        onTapDown: (_) {
                          widget.sendMessage('X=1\n');
                        },
                        onTapUp: (_) {
                          widget.sendMessage('X=1\n');
                        },
                        child: Icon(
                          Icons.close,
                          size: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Column left
              SideSlider(
                title: 'SPEED',
                labels: globals.Speed_Names,
                values: globals.Speed_Values,
                fcn: widget.sendMessage,
                cmd: 'V=',
              ),

              //Column center
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Container(
                  alignment: Alignment.center,
                  // width: 80,
                  // height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2.5)),
                      // color: Colors.grey,
                      shape: BoxShape.rectangle),
                  child: SizedBox(
                    // width: 80,
                    child: Column(
                      children: [
                        Container(
                          height: 190,
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/side.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        //Joystick
                        JoypadWidget(
                          msgFcn: _getJoypadPosition,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Column left
              SideSlider(
                  title: 'DURATION',
                  labels: globals.Duration_Names,
                  values: globals.Duration_Values,
                  fcn: widget.sendMessage,
                  cmd: 'D='),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2.5)),
                      // color: Colors.grey,
                      shape: BoxShape.rectangle),
                  child: SizedBox(
                    width: 80,
                    child: OutlinedButton(
                      onPressed: () {
                        widget.sendMessage('O=1\n');
                      },
                      child: Text(
                        'ACTIVE',
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

              //Spin left button
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2.5)),
                      // color: Colors.grey,
                      shape: BoxShape.rectangle),
                  child: SizedBox(
                    width: 80,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: GestureDetector(
                        onTapDown: (_) {
                          widget.sendMessage('S=-100\n');
                        },
                        onTapUp: (_) {
                          widget.sendMessage('S=0\n');
                        },
                        child: Icon(
                          Icons.swipe_left,
                          size: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //Spin right button
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2.5)),
                      // color: Colors.grey,
                      shape: BoxShape.rectangle),
                  child: SizedBox(
                    width: 80,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: GestureDetector(
                        onTapDown: (_) {
                          widget.sendMessage('S=100\n');
                        },
                        onTapUp: (_) {
                          widget.sendMessage('S=0\n');
                        },
                        child: Icon(
                          Icons.swipe_right,
                          size: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(2.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2.5)),
                      // color: Colors.grey,
                      shape: BoxShape.rectangle),
                  child: SizedBox(
                    width: 80,
                    child: OutlinedButton(
                      onPressed: () {
                        widget.sendMessage('O=0\n');
                      },
                      child: Text(
                        'STOP',
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]));
  }
}

class SideSlider extends StatefulWidget {
  final String title;
  List<String> labels;
  List<int> values;
  final fcn;
  final String cmd;

  SideSlider({
    required this.title,
    required this.labels,
    required this.values,
    required this.fcn,
    required this.cmd,
    super.key,
  });

  @override
  State<SideSlider> createState() => _SideSliderState();
}

class _SideSliderState extends State<SideSlider> {
  double _value = 4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Container(
        alignment: Alignment.center,
        width: 80,
        height: 250,
        child: Column(
          children: [
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
                  '${widget.labels[_value.toInt()]}',
                  style: TextStyle(
                      fontFamily: 'Digital',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      letterSpacing: 3),
                ),
              ),
            ),
            Row(
              children: [
                //Title
                RotatedBox(
                  quarterTurns: 3,
                  child: Text('${widget.title}'),
                ),
                //Slider
                RotatedBox(
                    quarterTurns: 3,
                    child: Slider(
                      min: 0,
                      max: 9,
                      value: _value,
                      divisions: 9,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                        widget.fcn(widget.cmd +
                            widget.values[_value.toInt()].toStringAsFixed(0) +
                            '\n');
                      },
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownMenu extends StatefulWidget {
  List<String> Items = globals.Mode_Names;
  final fcn;

  DropdownMenu({required this.fcn, Key? key}) : super(key: key);
  @override
  State<DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  'Select mode',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: widget.Items.map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )).toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
              widget
                  .fcn('M=${widget.Items.indexOf(selectedValue.toString())}\n');
            });
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: 200,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.5),
              border: Border.all(
                color: Colors.transparent,
              ),
              color: Colors.grey[850],
            ),
            // elevation: 2,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: Colors.yellow,
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(
            // maxHeight: 200,
            width: 200,
            padding: null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.5),
              color: Colors.transparent,
            ),
            elevation: 8,
            offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}

class ProtoContainer extends StatefulWidget {
  const ProtoContainer({
    super.key,
  });

  @override
  State<ProtoContainer> createState() => _ProtoContainerState();
}

class _ProtoContainerState extends State<ProtoContainer> {
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
