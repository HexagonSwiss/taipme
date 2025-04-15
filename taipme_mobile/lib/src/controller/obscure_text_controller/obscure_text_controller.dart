import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'obscure_text_controller.g.dart';

@riverpod
class ObscureTextController extends _$ObscureTextController {
  @override
  bool build(String param) {
    if (param == 'password') return true;
    if (param == 'nuova password') return true;
    if (param == 'conferma password') return true;
    return false;
  }

  void changeVisibility() => state = !state;
}
