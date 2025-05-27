import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/bottom_nav_bar/bottom_nav_bar_item.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/src/util/enum/bottom_nav_enum.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: TaipmeStyle.appFooterColor, 
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TaipmeStyle.roundedRadius),
          topRight: Radius.circular(TaipmeStyle.roundedRadius),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // BottomNavBarItem(
          //   route: '/chat-page',
          //   bottomNavEnum: BottomNavEnum.chat,
          // ),
          BottomNavBarItem(
            route: '/',
            bottomNavEnum: BottomNavEnum.home,
          ),
          BottomNavBarItem(
            route: '/settings-page',
            bottomNavEnum: BottomNavEnum.settings,
          ),
        ],
      ),
    );
  }
}
