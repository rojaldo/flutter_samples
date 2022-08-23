import 'package:flutter/material.dart';
import 'package:flutter_samples/calculator/calculator_page.dart';

class HeroesPage extends StatefulWidget {
  const HeroesPage({Key? key}) : super(key: key);

  @override
  State<HeroesPage> createState() => _HeroesPageState();
}

class _HeroesPageState extends State<HeroesPage> {
  String _message = '';
  late TextEditingController _controller;
  List<String> _heroes = ['Superman', 'Spiderman', 'Batman'];
  Widget _heroesList = ListView();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _heroesList = ListView.builder(
      shrinkWrap: true,
      itemCount: _heroes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_heroes[index]),
        );
      },
    );
  }

  void _setMessage(String s) {
    setState(() {
      _message = s;
      _controller.text = s;
    });
  }

  void _addHero() {
    _heroes.add(_controller.text);
    // update _heroesList
    setState(() {
      _heroesList = ListView.builder(
        shrinkWrap: true,
        itemCount: _heroes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_heroes[index]),
          );
        },
      );
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heroes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _message,
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter a hero',
              ),
            ),
            ElevatedButton(
              child: const Text('Add Hero'),
              onPressed: () => _addHero(),
            ),
            _heroesList,
          ],
        ),
      ),
    );
  }
}
