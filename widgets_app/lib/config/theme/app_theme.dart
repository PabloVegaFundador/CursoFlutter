import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.pink,
  Colors.white,
  Colors.purple,
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(selectedColor >= 0, "Selected color must be greather than 0"),
      assert(
        selectedColor < colorList.length,
        'Selected color must be less or equal than ${colorList.length - 1}',
      );

  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: colorList[selectedColor]);
}
