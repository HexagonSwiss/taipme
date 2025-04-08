import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/custom_header.dart';
import 'package:taipme_mobile/src/component/menu.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class FaqPage extends ConsumerStatefulWidget {
  const FaqPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FaqPageState();
}

class _FaqPageState extends ConsumerState<FaqPage> {
  final List<Map<String, String>> faqList = [
    {
      "question": "cosa sono i numeri in fondo alla pagina?",
      "answer":
          'sono i tuoi fogli. hai fino a 5 fogli a disposizione. i fogli li puoi usare per leggere: compariranno i messaggi scritti da altre persone, puoi anche cercare un argomento specifico cliccando su "cerca", se ti piace un messaggio puoi rispondere e utilizzare il foglio per una conversazione privata. puoi usare il foglio anche per scrivere: il tuo messaggio comparirà a sua volta sui fogli di tutte le altre persone, appena riceverai una risposta ti comparirà sul foglio e potrai utilizzarlo per una conversazione privata.'
    },
    {
      "question": "i messaggi sono pubblici o privati?",
      "answer":
          "finchè nessuno risponde, i messaggi sono pubblici e quindi letti da tutti; appena tu (o un'altra persona) risponde ad un messaggio, la conversazione diventa privata, a quel punto solo le due persone coinvolte potranno leggerla."
    },
    {
      "question": "come scrivo più messaggi ad una persona?",
      "answer":
          'non sei su una delle tante "chat". nelle conversazioni private puoi inviare 1 messaggio per volta, la conversazione continua finchè vi rispondete a vicenda. qui vige la qualità, non la quantità. nutri la conversazione.'
    },
    {
      "question": "cosa succede se \"strappo\" un foglio?",
      "answer":
          "adoriamo la libertà. la conversazione ti sta annoiando? strappa il foglio, in questo modo il tuo foglio ritorna libero e potrai utilizzarlo con un'altra persona. il foglio può essere strappato anche dalla persona con cui stai conversando, in quel caso ti comparirà un messaggio di avviso e potrai utilizzare quel foglio con un'altra persona. w la democrazia."
    },
    {
      "question": "quanti fogli posso strappare in un giorno?",
      "answer":
          "massimo cinque. Da queste parti non amiamo lo stress e i compulsivi, vacci piano amico."
    },
    {
      "question": "come attivo le notifiche?",
      "answer":
          "non hai ben capito dove ti trovi. Le notifiche, le foto, i numeri, follower e i like li lasciamo alle altre piattaforme. Ti doniamo un ambiente rilassato, non convulsivo. quando e se hai voglia di vedere se qualcuno ti ha risposto, entra. nessuno ti avviserà. Rilassati amico."
    },
    {
      "question": "è tutto anonimo finchè tu vuoi che lo sia",
      "answer":
          "nessun nominativo, nickname, foto, email ... nessuno sa chi parla con chi. Ognuno sceglie eventualmente di svelare la propria identità. Sei in un ambiente libero."
    },
    {
      "question": "com'è garantito un ambiente sano?",
      "answer":
          "ogni utente è tenuto a seguire la buona educazione. Ad ogni modo, è possibile segnalare eventuali contenuti inappropriati cliccando sul simbolo \"!\" dove presente. In alternativa, inviando la segnalazione tramite la pagina contatti."
    },
  ];

  List<bool> expanded = [];

  @override
  void initState() {
    super.initState();
    expanded = List.filled(faqList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: const CustomHeader(),
      endDrawer: const Menu(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
          child: ListView.builder(
            itemCount: faqList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    expanded[index] = !expanded[index];
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.white),
                      color: expanded[index] ? Colors.white10 : Colors.black,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          faqList[index]["question"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (expanded[index])
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              faqList[index]["answer"]!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
