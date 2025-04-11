import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class CustomFooter extends ConsumerWidget {
  const CustomFooter({
    super.key,
    required this.isChatSelected,
    required this.isHomeSelected,
    required this.isSettingsSelected,
  });

  final bool isChatSelected;
  final bool isHomeSelected;
  final bool isSettingsSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: TaipmeStyle.backgroundColorInput, // Aggiungi il colore di sfondo
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon Chat
          Transform.translate(
            offset: isChatSelected
                ? Offset(0, -40)
                : Offset(0, 0), // Sposta l'icona verso l'alto se selezionata
            child: Container(
              decoration: BoxDecoration(
                color: TaipmeStyle.backgroundColorInput, // Colore di sfondo
                shape: BoxShape.circle, // Forma circolare
                border: Border.all(
                  color: isChatSelected
                      ? TaipmeStyle.backgroundColor
                      : TaipmeStyle.backgroundColorInput, // Colore del bordo
                  width: 15,
                ),
              ),
              padding: EdgeInsets.all(13),
              child: IconButton(
                onPressed: () {
                  ref.read(goRouterProvider).go('/private-chat-page');
                },
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.white,
                ),
                iconSize: 40, // Dimensione dell'icona
              ),
            ),
          ),
          // Icon Settings
          Transform.translate(
            offset: isHomeSelected
                ? Offset(0, -40)
                : Offset(0, 0), // Sposta l'icona verso l'alto se selezionata
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: TaipmeStyle.backgroundColorInput, // Colore di sfondo
                shape: BoxShape.circle, // Forma circolare
                border: Border.all(
                  color: isHomeSelected
                      ? TaipmeStyle.backgroundColor
                      : TaipmeStyle.backgroundColorInput, // Colore del bordo
                  width: 15,
                ),
              ),
              padding: EdgeInsets.all(13),
              child: IconButton(
                onPressed: () =>
                    ref.read(goRouterProvider).go('/home-page'),
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                iconSize: 40, // Dimensione dell'icona
              ),
            ),
          ),
          // Icon Settings
          Transform.translate(
            offset: isSettingsSelected
                ? Offset(0, -40)
                : Offset(0, 0), // Sposta l'icona verso l'alto se selezionata
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: TaipmeStyle.backgroundColorInput, // Colore di sfondo
                shape: BoxShape.circle, // Forma circolare
                border: Border.all(
                  color: isSettingsSelected
                      ? TaipmeStyle.backgroundColor
                      : TaipmeStyle.backgroundColorInput, // Colore del bordo
                  width: 15,
                ),
              ),
              padding: EdgeInsets.all(13),
              child: IconButton(
                onPressed: () =>
                    ref.read(goRouterProvider).go('/settings-page'),
                icon: Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                ),
                iconSize: 40, // Dimensione dell'icona
              ),
            ),
          ),
        ],
      ),
    );
  }
}
