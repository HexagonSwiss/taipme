import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/util/enum/bottom_nav_enum.dart';

part 'bottom_nav_controller.g.dart';

@Riverpod(keepAlive: true)  
class BottomNavController extends _$BottomNavController {
  @override
  BottomNavEnum build() => BottomNavEnum.home;

  void setBottomNav(BottomNavEnum bottomNav) => state = bottomNav;
}