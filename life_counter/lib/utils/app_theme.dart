// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

final ThemeData AppTheme = ThemeData(
  fontFamily: 'Sunari',
  primaryColor: Colors.white,
  colorScheme: const ColorScheme.dark(
    primary: Color.fromARGB(255, 118, 57, 57),
    onPrimary: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.transparent,
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStatePropertyAll(Colors.transparent),
      padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(4, 8, 4, 8)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: Colors.white60, width: 1),
        ),
      ),
      backgroundColor: MaterialStatePropertyAll(Colors.transparent),
    ),
  ),
);
