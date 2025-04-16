import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/app_bar/custom_header.dart';
import 'package:taipme_mobile/src/component/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:taipme_mobile/src/component/drawer/end_drawer.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class LoggedPageStructure extends ConsumerWidget {
  const LoggedPageStructure({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: const CustomHeader(),
      endDrawer: const EndDrawer(),
      bottomNavigationBar: const BottomNavBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: child,
      ),
    );
  }
}
