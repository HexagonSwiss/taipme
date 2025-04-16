import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/message_model/message_model.dart';
import 'package:taipme_mobile/src/util/enum/message_type_enum.dart';

part 'message_controller.g.dart';

@Riverpod(keepAlive: true)
class MessageController extends _$MessageController {
  @override
  List<MessageModel> build() {
    return <MessageModel>[
      MessageModel(
        idMsg: "1",
        desMsg:
            "Quando meno te l'aspetti, tutto cambia all'improvviso #ottimismo",
        idUteAut: "1",
        dataPub: DateTime.now(),
        datUltMov: DateTime.now(),
        codTipMsg: MessageTypeEnum.public,
      ),
      MessageModel(
        idMsg: "2",
        desMsg: "Le sfide rendono la vita interessante.",
        idUteAut: "2",
        dataPub: DateTime.now(),
        datUltMov: DateTime.now(),
        codTipMsg: MessageTypeEnum.public,
      ),
      MessageModel(
        idMsg: "3",
        desMsg: "Con pazienza tutto arriva al momento giusto.",
        idUteAut: "3",
        dataPub: DateTime.now(),
        datUltMov: DateTime.now(),
        codTipMsg: MessageTypeEnum.public,
      ),
    ];
  }

  void updateStateFromList(List<MessageModel> newList) {
    state = [...state, ...newList];
  }

  void addMessage(MessageModel message) {
    state = [...state, message];
  }

  void removeMessage(int index) {
    state = [...state]..removeAt(index);
  }

  void updateIsSelected(int index) {
    state = [
      for (final message in state)
        if (state.indexOf(message) == index)
          message.copyWith(isCurrent: !message.isCurrent)
        else
          message
    ];
  }
}
