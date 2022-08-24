import 'package:flutter/material.dart';
import 'package:flutter_samples/pages/calculator/display_widget.dart';
import 'package:flutter_samples/pages/calculator/keyboard_widget.dart';
import 'package:flutter_samples/models/calculator_model.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = '';
  final CalculatorModel _model = CalculatorModel();

  void _clear() {
    setState(() {
      _display = '';
    });
  }

  void _onButtonClicked(String s) {
    // if s is number
    if (int.tryParse(s) != null) {
      // parse s as int
      int number = int.parse(s);
      setState(() {
        _display = _model.processNumber(number);
      });
    } else {
      if (s == 'c') {
        _model.clearCalculator();
        _clear();
      } else {
        setState(() {
          _display = _model.processSymbol(s);
        });
      }
    }
    setState(() {});
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
              DisplayWidget(_display),
              KeyboardWidget((String s) => _onButtonClicked(s)),
            ],
          )
        ],
      ),
    );
  }
}
