import 'package:flutter/material.dart';

// NOTE Just the primaryColor, primaryColorDark & grayColor
// have color swatches (50, 100, 200...)

Map<int, Color> primaryDarkCodes = {
  50: Color(0xFF2C5A91),
  100: Color(0xFF142361), // default color
};

Map<int, Color> primaryCodes = {
  50: Color(0xFF87DAF8),
  100: Color(0xFF56C5FF),
  200: Color(0xFF1D88C0), // default color
};

Map<int, Color> textCodes = {
  50: Color(0xFFECECEC),
  100: Color(0xFFD8D8D8),
  200: Color(0xFFA6A4A4),
  300: Color(0xFF5C5C5C), // default color
  400: Color(0xFF2A2A2A),
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
