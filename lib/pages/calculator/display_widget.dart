import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DisplayWidget extends StatelessWidget {
  DisplayWidget(this.display, {Key? key}) : super(key: key);

  String display = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        display,
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
