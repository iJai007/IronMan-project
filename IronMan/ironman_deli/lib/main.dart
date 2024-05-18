import 'package:flutter/material.dart';
import 'package:ironman_deli/appHome.dart';
import 'package:ironman_deli/models/dataoftheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Dataoftheme().oldThemeLightnew(context),
      home: const AppHome(),
    );
  }
}
