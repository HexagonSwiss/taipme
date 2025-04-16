import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/controller/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/src/util/enum/bottom_nav_enum.dart';

class BottomNavBarItem extends ConsumerWidget {
  const BottomNavBarItem({
    super.key,
    required this.route,
    required this.bottomNavEnum,
  });

  final String route;
  final BottomNavEnum bottomNavEnum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBarController = ref.watch(bottomNavControllerProvider);

    return Transform.translate(
      offset: bottomNavBarController == bottomNavEnum
          ? Offset(0, -40)
          : Offset(0, 0), // Sposta l'icona verso l'alto se selezionata
      child: Container(
        decoration: BoxDecoration(
          color: TaipmeStyle.appFooterColor, // Colore di sfondo
          shape: BoxShape.circle, // Forma circolare
          border: Border.all(
            color: bottomNavBarController == bottomNavEnum
                ? TaipmeStyle.backgroundColor
                : TaipmeStyle.appFooterColor, // Colore del bordo
            width: 15,
          ),
        ),
        padding: EdgeInsets.all(13),
        child: IconButton(
          iconSize: 40,
          onPressed: () {
            ref
                .read(bottomNavControllerProvider.notifier)
                .setBottomNav(bottomNavEnum);
            ref.read(goRouterProvider).go(route);
          },
          icon: Icon(
            switch (bottomNavEnum) {
          BottomNavEnum.home => Icons.home_outlined,
          BottomNavEnum.chat => Icons.chat_bubble_outline_rounded,
          BottomNavEnum.settings => Icons.settings_outlined,
            },
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
