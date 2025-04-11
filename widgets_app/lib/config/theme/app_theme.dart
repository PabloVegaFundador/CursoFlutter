import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.pink,
  Colors.brown,
  Colors.purple,
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
    : assert(selectedColor >= 0, "Selected color must be greather than 0"),
      assert(
        selectedColor < colorList.length,
        'Selected color must be less or equal than ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark: Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(centerTitle: false),
  );
}
