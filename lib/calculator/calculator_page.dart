import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = '';

  void _clear() {
    setState(() {
      _display = '';
    });
  }

  void _append(String s) {
    setState(() {
      _display += s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    _display,
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('7'),
                    onPressed: () => _append('7'),
                  ),
                  ElevatedButton(
                    child: const Text('8'),
                    onPressed: () => _append('8'),
                  ),
                  ElevatedButton(
                    child: const Text('9'),
                    onPressed: () => _append('9'),
                  ),
                  ElevatedButton(
                    child: const Text('/'),
                    onPressed: () => _append('/'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('4'),
                    onPressed: () => _append('4'),
                  ),
                  ElevatedButton(
                    child: const Text('5'),
                    onPressed: () => _append('5'),
                  ),
                  ElevatedButton(
                    child: const Text('6'),
                    onPressed: () => _append('6'),
                  ),
                  ElevatedButton(
                    child: const Text('*'),
                    onPressed: () => _append('*'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('1'),
                    onPressed: () => _append('1'),
                  ),
                  ElevatedButton(
                    child: const Text('2'),
                    onPressed: () => _append('2'),
                  ),
                  ElevatedButton(
                    child: const Text('3'),
                    onPressed: () => _append('3'),
                  ),
                  ElevatedButton(
                    child: const Text('-'),
                    onPressed: () => _append('-'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text(','),
                    onPressed: () => _append(','),
                  ),
                  ElevatedButton(
                    child: const Text('0'),
                    onPressed: () => _append('0'),
                  ),
                  ElevatedButton(
                    child: const Text('='),
                    onPressed: () => _append('='),
                  ),
                  ElevatedButton(
                    child: const Text('+'),
                    onPressed: () => _append('+'),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
