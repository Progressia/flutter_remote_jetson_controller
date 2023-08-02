import 'dart:ui';
import 'package:flutter/material.dart';
import 'pages/dashboard.dart';
import 'pages/settings.dart';
import 'widgets/message.dart';
import 'globals.dart' as globals;
import 'dart:async';
import 'services/api.dart';
import 'dart:convert';
import 'dart:io';
import '../widgets/indicator.dart';
// import 'package:flutter_gstreamer_player/flutter_gstreamer_player.dart';

class MyAppWidget extends StatefulWidget {
  // GstPlayer gst_view = GstPlayer(
  //   pipeline: '''udpsrc port=5001 caps =
  //               "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" !
  //               rtph264depay !
  //               h264parse !
  //               decodebin !
  //               videoconvert !
  //               video/x-raw,format=RGBA !
  //               appsink name=sink''',
  // );

  late List<Message> messages;
  String lastMsg = '';

  MyAppWidget({super.key});

  @override
  State<MyAppWidget> createState() => _MyAppWidgetState();
}

class _MyAppWidgetState extends State<MyAppWidget> {
  int bottomSelectedIndex = 0;
  bool _conState = false;

  var url;
  var Data;
  String QueryText = 'QUERY';
  // bool _updateDataStart = false;

  List<Message> _messages = <Message>[];

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void addMessage(dynamic text) {
    _messages.add(Message(text: text));
    List<Message> messages = new List<Message>.from(_messages);
    setState(() {
      _messages = messages;
      widget.lastMsg = _messages.last.text;
    });
  }

  void updateConnectionState(bool _state) {
    setState(() {
      _conState = _state;
    });
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        DashboardPage(
          sendMessage: _postData,
        ),
        SettingsPage(
          sendMessage: _postData,
        ),
      ],
    );
  }

  @override
  void initState() {
    Timer mytimer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      if (_conState == true) {
        _getData();
      }
    });
    super.initState();
  }

  @override
  void _postData(String data) async {
    url = 'http://192.168.43.70:5000/api?' + data;
    print(data);
    Data = await PostData(url);
  }

  @override
  void _getData() async {
    url = 'http://192.168.43.70:5000/api?Query=Hi';
    Data = await GetData(url);

    try {
      var DecodedData = jsonDecode(Data);
      setState(() {
        QueryText = DecodedData['Query'];
        // print(QueryText);
        _sortLastMsg(QueryText);
      });
    } catch (e) {}
  }

  void _sortLastMsg(String msg) {
    String _tmp = msg;
    try {
      // Get p0
      globals.settings_var[0].value =
          globals.getDoubleFromString(_tmp, 'p0:', 'p1:');

      // Get p1
      globals.settings_var[1].value =
          globals.getDoubleFromString(_tmp, 'p1:', 'p2:');

      // Get p2
      globals.settings_var[2].value =
          globals.getDoubleFromString(_tmp, 'p2:', 'p3:');

      // Get p3
      globals.settings_var[3].value =
          globals.getDoubleFromString(_tmp, 'p3:', 'p4:');

      // Get p4
      globals.settings_var[4].value =
          globals.getDoubleFromString(_tmp, 'p4:', 'p5:');

      // Get p5
      globals.settings_var[5].value =
          globals.getDoubleFromString(_tmp, 'p5:', 'p6:');

      // Get p6
      globals.settings_var[6].value =
          globals.getDoubleFromString(_tmp, 'p6:', 'p7:');

      // Get p7
      globals.settings_var[7].value =
          globals.getDoubleFromString(_tmp, 'p7:', 'p8:');

      // Get p8
      globals.settings_var[8].value =
          globals.getDoubleFromString(_tmp, 'p8:', 'p9:');

      // Get p9
      globals.settings_var[9].value =
          globals.getDoubleFromString(_tmp, 'p9:', 'p10:');

      // Get p10
      globals.settings_var[10].value =
          globals.getDoubleFromString(_tmp, 'p10:', 'p11:');

      // Get p11
      globals.settings_var[11].value =
          globals.getDoubleFromString(_tmp, 'p11:', 'p12:');

      // Get p12
      globals.settings_var[12].value =
          globals.getDoubleFromString(_tmp, 'p12:', '}');

      // Get p13
      globals.monitor_variables[0].value =
          globals.getDoubleFromString(_tmp, 'p13:', 'p14:');

      // Get p14
      globals.monitor_variables[1].value =
          globals.getDoubleFromString(_tmp, 'p14:', 'p15:');

      // Get p15
      globals.monitor_variables[2].value =
          globals.getDoubleFromString(_tmp, 'p15:', 'p16:');

      // Get p16
      globals.monitor_variables[3].value =
          globals.getDoubleFromString(_tmp, 'p16:', 'p17:');

      // Get p17
      globals.monitor_variables[4].value =
          globals.getDoubleFromString(_tmp, 'p17:', 'p18:');

      // Get p18
      globals.monitor_variables[5].value =
          globals.getDoubleFromString(_tmp, 'p18:', '}');
    } catch (e) {}
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 200), curve: Curves.slowMiddle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Jetson Balancing Robot'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _conState ^= true;
              });
            },
            icon: (!_conState)
                ? Icon(Icons.wifi_find, color: Colors.grey)
                : Icon(
                    Icons.wifi,
                    color: Colors.blue,
                  ),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              // AspectRatio(
              //   aspectRatio: 16 / 9,
              //   child: Center(
              //     child: widget.gst_view,
              //   ),
              // ),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.transparent,
                            HexColor.fromHex('#303030'),
                          ],
                          stops: [
                            0.8,
                            0.99
                          ])),
                ),
              ),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Top Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Indicator(data: globals.monitor_variables[0]),
                            Indicator(data: globals.monitor_variables[1]),
                            Indicator(data: globals.monitor_variables[2]),
                          ],
                        ),
                        //Center Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                        //Bottom row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Indicator(data: globals.monitor_variables[3]),
                            Indicator(data: globals.monitor_variables[4]),
                            Indicator(data: globals.monitor_variables[5]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: buildPageView(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
