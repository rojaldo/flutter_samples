import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_samples/models/apod.dart';
import 'package:http/http.dart' as http;

class ApodPage extends StatefulWidget {
  const ApodPage({Key? key}) : super(key: key);

  @override
  State<ApodPage> createState() => _ApodPageState();
}

class _ApodPageState extends State<ApodPage> {
  String _title = '';
  String _explanation = '';
  String _url = '';
  String _date = '';
  Apod _apod = Apod();

  Future<http.Response> _fetchApod() {
    return http.get(
        Uri.parse('https://api.nasa.gov/planetary/apod?api_key=WRONG_KEY'));
  }

  void _getApod() {
    _fetchApod().then((response) {
      if (response.statusCode == 200) {
        _apod = Apod.fromJson(jsonDecode(response.body));
        setState(() {
          _title = _apod.title;
          _date = _apod.date;
          _explanation = _apod.explanation;
          _url = _apod.url;
        });
      } else {
        print('Error getting apod');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getApod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apod'),
      ),
      body: Center(
        child: Card(
          child: SizedBox(
            child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Text(_title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                Image.network(_url),
                Text(_explanation, style: const TextStyle(fontSize: 14)),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
