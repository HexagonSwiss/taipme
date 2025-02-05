import 'package:flutter/material.dart';

class TaipmeStyle {
// ------------------ GLOBAL ------------------

// FONT
  static const String primaryFont = 'Lucida';

// TEXT SIZE
  static const double giantTextSize = 40;
  static const double extraLargeTextSize = 30;
  static const double largeTextSize = 26;
  static const double standardTextSize = 18;
  static const double smallTextSize = 16;
  static const double miniTextSize = 14;

// FONT WEIGHT
  static const FontWeight boldFontWeight = FontWeight.w700;
  static const FontWeight semiBoldFontWeight = FontWeight.w600;
  static const FontWeight standardFontWeight = FontWeight.w500;
  static const FontWeight lightFontWeight = FontWeight.w400;

// BORDER RADIUS
  static const double roundedRadius = 30;
  static const double standardRadius = 12;
  static const double lightRadius = 8;

// ICON SIZE
  static const double extraLargeIconSize = 64;
  static const double giantIconSize = 56;
  static const double largeIconSize = 48;
  static const double standardIconSize = 33;
  static const double smallIconSize = 24;
  static const double miniIconSize = 20;
  static const double atomIconSize = 8;

// COLOR
  // ----------------- MAIN COLORS -----------------
  static const Color primaryColor = Color(0xFFFEFEFE);
  static const Color backgroundColor = Color(0xFF000000);
  static const Color removeColor = Color(0xFFD95F5F);
  static const Color errorColor = Color(0xFFFD6E35);

  // ----------------- TEXT COLOR -----------------
  static const Color inputFieldTextColor = Color(0xFFFEFEFE); // Used in Destination, Activity, etc
  static const Color inputFieldLightTextColor = Color(0xFFFEFEFE); // Used in Destination, Activity, etc

// GRADIENT COLORS

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF01FCC6),
      Color(0xFF03EFFB),
    ],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF62C6C9),
      Color(0xFF3B9FDF),
    ],
  );
}
