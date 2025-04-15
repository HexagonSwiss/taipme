import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/app_bar/custom_header.dart';
import 'package:taipme_mobile/src/component/menu.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class ContactUsPage extends ConsumerStatefulWidget {
  const ContactUsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends ConsumerState<ContactUsPage> {
  final double spaceBetweenItems = 45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: const CustomHeader(),
      endDrawer: const Menu(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 0), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Modificato qui
            children: [
              Column(
                children: [
                  Text(
                    'TaipMe nasce da un pensiero libero e sociale, la piattaforma di TaipMe è a tua disposizione. Chiedi e con piacere ti risponderemo.',
                    style: TextStyle(
                      color: TaipmeStyle.primaryColor,
                      fontSize: TaipmeStyle.standardTextSize,
                    ),
                  ),
                ],
              ),
              SizedBox(height: spaceBetweenItems),
              Column(
                children: [
                  Text(
                    'Informazioni, business, collaborazioni, curiosità, per conoscerci, scrivi a:',
                    style: TextStyle(
                      color: TaipmeStyle.primaryColor,
                      fontSize: TaipmeStyle.standardTextSize,
                    ),
                  ),
                ],
              ),
              SizedBox(height: spaceBetweenItems),
              // Usa Align per allineare a destra
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(
                      '_team@taipme.com|',
                      style: TextStyle(
                        color: TaipmeStyle.primaryColor,
                        fontSize: TaipmeStyle.standardTextSize,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
