import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_samples/models/beer.dart';
import 'package:http/http.dart' as http;

class BeersPage extends StatefulWidget {
  const BeersPage({Key? key}) : super(key: key);

  @override
  _BeersPageState createState() => _BeersPageState();
}

class _BeersPageState extends State<BeersPage> {
  final List<Beer> _beers = [];

  void _getBeers() {
    http.get(Uri.parse('https://api.punkapi.com/v2/beers')).then((response) {
      if (response.statusCode == 200) {
        // get beers from response
        var jsonBeers = jsonDecode(response.body);
        for (var jsonBeer in jsonBeers) {
          _beers.add(Beer.fromJson(jsonBeer));
        }
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBeers();
  }

  Card _createBeerWidget(Beer beer) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(
            beer.imageUrl,
            width: 100,
          ),
          Text(beer.name),
          Text(beer.tagline),
          Text(beer.description),
          Text(beer.abv.toString()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beers'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: _beers.map((beer) => _createBeerWidget(beer)).toList(),
      )),
    );
  }
}
