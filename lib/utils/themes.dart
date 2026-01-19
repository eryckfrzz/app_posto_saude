import 'package:flutter/material.dart';

class Themes {
  Themes({required this.isDarkMode, required this.fontScale});

  final bool isDarkMode;
  final double fontScale;

  Color get _primaryColor => isDarkMode ? Colors.black : Colors.white;
  Brightness get _brightness => isDarkMode ? Brightness.dark : Brightness.light;

  static Themes get initial => Themes(isDarkMode: false, fontScale: 1.0);

  ThemeData generateThemeData() {
    final Color colorSeed = isDarkMode ? Colors.black : Colors.blueGrey;
    final Brightness brightness = isDarkMode
        ? Brightness.dark
        : Brightness.light;

    final TextTheme customTextTheme = TextTheme(
      displaySmall: TextStyle(
        fontSize: 16 * fontScale,
        overflow: TextOverflow.ellipsis,
      ),
      displayMedium: TextStyle(
        fontSize: 24 * fontScale,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
      displayLarge: TextStyle(
        fontSize: 36 * fontScale,
        fontWeight: FontWeight.w700,
        overflow: TextOverflow.ellipsis,
      ),
      labelMedium: TextStyle(
        color: isDarkMode ? Colors.white70 : Colors.black87,
        fontSize: 16 * fontScale,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return ThemeData(
      useMaterial3: true,

      brightness: brightness,

      textTheme: customTextTheme,

      colorScheme: ColorScheme.fromSeed(
        seedColor: colorSeed,
        brightness: brightness,
      ),
    );
  }

  Themes copyWith({bool? isDarkMode, double? fontScale}) {
    return Themes(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      fontScale: fontScale ?? this.fontScale,
    );
  }
}
