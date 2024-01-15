import 'package:flutter/material.dart';
import 'package:ironman/home.dart';
import 'package:ironman/models/dataoftheme.dart';
import 'package:ironman/mongoconnect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Mongoconnect().connect;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IronMan',
      theme: Dataoftheme().oldThemeLightnew(context),
      home: const Home(),
    );
  }
}
