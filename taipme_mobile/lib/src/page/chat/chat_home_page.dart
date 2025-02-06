import 'package:flutter/material.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/custom_header.dart';
import 'package:taipme_mobile/src/component/custom_footer.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class ChatHomePage extends StatelessWidget {
  const ChatHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedImage = 'home'; // Valore iniziale per l'icona attiva

  void updateImage(String imageName) {
    setState(() {
      selectedImage = imageName;
    });
  }

  int _currentIndex = 0;
  final List<Widget> swiperItems = [
    MessageCard(
        message:
            "Quando meno te l’aspetti, tutto cambia all’improvviso #ottimismo"),
    MessageCard(message: "Le sfide rendono la vita interessante."),
    MessageCard(message: "Con pazienza tutto arriva al momento giusto."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: const CustomHeader(),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(26), // Padding intorno al TextField
              child: TextField(
                decoration: InputDecoration(
                  hintText: '#cerca',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: TaipmeStyle.borderInput),
                  ),
                ),
              )),
          Expanded(
            child: PageView.builder(
              itemCount: swiperItems.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return swiperItems[index];
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Minimizza l'altezza del container
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo/swiper.png',

                  ///Users/diegoalbini/Desktop/Project/taipme/taipme_mobile/assets/images/swiper.png
                  width: 50,
                  height: 50,
                ),
                const SizedBox(height: 16), // Spaziatura tra immagine e bottone
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: TaipmeStyle.backgroundColorInput,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
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
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(
          isChatSelected: false,  // Imposta quale icona è selezionata
          isHomeSelected: true,
          isSettingsSelected: false,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: TaipmeStyle.backgroundColorInput,
      //   onPressed: () => updateImage('home'),
      //   child: const Icon(Icons.home_outlined, color: TaipmeStyle.primaryColor),
      // ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final String message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: TaipmeStyle.borderInput,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            message,
            style:
                const TextStyle(color: TaipmeStyle.primaryColor, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const Spacer(), // Spinge il bottone verso il basso
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: TaipmeStyle.backgroundColorInput,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        '_rispondi',
                        style: TextStyle(color: TaipmeStyle.primaryColor),
                      ),
                      const Spacer(), // Spaziatore per spingere l'icona a destra
                      Transform.rotate(
                        angle: -45 *
                            (3.14159 / 180), // 45 gradi convertiti in radianti
                        child: const Icon(
                          Icons.send,
                          color: TaipmeStyle.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
