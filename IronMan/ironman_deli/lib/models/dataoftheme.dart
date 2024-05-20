import 'package:flutter/material.dart';

class Dataoftheme {
  ThemeData newTheme() {
    return ThemeData(
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.all(8.0)),
          foregroundColor: WidgetStatePropertyAll(Colors.black),
          backgroundColor: WidgetStatePropertyAll(Colors.white),
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
          fixedSize: WidgetStatePropertyAll(Size(85, 200)),
          surfaceTintColor: WidgetStatePropertyAll(
              Colors.green), // Your preferred shade of green
          side: WidgetStatePropertyAll(BorderSide(color: Colors.green)),
          elevation: WidgetStatePropertyAll(6),
          shadowColor: WidgetStatePropertyAll(Colors.black),
          backgroundColor: WidgetStatePropertyAll(
              Colors.yellow), // Set your preferred shade of yellow here
          shape: WidgetStatePropertyAll(
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
      colorScheme: const ColorScheme.dark(surface: Colors.black),
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
              padding: WidgetStatePropertyAll(EdgeInsets.all(8.0)),
              foregroundColor: WidgetStatePropertyAll(Colors.black),
              backgroundColor: WidgetStatePropertyAll(Colors.white))),
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
            surfaceTintColor: const WidgetStatePropertyAll(
              Color.fromARGB(255, 17, 65, 3),
            ),
            side: const WidgetStatePropertyAll(BorderSide(
              color: Color.fromARGB(255, 17, 65, 3),
            )),
            elevation: const WidgetStatePropertyAll(6),
            shadowColor: const WidgetStatePropertyAll(Colors.black),
            backgroundColor: const WidgetStatePropertyAll(
              Color.fromARGB(255, 17, 65, 3),
            ),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
        textStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.black, surfaceTintColor: Colors.green),
      cardTheme: const CardTheme(color: Color.fromARGB(255, 22, 49, 23)),
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(surface: Colors.black),
      appBarTheme:
          const AppBarTheme(backgroundColor: Color.fromARGB(255, 0, 74, 2)),
      useMaterial3: true,
    );
  }

  ThemeData oldThemeLight(context) {
    return ThemeData(
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.all(8.0)),
              foregroundColor: WidgetStatePropertyAll(Colors.black),
              backgroundColor: WidgetStatePropertyAll(Colors.white))),
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
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(123, 255, 193, 7),
      ),
      listTileTheme: const ListTileThemeData(
          titleAlignment: ListTileTitleAlignment.center),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.black)),
          filled: true,
          isDense: true,
          fillColor: const Color.fromARGB(255, 17, 65, 3),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: Colors.black, width: 2, style: BorderStyle.solid)),
        ),
        menuStyle: MenuStyle(
            surfaceTintColor: const WidgetStatePropertyAll(
              Colors.white,
            ),
            side: const WidgetStatePropertyAll(BorderSide(
              color: Color.fromARGB(255, 17, 65, 3),
            )),
            elevation: const WidgetStatePropertyAll(6),
            shadowColor: const WidgetStatePropertyAll(Colors.black),
            backgroundColor: const WidgetStatePropertyAll(
              Color.fromARGB(115, 255, 193, 7),
            ),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white, surfaceTintColor: Colors.green),
      //cardTheme: const CardTheme(color: Color.fromARGB(255, 255, 255, 255)),
      scaffoldBackgroundColor: const Color.fromARGB(255, 250, 249, 246),
      colorScheme:
          const ColorScheme.light(surface: Color.fromARGB(255, 255, 255, 255)),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 0, 74, 2),
          foregroundColor: Colors.white),
      useMaterial3: true,
    );
  }

  ThemeData oldThemeLightnew(context) {
    return ThemeData(
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.all(8.0)),
              foregroundColor: WidgetStatePropertyAll(Colors.black),
              backgroundColor: WidgetStatePropertyAll(Colors.white))),
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
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(123, 255, 193, 7),
      ),
      listTileTheme: const ListTileThemeData(
          titleAlignment: ListTileTitleAlignment.center),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.black)),
          filled: true,
          isDense: true,
          fillColor: const Color.fromARGB(255, 17, 65, 3),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: Colors.black, width: 2, style: BorderStyle.solid)),
        ),
        menuStyle: MenuStyle(
            surfaceTintColor: const WidgetStatePropertyAll(
              Colors.white,
            ),
            side: const WidgetStatePropertyAll(BorderSide(
              color: Color.fromARGB(255, 17, 65, 3),
            )),
            elevation: const WidgetStatePropertyAll(6),
            shadowColor: const WidgetStatePropertyAll(Colors.black),
            backgroundColor: const WidgetStatePropertyAll(
              Color.fromARGB(115, 255, 193, 7),
            ),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white, surfaceTintColor: Colors.green),
      cardTheme: const CardTheme(
        surfaceTintColor: Colors.amber,
        elevation: 10,
        shadowColor: Color.fromARGB(115, 255, 193, 7),
        color: Color.fromARGB(0, 255, 255, 255),
      ),
      scaffoldBackgroundColor: const /*new color*/ Color.fromARGB(255, 233, 214,
          161), // original colorconst Color.fromARGB(255, 250, 249, 246),
      colorScheme:
          const ColorScheme.light(surface: Color.fromARGB(255, 255, 255, 255)),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 0, 74, 2),
          foregroundColor: Colors.white),
      useMaterial3: true,
    );
  }
}
