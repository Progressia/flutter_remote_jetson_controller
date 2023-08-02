import 'package:flutter/cupertino.dart';

class Message extends StatelessWidget {
  final String text;

  Message({required this.text});

  Widget build(BuildContext build) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Text(text),
    );
  }
}
