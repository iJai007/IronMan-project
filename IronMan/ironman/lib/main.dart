import 'package:flutter/material.dart';
import 'package:ironman/home.dart';
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
      theme: ThemeData(
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(8.0)),
                foregroundColor: MaterialStatePropertyAll(Colors.black),
                backgroundColor: MaterialStatePropertyAll(Colors.white))),
        inputDecorationTheme: InputDecorationTheme(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width / 1.2),
            contentPadding: const EdgeInsets.all(15.0),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.white, width: 2.0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.white))),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 17, 65, 3),
        ),
        listTileTheme: const ListTileThemeData(
            titleAlignment: ListTileTitleAlignment.center),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            isDense: true,
            fillColor: const Color.fromARGB(255, 17, 65, 3),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: Colors.white, width: 2, style: BorderStyle.solid)),
          ),
          menuStyle: MenuStyle(
              surfaceTintColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 17, 65, 3),
              ),
              side: MaterialStateProperty.all(const BorderSide(
                color: Color.fromARGB(255, 17, 65, 3),
              )),
              elevation: MaterialStateProperty.all(6),
              shadowColor: MaterialStateProperty.all(Colors.black),
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 17, 65, 3),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
          textStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
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
