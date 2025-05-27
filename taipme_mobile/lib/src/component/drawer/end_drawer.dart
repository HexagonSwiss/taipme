import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/drawer/drawer_item.dart';
import 'package:taipme_mobile/src/component/drawer/language_button.dart';
import 'package:taipme_mobile/src/controller/user_controller/user_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/src/util/helper/external_app_launcher/external_app_launcher.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';

class EndDrawer extends ConsumerWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(0),
        ),
      ),
      shadowColor: TaipmeStyle.backgroundColor,
      backgroundColor: TaipmeStyle.primaryColor,
      width: 230,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ref.read(goRouterProvider).go('/');
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Image.asset(
                            'assets/logo/taipme_bianco.png',
                            width: 150,
                            height: 150,
                            color: TaipmeStyle.backgroundColor,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Scaffold.of(context).closeEndDrawer(),
                        icon: const Icon(Icons.close,
                            color: TaipmeStyle.backgroundColor, size: 30),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 15,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      DrawerItem(
                        title: AppLocalizations.of(context)!.faq,
                        onPressed: () {
                          ref.read(goRouterProvider).go('/faq-page');
                        },
                      ),
                      DrawerItem(
                        title: AppLocalizations.of(context)!.contactUs,
                        onPressed: () {
                          ref.read(goRouterProvider).go('/contact-us-page');
                        },
                      ),
                      DrawerItem(
                        title: AppLocalizations.of(context)!.whatIsTaipme,
                        onPressed: () {
                          ref.read(goRouterProvider).go('/what-is-page');
                        },
                      ),
                      DrawerItem(
                        title: 'telegram',
                        onPressed: () {
                          ref
                              .read(externalAppLauncherProvider.notifier)
                              .openTelegram();
                        },
                      ),
                      DrawerItem(
                        title: 'whatsapp',
                        onPressed: () {
                          ref
                              .read(externalAppLauncherProvider.notifier)
                              .openWhatsApp();
                        },
                      ),
                      LanguageButton(),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          color: TaipmeStyle.backgroundColor,
                          thickness: 1,
                          height: 1,
                        ),
                      ),
                      DrawerItem(
                        title: 'logout',
                        onPressed: () async {
                          await ref
                              .read(userControllerProvider.notifier)
                              .invalidateCachedUser();
                          ref.read(goRouterProvider).go('/login');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
