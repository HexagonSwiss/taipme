import 'package:flutter/material.dart';
import 'package:taipme_mobile/src/component/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:taipme_mobile/src/component/app_bar/custom_header.dart';
import 'package:taipme_mobile/src/component/menu.dart';
import 'package:taipme_mobile/src/component/message_card.dart';
import 'package:taipme_mobile/src/component/wiggling_icon.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

// TODO: GET DATA FROM THE BACKEND

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String selectedImage = 'home'; // Valore iniziale per l'icona attiva
  int currentIndex = 0; // Indice corrente per il PageView

  void updateImage(String imageName) =>
      setState(() => selectedImage = imageName);

  final List<Widget> swiperItems = [
    MessageCard(
        message:
            "Quando meno te l'aspetti, tutto cambia all'improvviso #ottimismo"),
    MessageCard(message: "Le sfide rendono la vita interessante."),
    MessageCard(message: "Con pazienza tutto arriva al momento giusto."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: const CustomHeader(),
      endDrawer: const Menu(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(26), // Padding intorno al TextField
            child: TextField(
              style: const TextStyle(
                color: TaipmeStyle.primaryColor,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: '#cerca',
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: TaipmeStyle.inputFieldBorderColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: swiperItems.length,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (context, index) {
                // Aggiungi margine destro per far vedere la card successiva
                return swiperItems[index];
              },
              // Impostiamo il viewportFraction per far vedere una porzione della card successiva
              controller: PageController(
                viewportFraction: 0.85,
              ), // 85% della larghezza per ogni card
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 16,
              right: 0,
              bottom: 43,
              left: 0,
            ),
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Minimizza l'altezza del container
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WigglingIcon(),
                const SizedBox(height: 16), // Spaziatura tra immagine e bottone
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: TaipmeStyle.appFooterColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                    child: Row(
                      children: [
                        const Text(
                          '_scrivi',
                          style: TextStyle(color: TaipmeStyle.primaryColor),
                        ),
                        const Spacer(), // Spinge l'icona a destra
                        const Icon(Icons.add, color: TaipmeStyle.primaryColor),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
