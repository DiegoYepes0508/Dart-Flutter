import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;

  static ThemeData themelight = ThemeData.light()

      // AppBar Theme

      .copyWith(
          appBarTheme: const AppBarTheme(color: primary, elevation: 0),

          // TextButton Theme

          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: primary)),

          // FLoatingActionsButtons

          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: primary, elevation: 5),

          // ElevetedButtons
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            primary: primary,
            shape: const StadiumBorder(),
            elevation: 0,
          )),
          inputDecorationTheme: const InputDecorationTheme(
              floatingLabelStyle: TextStyle(color: primary),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: primary),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10)))));
}
