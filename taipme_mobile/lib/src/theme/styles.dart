import 'package:flutter/material.dart';

class TaipmeStyle {
// ------------------ GLOBAL ------------------

// FONT
  static const String primaryFont = 'JosefinSlab';

// TEXT SIZE
  static const double giantTextSize = 40;
  static const double extraLargeTextSize = 30;
  static const double largeTextSize = 25;
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
  static const Color primaryColor = Color(0xFF000000);
  static const Color primaryColorWithOpacity = Color(0x3B62C6C9);
  static const Color lightPrimaryColor = Color(0xFFAFDEDC);
  static const Color secondaryColor = Color(0xFF3B9FDF);
  static const Color backgroundColor = Color(0xFFFEFEFE);
  static const Color slightlyDarkerBackgroundColor = Color(0xFFFCFCFC);
  static const Color lightBackgroundColor = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFFF3F3F3);
  static const Color lightBorderColor = Color(0xEEEEEEEE);
  static const Color lightTextColor = Color(0x464F524D);
  static const Color defaultTextColor = Color(0xFF464F52);
  static const Color darkTextColor = Color(0xFF000000);
  static const Color successColor = Color(0xFF00BCA5);
  static const Color removeColor = Color(0xFFD95F5F);
  static const Color errorColor = Color(0xFFFD6E35);

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
