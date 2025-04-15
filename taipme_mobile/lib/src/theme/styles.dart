import 'package:flutter/material.dart';

class TaipmeStyle {

// ------------------ GLOBAL ------------------

// FONT
  static const String primaryFont = 'Lucida';

// TEXT SIZE
  static const double largeTextSize = 26; // Page titles
  static const double standardTextSize = 14; // Used in textfields, buttons, etc.
  static const double smallTextSize = 10; // User for support text

// FONT WEIGHT
  static const FontWeight standardFontWeight = FontWeight.w400;

// BORDER RADIUS
  /// radius: 20
  static const double roundedRadius = 20; // Used for components like messages
  /// radius: 14
  static const double standardRadius = 14; // Used for buttons, faqs, etc.
  /// radius: 10
  static const double lightRadius = 10; // Used for text fields

// ICON SIZE
  static const double largeIconSize = 30; // Used in the app footer
  static const double standardIconSize = 26; // Used in buttons, icon buttons, etc.
  static const double smallIconSize = 18; // Used in textfields

// COLOR

  // ----------------- MAIN COLORS -----------------
  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFF000000);
  static const Color errorColor = Color(0xFFFA7777);
  static const Color inputFieldBorderColor = Color(0xFF5B5B5B);
  static const Color inputFieldReadOnlyColor = Color(0xFF7A7A7A);
  static const Color appFooterColor = Color(0xFF191919);

}
