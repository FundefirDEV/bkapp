import 'package:flutter/material.dart';

// NOTE Just the primaryColor, primaryColorDark & grayColor
// have color swatches (50, 100, 200...)

Map<int, Color> primaryDarkCodes = {
  50: Color.fromRGBO(44, 90, 145, 1),
  100: Color.fromRGBO(20, 35, 97, 1),
};

Map<int, Color> primaryCodes = {
  50: Color.fromRGBO(135, 218, 248, 1),
  100: Color.fromRGBO(86, 197, 255, 1),
  200: Color.fromRGBO(29, 136, 192, 1),
};

Map<int, Color> textCodes = {
  50: Color.fromRGBO(236, 236, 236, 1),
  100: Color.fromRGBO(216, 216, 216, 1),
  200: Color.fromRGBO(166, 164, 164, 1),
  300: Color.fromRGBO(92, 92, 92, 1),
  400: Color.fromRGBO(42, 42, 42, 1),
};

extension CustomColorScheme on ColorScheme {
  MaterialColor get primaryColor =>
    MaterialColor(0xFF1D88C0, primaryCodes);
  MaterialColor get primaryColorDark =>
    MaterialColor(0xFF142361, primaryDarkCodes);
  Color get accentColor => Color(0xFFFDCD15);
  MaterialColor get grayColor =>
    MaterialColor(0xFF5C5C5C, textCodes);
  Color get errorColor => Color(0xFFE96161);
}
