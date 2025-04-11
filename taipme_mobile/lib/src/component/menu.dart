import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/src/util/helper/external_app_launcher/external_app_launcher.dart';

class Menu extends ConsumerWidget {
  const Menu({super.key});

  final double spaceBetweenItems = 15;

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
                          ref.read(goRouterProvider).go('/home-page');
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      TextButton(
                        onPressed: () {
                          ref.read(goRouterProvider).go('/faq-page');
                        },
                        child: Row(
                          children: [
                            Text(
                              'FAQ',
                              style: TextStyle(
                                  fontSize: TaipmeStyle.miniTextSize,
                                  fontWeight: TaipmeStyle.lightFontWeight,
                                  color: TaipmeStyle.backgroundColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: spaceBetweenItems),
                      TextButton(
                          onPressed: () {
                            ref.read(goRouterProvider).go('/contact-us-page');
                          },
                          child: Row(
                            children: [
                              Text(
                                'Contattaci',
                                style: TextStyle(
                                    fontSize: TaipmeStyle.miniTextSize,
                                    fontWeight: TaipmeStyle.lightFontWeight,
                                    color: TaipmeStyle.backgroundColor),
                              ),
                            ],
                          )),
                      SizedBox(height: spaceBetweenItems),
                      TextButton(
                          onPressed: () {
                            ref.read(goRouterProvider).go('/what-is-page');
                          },
                          child: Row(
                            children: [
                              Text(
                                'cos’è Taipme',
                                style: TextStyle(
                                    fontSize: TaipmeStyle.miniTextSize,
                                    fontWeight: TaipmeStyle.lightFontWeight,
                                    color: TaipmeStyle.backgroundColor),
                              ),
                            ],
                          )),
                      SizedBox(height: spaceBetweenItems),
                      TextButton(
                          onPressed: () {
                            ref
                                .read(externalAppLauncherProvider.notifier)
                                .openTelegram();
                            // ref.read(goRouterProvider).go('/faq-page');
                          },
                          child: Row(
                            children: [
                              Text(
                                'telegram',
                                style: TextStyle(
                                    fontSize: TaipmeStyle.miniTextSize,
                                    fontWeight: TaipmeStyle.lightFontWeight,
                                    color: TaipmeStyle.backgroundColor),
                              ),
                            ],
                          )),
                      SizedBox(height: spaceBetweenItems),
                      TextButton(
                          onPressed: () {
                            ref
                                .read(externalAppLauncherProvider.notifier)
                                .openWhatsApp();
                            // ref.read(goRouterProvider).go('/faq-page');
                          },
                          child: Row(
                            children: [
                              Text(
                                'whatsapp',
                                style: TextStyle(
                                    fontSize: TaipmeStyle.miniTextSize,
                                    fontWeight: TaipmeStyle.lightFontWeight,
                                    color: TaipmeStyle.backgroundColor),
                              ),
                            ],
                          )),
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
