import 'package:flutter/material.dart';
import 'package:ironman/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IronMan',
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(
            backgroundColor: Colors.black, surfaceTintColor: Colors.green),
        cardTheme: const CardTheme(color: Color.fromARGB(255, 22, 49, 23)),
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(background: Colors.black),
        appBarTheme:
            const AppBarTheme(backgroundColor: Color.fromARGB(255, 0, 74, 2)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
