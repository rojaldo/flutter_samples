import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_samples/models/apod.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
  Widget _apodWidget = Container();

  Future<http.Response> _fetchApod(String url) {
    return http.get(Uri.parse(url));
  }

  void _getApod([String date = '']) {
    String key = 'Wrong_Key';
    String url = 'https://api.nasa.gov/planetary/apod?api_key=$key';
    if (date != '') {
      url += '&date=$date';
    }
    _fetchApod(url).then((response) {
      if (response.statusCode == 200) {
        _apod = Apod.fromJson(jsonDecode(response.body));

        setState(() {
          _title = _apod.title;
          _date = _apod.date;
          _explanation = _apod.explanation;
          _url = _apod.url;
          _apodWidget = _createApodWidget(response.statusCode);
        });
      } else if (response.statusCode == 403) {
        setState(() {});
      }
    }, onError: (error) {
      print('ERROR: $error');
      setState(() {});
    });
  }

  Widget _createApodWidget(int responseCode) {
    if (responseCode == -1) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (responseCode == 200) {
      return Card(
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
      );
    } else if (responseCode == 403) {
      return const Card(
        child: Text('Error getting apod: WRONG_KEY'),
      );
    } else if (responseCode >= 400 && responseCode < 500) {
      return Card(
        child: Text('Error getting apod: $responseCode'),
      );
    } else if (responseCode >= 500) {
      return Card(
        child: Text('Internal Error getting apod: $responseCode'),
      );
    } else {
      return const Center(
        child: Text('Unknown error'),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _getApod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apod'),
      ),
      body: SingleChildScrollView(child: _apodWidget),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(1995, 6, 15),
              maxTime: DateTime.now(), onConfirm: (date) {
            String dateString = '${date.year}-${date.month}-${date.day}';
            _getApod(dateString);
          }, currentTime: DateTime.now(), locale: LocaleType.es);
        },
        child: const Icon(Icons.calendar_month),
      ),
    );
  }
}
