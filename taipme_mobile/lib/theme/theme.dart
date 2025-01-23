import 'package:flutter/material.dart';
import 'package:taipme_mobile/theme/styles.dart';

class TaipmeTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: TaipmeStyle.primaryFont,
      colorSchemeSeed: TaipmeStyle.primaryColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        circularTrackColor: TaipmeStyle.primaryColor,
      ),
      scrollbarTheme: const ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll(TaipmeStyle.primaryColor),
      ));
}
