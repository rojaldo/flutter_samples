class MyHero {
  final String _name;
  String _alterEgo;

  MyHero(this._name, this._alterEgo);

  String get name => _name;
  String get alterEgo => _alterEgo;

  set alterEgo(String newAlterEgo) {
    if (newAlterEgo.isNotEmpty) {
      _alterEgo = newAlterEgo;
    }
  }
}
