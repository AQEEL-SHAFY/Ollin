// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ollin/home.dart';
import 'package:ollin/provider/emergency_contacts.dart';
import 'package:ollin/provider/smaple_prvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => EmergencyContacts(),
      ),
      ChangeNotifierProvider(
        create: (context)=>SampleProvider(),
      ),
      ChangeNotifierProvider(
      create: (context)=>SampleProvider(),
      ),
    ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(), ),
    );




  }
}
