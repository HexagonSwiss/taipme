import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/typingeffect/typing_effect_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _clickCount =
      0; // Variabile per tenere traccia delle volte che è stato cliccato il pulsante
  bool isTypingComplete =
      false; // Stato per tenere traccia se il testo è completo

  void _nextText() {
    if (mounted && isTypingComplete) {
      // Verifica che il testo sia completo prima di incrementare
      setState(() {
        _clickCount++; // Aumenta il contatore ogni volta che il pulsante è premuto
        isTypingComplete =
            false; // Resetta lo stato per indicare che il testo non è ancora completo
      });
    }
  }

  void _goLogin() {
    debugPrint("mounted è: $mounted");  // Stampa: Il numero è: 5
    debugPrint("isTypingComplete è: $isTypingComplete");  // Stampa: Il numero è: 5
    if (mounted && isTypingComplete) {
      // Verifica che il testo sia completo prima di incrementare
debugPrint("SONO DENTRO");  // Stampa
      setState(() {
        ref.read(goRouterProvider).go('/login');
      });
    }
  }

  void _goRegister() {
    if (mounted && isTypingComplete) {
      // Verifica che il testo sia completo prima di incrementare
      setState(() {
        ref.read(goRouterProvider).go('/register');
      });
    }
  }

  void onTypingComplete() {
    setState(() {
      isTypingComplete =
          true; // Imposta su true quando il testo è stato scritto
    });
  }

  void _completeTyping() {
    // Se clicchi in qualsiasi parte della schermata, termina subito la scrittura
    setState(() {
      isTypingComplete = true; // Completa la scrittura
    });
  }

  @override
  Widget build(BuildContext context) {
    String displayedText;

    // Determina quale testo mostrare in base al numero di click
    if (_clickCount == 0) {
      displayedText =
          'TaipMe è un foglio anonimo dove puoi scrivere e leggere pensieri senza like o notifiche. Un ambiente anti-social basato sulla qualità, non sulla quantità';
    } else if (_clickCount == 1) {
      displayedText =
          'Hai 5 fogli a disposizione: scrivi, leggi e, se vuoi, rispondi. Le risposte creano conversazioni private, un messaggio alla volta. Puoi interromperle quando vuoi';
    } else {
      displayedText =
          'I fogli ti permettono di esprimerti liberamente, con leggerezza o profondità. Vivi l’esperienza senza stress, dentro e fuori lo schermo';
    }

    return GestureDetector(
      onTap: _completeTyping, // Completa la scrittura quando si tocca qualsiasi parte dello schermo
      child: Scaffold(
        backgroundColor: TaipmeStyle.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra tutti gli elementi
            children: <Widget>[
              // Contenitore dell'immagine, testo e pulsante con Expanded per mantenere le altezze uniformi
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo/taipme.jpg',
                        width: 250, height: 250),

                    Container(
                      height: 150.0,
                      padding: const EdgeInsets.all(16.0),
                      child: TypingEffectWidget(
                        key: ValueKey(_clickCount), // Forza la ricostruzione del widget
                        fullText: displayedText, // Passa il testo da scrivere
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                          color: TaipmeStyle.inputFieldTextColor,
                          fontSize: TaipmeStyle.miniTextSize,
                        ),
                        typingSpeed: Duration(milliseconds: 90), // Personalizza la velocità
                        onTypingComplete: onTypingComplete, // Imposta il callback quando il testo è completo
                      ),
                    ),

                    // Nascondi il pulsante "_continua" se cliccato due volte
                    if (_clickCount < 2)
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              // Aggiungi la logica per l'accesso
                            },
                            child: Text(
                              '',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: TaipmeStyle.miniTextSize,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: isTypingComplete ? _nextText : _completeTyping,
                            child: Text(
                              '_continua',
                              style: TextStyle(
                                color: TaipmeStyle.inputFieldTextColor,
                                fontSize: TaipmeStyle.miniTextSize,
                              ),
                            ),
                          ),
                        ],
                      ),

                    // Mostra i bottoni "_accedi" e "_registrati" dopo il secondo clic
                    if (_clickCount >= 2)
                      Column(
                        children: [
                          TextButton(
                            onPressed: () => isTypingComplete ? _goLogin() : _completeTyping,
                            child: Text(
                              '_accedi',
                              style: TextStyle(
                                color: TaipmeStyle.inputFieldTextColor,
                                fontSize: TaipmeStyle.miniTextSize,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => _goRegister(),
                            child: Text(
                              '_registrati',
                              style: TextStyle(
                                color: TaipmeStyle.inputFieldTextColor,
                                fontSize: TaipmeStyle.miniTextSize,
                              ),
                            ),
                          ),
                        ],
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
