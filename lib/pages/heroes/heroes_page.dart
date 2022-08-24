import 'package:flutter/material.dart';
import 'package:flutter_samples/models/my_hero.dart';

class HeroesPage extends StatefulWidget {
  const HeroesPage({Key? key}) : super(key: key);

  @override
  State<HeroesPage> createState() => _HeroesPageState();
}

class _HeroesPageState extends State<HeroesPage> {
  late TextEditingController _nameController;
  late TextEditingController _alterEgoController;
  final List<MyHero> _heroes = [
    MyHero('Superman', 'Clark Kent'),
    MyHero('Batman', 'Bruce Wayne')
  ];
  ListView _heroesList = ListView();
  ElevatedButton _newHeroButton = const ElevatedButton(
    onPressed: null,
    child: Text('Add Hero'),
  );
  bool _buttonDisabled = true;

  @override
  void initState() {
    super.initState();
    _heroesList = _getList();
    _nameController = TextEditingController();
    _alterEgoController = TextEditingController();
  }

  ListView _getList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _heroes.length,
      itemBuilder: (context, index) {
        return Column(children: [
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(_heroes[index].name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(_heroes[index].alterEgo,
                      style: const TextStyle(fontSize: 15)),
                ],
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ]);
      },
    );
  }

  void _addHero() {
    _heroes.add(MyHero(_nameController.text, _alterEgoController.text));
    _heroesList = _getList();
    _nameController.clear();
    _alterEgoController.clear();
    setState(() {});
  }

  void _onNameChanged(String s) {
    if (s.isEmpty) {
      _newHeroButton = const ElevatedButton(
        onPressed: null,
        child: Text('Add Hero'),
      );
      if (!_buttonDisabled) {
        _buttonDisabled = true;
        setState(() {});
      }
    } else {
      _newHeroButton = ElevatedButton(
        onPressed: _addHero,
        child: const Text('Add Hero'),
      );
      if (_buttonDisabled) {
        _buttonDisabled = false;
        setState(() {});
      }
    }
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
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Hero name*',
              ),
              onChanged: _onNameChanged,
            ),
            TextField(
              controller: _alterEgoController,
              decoration: const InputDecoration(
                labelText: 'Hero alter ego',
              ),
            ),
            _newHeroButton,
            _heroesList,
          ],
        ),
      ),
    );
  }
}
