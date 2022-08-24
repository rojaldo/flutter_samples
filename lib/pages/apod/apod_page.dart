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
  Apod _apod = Apod();

  Future<http.Response> _fetchApod() {
    return http.get(Uri.parse(
        'https://api.nasa.gov/planetary/apod?api_key=tqz634Z1x0LiJzjbhSyUoExrZaGKLM0MG1VnROR6'));
  }

  void _getApod() {
    _fetchApod().then((response) {
      if (response.statusCode == 200) {
        _apod = Apod.fromJson(jsonDecode(response.body));
        setState(() {
          _title = _apod.title;
        });
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
        child: Text(_title),
      ),
    );
  }
}
