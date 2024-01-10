import 'package:flutter/material.dart';

class Dataoftheme {
  ThemeData newTheme() {
    return ThemeData(
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(8.0)),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
        ),
        contentPadding: const EdgeInsets.all(15.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green, // Set your preferred shade of green here
      ),
      listTileTheme: const ListTileThemeData(
        titleAlignment: ListTileTitleAlignment.center,
      ),
      dropdownMenuTheme: const DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.green,
        ),
        textStyle: TextStyle(
          color: Colors.white, // Change text color as needed
          fontWeight: FontWeight.bold,
        ),
        menuStyle: MenuStyle(
          fixedSize: MaterialStatePropertyAll(Size(85, 200)),
          surfaceTintColor: MaterialStatePropertyAll(
              Colors.green), // Your preferred shade of green
          side: MaterialStatePropertyAll(BorderSide(color: Colors.green)),
          elevation: MaterialStatePropertyAll(6),
          shadowColor: MaterialStatePropertyAll(Colors.black),
          backgroundColor: MaterialStatePropertyAll(
              Colors.yellow), // Set your preferred shade of yellow here
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
          ),
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.green, // Your preferred shade of green
      ),
      cardTheme: const CardTheme(
        surfaceTintColor: Color.fromARGB(255, 126, 251, 0),
        shadowColor: Colors.black,
        elevation: 8,
        color: Color.fromARGB(
            121, 255, 230, 0), // Set your preferred shade of yellow here
      ),
      scaffoldBackgroundColor:
          const Color.fromARGB(255, 17, 65, 17), // Change background to white
      colorScheme: const ColorScheme.dark(background: Colors.black),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green, // Set your preferred shade of green here
      ),
      useMaterial3: true,
    );
  }

  ThemeData oldTheme(context) {
    return ThemeData(
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(8.0)),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              backgroundColor: MaterialStatePropertyAll(Colors.white))),
      inputDecorationTheme: InputDecorationTheme(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width / 1.2),
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
    );
  }
}
