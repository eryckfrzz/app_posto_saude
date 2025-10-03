import 'package:flutter/material.dart';

abstract class Themes {
  Themes();

  static final Map<String, Color?> _themesColors = {
    'default': Colors.white,
    'dark': Colors.black,
  };

  static final Map<String, Brightness> _themesBrightness = {
    'default': Brightness.light,
    'dark': Brightness.dark,
  };
  static ThemeData getColor(String theme) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _themesColors[theme],
      brightness: _themesBrightness[theme],
      textTheme: const TextTheme(
        displaySmall: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
        displayMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
        displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
