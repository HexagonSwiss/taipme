import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:taipme_mobile/src/component/app_bar/custom_header.dart';
import 'package:taipme_mobile/src/component/button/secondary_button.dart';
import 'package:taipme_mobile/src/component/drawer/end_drawer.dart';
import 'package:taipme_mobile/src/component/home_page/home_message_carousel.dart';
import 'package:taipme_mobile/src/component/home_page/search_field.dart';
import 'package:taipme_mobile/src/component/wiggling_icon.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: const CustomHeader(),
      endDrawer: const EndDrawer(),
      bottomNavigationBar: BottomNavBar(),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: SearchField(),
          ),
          Expanded(
            flex: 65,
            child: HomeMessageCarousel(),
          ),
          Expanded(
            flex: 25,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WigglingIcon(),
                const SizedBox(height: 16),
                SecondaryButton(
                  title: '_${AppLocalizations.of(context)!.write}',
                  onPressed: () {
                    ref.read(goRouterProvider).go('/new-message-page');
                  },
                  icon: Icons.add,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
