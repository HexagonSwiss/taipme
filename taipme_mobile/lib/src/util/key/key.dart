
import 'dart:ui';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum AppFilterEnum {
  @JsonValue("destination")
  destination,
  @JsonValue("none")
  none,
}

extension AppFilterToPath on AppFilterEnum {
  String get path {
    switch (this) {
      case AppFilterEnum.destination:
        return "assets/category/destination.png";
      case AppFilterEnum.none:
        return "";
    }
  }
}

extension AppFilterToColor on AppFilterEnum {
  Color get color {
    switch (this) {
      case AppFilterEnum.destination:
        return TaipmeStyle.primaryColor;
      case AppFilterEnum.none:
        return TaipmeStyle.primaryColor;
    }
  }
}
