import 'package:flutter/material.dart';

class KeyboardWidget extends StatelessWidget {
  const KeyboardWidget(
    this.onButtonClicked, {
    Key? key,
  }) : super(key: key);

  final Function(String) onButtonClicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('7'),
              onPressed: () => onButtonClicked('7'),
            ),
            ElevatedButton(
              child: const Text('8'),
              onPressed: () => onButtonClicked('8'),
            ),
            ElevatedButton(
              child: const Text('9'),
              onPressed: () => onButtonClicked('9'),
            ),
            ElevatedButton(
              child: const Text('/'),
              onPressed: () => onButtonClicked('/'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('4'),
              onPressed: () => onButtonClicked('4'),
            ),
            ElevatedButton(
              child: const Text('5'),
              onPressed: () => onButtonClicked('5'),
            ),
            ElevatedButton(
              child: const Text('6'),
              onPressed: () => onButtonClicked('6'),
            ),
            ElevatedButton(
              child: const Text('*'),
              onPressed: () => onButtonClicked('*'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('1'),
              onPressed: () => onButtonClicked('1'),
            ),
            ElevatedButton(
              child: const Text('2'),
              onPressed: () => onButtonClicked('2'),
            ),
            ElevatedButton(
              child: const Text('3'),
              onPressed: () => onButtonClicked('3'),
            ),
            ElevatedButton(
              child: const Text('-'),
              onPressed: () => onButtonClicked('-'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('c'),
              onPressed: () => onButtonClicked('c'),
            ),
            ElevatedButton(
              child: const Text('0'),
              onPressed: () => onButtonClicked('0'),
            ),
            ElevatedButton(
              child: const Text('='),
              onPressed: () => onButtonClicked('='),
            ),
            ElevatedButton(
              child: const Text('+'),
              onPressed: () => onButtonClicked('+'),
            ),
          ],
        ),
      ],
    );
  }
}
