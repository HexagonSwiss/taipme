import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/controller/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:taipme_mobile/src/util/enum/bottom_nav_enum.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return GestureDetector(
                  onTap: () {
                    ref
                        .read(bottomNavControllerProvider.notifier)
                        .setBottomNav(BottomNavEnum.home);
                    ref.read(goRouterProvider).go('/');
                  },
                  child: Image.asset(
                    'assets/logo/taipme.jpg',
                    width: 150,
                    height: 150,
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 150),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
