library my_prj.globals;

import 'package:flutter/material.dart';

List<Parameter> monitor_variables = [
  Parameter(
    name: 'M1: ',
    value: 0.0,
    unit: ' V',
    cmd: 'U0',
    g: 1.0,
  ),
  Parameter(
    name: 'M2: ',
    value: 0.0,
    unit: ' V',
    cmd: 'U0',
    g: 1.0,
  ),
  Parameter(
    name: 'P:  ',
    value: 0.0,
    unit: ' rad',
    cmd: 'U0',
    g: 1.0,
  ),
  Parameter(
    name: 'T:  ',
    value: 0.0,
    unit: ' rad',
    cmd: 'U0',
    g: 1.0,
  ),
  Parameter(
    name: 'V:  ',
    value: 0.0,
    unit: ' V',
    cmd: 'U0',
    g: 1.0,
  ),
  Parameter(
    name: 'S:  ',
    value: 0.0,
    unit: ' %',
    cmd: 'U0',
    g: 1.0,
  ),
];

List<Parameter> controls_variables = [
  Parameter(
    name: 'T: ',
    value: 0.0,
    unit: '%',
    cmd: 'T=',
    g: 1.0,
  ),
  Parameter(
    name: 'S: ',
    value: 0.0,
    unit: '%',
    cmd: 'S=',
    g: 1.0,
  ),
];

List<Parameter> settings_var = [
  Parameter(name: 'P', value: 0.0, unit: '', cmd: 'AP=', g: 0.01),
  Parameter(name: 'I', value: 0.0, unit: '', cmd: 'AI=', g: 0.01),
  Parameter(name: 'D', value: 0.0, unit: '', cmd: 'AD=', g: 0.01),
  Parameter(name: 'Ramp', value: 0.0, unit: '', cmd: 'AR=', g: 1.0),
  Parameter(name: 'Limit', value: 0.0, unit: '', cmd: 'AL=', g: 1.0),
  Parameter(name: 'P', value: 0.0, unit: '', cmd: 'BP=', g: 0.01),
  Parameter(name: 'I', value: 0.0, unit: '', cmd: 'BI=', g: 0.01),
  Parameter(name: 'D', value: 0.0, unit: '', cmd: 'BD=', g: 0.01),
  Parameter(name: 'Ramp', value: 0.0, unit: '', cmd: 'BR=', g: 1.0),
  Parameter(name: 'Limit', value: 0.0, unit: '', cmd: 'BL=', g: 1.0),
  Parameter(name: 'Pitch', value: 0.0, unit: '', cmd: 'CF=', g: 0.01),
  Parameter(name: 'Steering', value: 0.0, unit: '', cmd: 'DF=', g: 0.01),
  Parameter(name: 'Throttle', value: 0.0, unit: '', cmd: 'EF=', g: 0.01),
];

List<String> Mode_Names = [
  'Mode: Manual',
  'Mode: GoSTRAIGHT',
  'Mode: TurnLEFT',
  'Mode: TurnRIGHT',
  'Mode: SpinLEFT',
  'Mode: SpinRIGHT '
];

List<String> Speed_Names = [
  ' 10 %',
  ' 20 %',
  ' 30 %',
  ' 40 %',
  ' 50 %',
  ' 60 %',
  ' 70 %',
  ' 80 %',
  ' 90 %',
  '100 %',
];

List<int> Speed_Values = [
  10,
  20,
  30,
  40,
  50,
  60,
  70,
  80,
  90,
  100,
];

List<String> Duration_Names = [
  '25 ms',
  '50 ms',
  '100 ms',
  '250 ms',
  '500 ms',
  '1 s',
  '2 s',
  '3 s',
  '5 s',
  '10 s',
];

List<int> Duration_Values = [
  25,
  50,
  100,
  250,
  500,
  1000,
  2000,
  3000,
  5000,
  10000,
];

double getDoubleFromString(String _tmp, String _start, String _end) {
  String _result = _tmp;
  double _val = 0.0;
  _result = _result.substring(_tmp.indexOf(_start), _tmp.indexOf(_end));
  return _val = double.parse(_result.substring(_start.length));
}

class Parameter {
  String name;
  double value;
  String unit;
  String cmd;
  double g;
  dynamic widgetA;
  dynamic widgetB;

  Parameter({
    required this.name,
    required this.value,
    required this.unit,
    required this.cmd,
    required this.g,
  });
}
