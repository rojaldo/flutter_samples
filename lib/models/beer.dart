class Beer {
  String _name = '';
  String _description = '';
  String _imageUrl = '';
  double _abv = 0.0;
  String _tagline = '';

  Beer();

  Beer.fromJson(Map<String, dynamic> json) {
    // get beers from root component and add to list
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['image_url'];
    _abv = json['abv'];
    _tagline = json['tagline'];
  }

  String get name => _name;
  String get description => _description;
  String get imageUrl => _imageUrl;
  double get abv => _abv;
  String get tagline => _tagline;
}
