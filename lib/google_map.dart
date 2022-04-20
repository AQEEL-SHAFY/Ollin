// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

FlutterTts flutterTts = FlutterTts();

// ignore: use_key_in_widget_constructors
class CurrentLocationScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String location = 'Null, Press Button';
  String Address = 'Location';

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // ignore: avoid_print
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}';

    Future _speak() async {
      await flutterTts.speak(Address);
    }

    _speak();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDCD2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          InkWell(
            onTap: () async {
              Position position = await _getGeoLocationPosition();
              location =
                  'Lat: ${position.latitude} , Long: ${position.longitude}';
              GetAddressFromLatLong(position);
            }, // Handle your callback.
            splashColor: Color(0xFFDEDCD2),

            child: Ink(
              height: 250,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/locator.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // ignore: avoid_unnecessary_containers
          Container(
            child: Text(
              // ignore: unnecessary_string_interpolations
              '$Address',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  color: Colors.grey),
            ),
          ),

          Container(
            // height: 70,
            // width: 528,

            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 50.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF014268)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          // borderRadius: BorderRadius.circular(25.0),
                          )),
                ),
                onPressed: () async {
                  Position position = await _getGeoLocationPosition();
                  location =
                      'Lat: ${position.latitude} , Long: ${position.longitude}';
                  GetAddressFromLatLong(position);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 40),
                  child: Text(
                    'Tell My Location',
                    style: TextStyle(fontSize: 24.0),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
