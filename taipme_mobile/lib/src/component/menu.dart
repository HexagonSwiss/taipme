import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

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
      backgroundColor: TaipmeStyle.backgroundColor,
      width: 230,
      child: Container(
        height: MediaQuery.of(context)
            .size
            .height, // Altezza pari all'intero schermo
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => ref.read(goRouterProvider).pop(),
                        icon: const Icon(Icons.close,
                            color: TaipmeStyle.backgroundColor, size: 30),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: TaipmeStyle.backgroundColorInput,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            'Pippo',
                            style: TextStyle(
                              color: Color(0xFFFDD26A),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'PLuto',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: TaipmeStyle.backgroundColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextButton(
                          onPressed: () {
                            ref.read(goRouterProvider).go('/');
                          },
                          child: Row(
                            children: [
                              Icon(Icons.home_outlined,
                                  color: Colors.white, size: 25),
                              SizedBox(width: 8.0),
                              Text(
                                'Test',
                                style: TextStyle(
                                    fontSize: TaipmeStyle.atomIconSize,
                                    fontWeight: FontWeight.w600,
                                    color: TaipmeStyle.backgroundColor),
                              ),
                            ],
                          )),
                      SizedBox(height: spaceBetweenItems),
                      TextButton(
                        onPressed: () {
                          debugPrint('View: navigating to /profile');
                          ref.read(goRouterProvider).go('/profile');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons
                                  .account_circle, // Usa l'icona passata come parametro
                              color: Colors.white,
                              size:
                                  25, // Opzionale: imposta la dimensione in base alla dimensione del testo
                            ),
                            SizedBox(
                                width: 8.0), // Spaziatura tra testo e icona
                            Text(
                              'Other Test',
                              style: TextStyle(
                                fontSize: TaipmeStyle.extraLargeTextSize,
                                fontWeight: TaipmeStyle.lightFontWeight,
                                color: TaipmeStyle.backgroundColorInput,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                  TextButton(
                    onPressed: () async {
                      // await ref.read(firebaseAuthInstanceProvider).signOut();
                      ref.read(goRouterProvider).go('/login');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.logout_outlined,
                            color: Colors.white, size: 25),
                        SizedBox(width: 8.0),
                        Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: TaipmeStyle.extraLargeIconSize,
                              fontWeight: FontWeight.w600,
                              color: TaipmeStyle.backgroundColor),
                        ),
                      ],
                    ),
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