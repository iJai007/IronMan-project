import 'package:flutter/material.dart';
import 'package:ironman_shop/SignupLogin/logsign.dart';
import 'package:ironman_shop/SignupLogin/signup.dart';
import 'package:ironman_shop/models/dataoftheme.dart';
import 'package:ironman_shop/home.dart';

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
      home: const Home(),
    );
  }
}
