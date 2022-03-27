// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter/material.dart';

// FlutterTts flutterTts = FlutterTts();

// class CurrentLocationScreen extends StatefulWidget {
//   const CurrentLocationScreen({Key? key}) : super(key: key);

//   @override
//   _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
// }

// class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
//   FlutterTts flutterTts = FlutterTts();
//   late GoogleMapController googleMapController;
//   static const CameraPosition initialCameraPosition = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   Set<Marker> markers = {};
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         initialCameraPosition: initialCameraPosition,
//         markers: markers,
//         zoomControlsEnabled: false,
//         mapType: MapType.normal,
//         onMapCreated: (GoogleMapController controller) {
//           googleMapController = controller;
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         backgroundColor: Color(0xFF014268),
//         onPressed: () async {
//           Position position = await _determinePosition();

//           googleMapController.animateCamera(CameraUpdate.newCameraPosition(
//               CameraPosition(
//                   target: LatLng(position.latitude, position.longitude),
//                   zoom: 14)));
//           markers.clear();
//           Future _speak() async {
//             markers.add(Marker(
//                 markerId: const MarkerId('currentLocation'),
//                 position: LatLng(position.latitude, position.longitude)));

//             await flutterTts.speak('');
//           }

//           _speak();
//           setState(() {});
//         },
//         label: const Text("Tell My Location"),
//         icon: const Icon(Icons.location_history),
//       ),
//     );
//   }

//   Future<Position> _determinePosition() async {
//     // ignore: unused_local_variable
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();

//       if (permission == LocationPermission.denied) {
//         return Future.error("Location Permission Denied");
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error("Location Permissions Are Permanently Denied");
//     }
//     Position position = await Geolocator.getCurrentPosition();
//     return position;
//   }
// }

// ignore_for_file: prefer_const_constructors

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
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
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
          Container(
              //   child: Center(
              //     child: Image.asset('images/ollin_transparent.png'),

              //   ),
              ),
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
          // height: 70,
          // width: 528,

          //   width: MediaQuery.of(context).size.width,
          //   margin: EdgeInsets.only(bottom: 50.0),
          //   child: ElevatedButton(
          //       style: ButtonStyle(
          //         backgroundColor:
          //             MaterialStateProperty.all<Color>(Color(0xFF014268)),
          //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //             RoundedRectangleBorder(
          //                 // borderRadius: BorderRadius.circular(25.0),
          //                 )),
          //       ),
          //       onPressed: () async {
          //         Position position = await _getGeoLocationPosition();
          //         location =
          //             'Lat: ${position.latitude} , Long: ${position.longitude}';
          //         GetAddressFromLatLong(position);
          //       },
          //       child: Padding(
          //         padding: EdgeInsets.only(top: 40, bottom: 40),
          //         child: Text(
          //           'Tell My Location',
          //           style: TextStyle(fontSize: 24.0),
          //         ),
          //       )),
          // ),
          Container(
            // height: 300,
            // width: 400,

            child: Text(
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

          //    Container(
          // height: 102,
          //   width: 300,
          //   margin: EdgeInsets.only(
          //       top: 100.0, left: 30.0, right: 30.0, bottom: 0.0),
          //   child: ElevatedButton(
          //     style: ButtonStyle(
          //       backgroundColor:
          //           MaterialStateProperty.all<Color>(Color(0xFF014268)),
          //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //           RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(25.0),
          //       )),
          //     ),
          //     onPressed: () async {
          //         Position position = await _getGeoLocationPosition();
          //         location =
          //             'Lat: ${position.latitude} , Long: ${position.longitude}';
          //         GetAddressFromLatLong(position);
          //       },
          //     child: Align(
          // alignment: Alignment.bottomCenter,
          //     child: Text(
          //       'Tell My Location',
          //       style: TextStyle(fontSize: 24.0),
          //     ),
          //     ),
          //   ),
          // ),
          //   ElevatedButton(
          //       onPressed: () async {
          //         Position position = await _getGeoLocationPosition();
          //         location =
          //             'Lat: ${position.latitude} , Long: ${position.longitude}';
          //         GetAddressFromLatLong(position);
          //       },
          //       child: Text('Get Location'))
        ],
      ),
    );
  }
}
