import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFC4156F);

class AppTheme {
  List<Color> listColors = [
    _customColor,
    Colors.green,
    Colors.blue,
    Colors.yellow
  ];

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: listColors[0],
      brightness: Brightness.dark,
    );
  }
}
