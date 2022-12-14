import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/pages/beers/beers_page.dart';
import 'package:flutter_samples/pages/calculator/calculator_page.dart';
import 'package:flutter_samples/pages/heroes/heroes_page.dart';

import 'pages/apod/apod_page.dart';
import 'package:geolocator/geolocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _title = 'Flutter Demo: Calculator';

  Widget _getPage() {
    switch (_selectedIndex) {
      case 0:
        return CalculatorPage();
      case 1:
        return HeroesPage();
      case 2:
        return ApodPage();
      case 3:
        return BeersPage();
      default:
        return CalculatorPage();
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Init State');
    _determinePosition().then((position) {
      print('POSITION => ' + position.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _getPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(_title,
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Calculator'),
              onTap: () {
                setState(() {
                  _title = 'Flutter Demo: Calculator';
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Heroes'),
              onTap: () {
                setState(() {
                  _title = 'Flutter Demo: Heroes';
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Apod'),
              onTap: () {
                setState(() {
                  _title = 'Flutter Demo: Apod';
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Beers'),
              onTap: () {
                setState(() {
                  _title = 'Flutter Demo: Beers';
                  _selectedIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
