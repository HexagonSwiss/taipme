import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/faq_model/faq_model.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/service/faq_service/faq_repository.dart';

part 'faq_controller.g.dart';

@Riverpod(keepAlive: true)
Future<List<FaqModel>?> faqController(Ref ref) async {
  final FaqRepository faqRepository = ref.read(faqRepositoryProvider.notifier);
  final ResultModel<List<FaqModel>> result = await faqRepository.getChatList();
  debugPrint('Controller Result: ${result.data}');
  if (result.error != null) {
    throw Exception(result.error);
  }

  ref.read(faqSyncControllerProvider.notifier).setFaqList(result.data!);

  return result.data;
}

@Riverpod(keepAlive: true)
class FaqSyncController extends _$FaqSyncController {
  @override
  List<FaqModel> build() {
    final List<FaqModel> faqModels = [
      FaqModel(
        idFaq: 1,
        domFaq: "cosa sono i numeri in fondo alla pagina?",
        risFaq:
            'sono i tuoi fogli. hai fino a 5 fogli a disposizione. i fogli li puoi usare per leggere: compariranno i messaggi scritti da altre persone, puoi anche cercare un argomento specifico cliccando su "cerca", se ti piace un messaggio puoi rispondere e utilizzare il foglio per una conversazione privata. puoi usare il foglio anche per scrivere: il tuo messaggio comparirà a sua volta sui fogli di tutte le altre persone, appena riceverai una risposta ti comparirà sul foglio e potrai utilizzarlo per una conversazione privata.',
        datFaq: null,
        codStaFaq: null,
        isExpanded: false,
      ),
      FaqModel(
        idFaq: 2,
        domFaq: "i messaggi sono pubblici o privati?",
        risFaq:
            "finchè nessuno risponde, i messaggi sono pubblici e quindi letti da tutti; appena tu (o un'altra persona) risponde ad un messaggio, la conversazione diventa privata, a quel punto solo le due persone coinvolte potranno leggerla.",
        datFaq: null,
        codStaFaq: null,
        isExpanded: false,
      ),
      FaqModel(
        idFaq: 3,
        domFaq: "come scrivo più messaggi ad una persona?",
        risFaq:
            'non sei su una delle tante "chat". nelle conversazioni private puoi inviare 1 messaggio per volta, la conversazione continua finchè vi rispondete a vicenda. qui vige la qualità, non la quantità. nutri la conversazione.',
        datFaq: null,
        codStaFaq: null,
        isExpanded: false,
      ),
      FaqModel(
        idFaq: 4,
        domFaq: "cosa succede se \"strappo\" un foglio?",
        risFaq:
            "adoriamo la libertà. la conversazione ti sta annoiando? strappa il foglio, in questo modo il tuo foglio ritorna libero e potrai utilizzarlo con un'altra persona. il foglio può essere strappato anche dalla persona con cui stai conversando, in quel caso ti comparirà un messaggio di avviso e potrai utilizzare quel foglio con un'altra persona. w la democrazia.",
        datFaq: null,
        codStaFaq: null,
        isExpanded: false,
      ),
      FaqModel(
        idFaq: 5,
        domFaq: "quanti fogli posso strappare in un giorno?",
        risFaq:
            "massimo cinque. Da queste parti non amiamo lo stress e i compulsivi, vacci piano amico.",
        datFaq: null,
        codStaFaq: null,
        isExpanded: false,
      ),
      FaqModel(
        idFaq: 6,
        domFaq: "come attivo le notifiche?",
        risFaq:
            "non hai ben capito dove ti trovi. Le notifiche, le foto, i numeri, follower e i like li lasciamo alle altre piattaforme. Ti doniamo un ambiente rilassato, non convulsivo. quando e se hai voglia di vedere se qualcuno ti ha risposto, entra. nessuno ti avviserà. Rilassati amico.",
        datFaq: null,
        codStaFaq: null,
        isExpanded: false,
      ),
      FaqModel(
        idFaq: 7,
        domFaq: "è tutto anonimo finchè tu vuoi che lo sia",
        risFaq:
            "nessun nominativo, nickname, foto, email ... nessuno sa chi parla con chi. Ognuno sceglie eventualmente di svelare la propria identità. Sei in un ambiente libero.",
        datFaq: null,
        codStaFaq: null,
        isExpanded: false,
      ),
      FaqModel(
        idFaq: 8,
        domFaq: "com'è garantito un ambiente sano?",
        risFaq:
            "ogni utente è tenuto a seguire la buona educazione. Ad ogni modo, è possibile segnalare eventuali contenuti inappropriati cliccando sul simbolo \"!\" dove presente. In alternativa, inviando la segnalazione tramite la pagina contatti.",
        datFaq: null,
        codStaFaq: null,
        isExpanded: false,
      ),
    ];

    return faqModels;
  }

  void toggleExpansion(int index) {
    if (index < state.length) {
      // Use copyWith to create a new instance with the updated isExpanded value
      final updatedFaq =
          state[index].copyWith(isExpanded: !state[index].isExpanded);
      state = [
        ...state.sublist(0, index),
        updatedFaq,
        ...state.sublist(index + 1),
      ];
    }
  }

  void setFaqList(List<FaqModel> faqList) {
    state = faqList;
  }
}
