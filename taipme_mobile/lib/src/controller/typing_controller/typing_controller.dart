import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'typing_controller.g.dart';

@riverpod
class ClickCount extends _$ClickCount {
  @override
  int build(int maxCount) => 0;

  increment() {
    if (state < maxCount) {
      state++;
      ref.read(isTypingCompleteProvider.notifier).resetTypingComplete();
    }
  }

  decrement() {
    if (state > 0) state--;
  }
}

@riverpod
class IsTypingComplete extends _$IsTypingComplete {
  @override
  bool build() => false;

  setTypingComplete({Function? callback}) {
    state = true;
    if (callback != null) {
      callback();
    }
  }

  resetTypingComplete() {
    state = false;
  }
}

@riverpod
class DisplayedText extends _$DisplayedText {
  @override
  String build(List<String> textList) {
    final clickCount = ref.watch(clickCountProvider(textList.length - 1));

    if (clickCount >= 0 && clickCount < textList.length) {
      return textList[clickCount];
    }

    return textList.isNotEmpty
        ? textList[0]
        : 'No text available'; // TODO: translate
  }
}

@riverpod
class CharIndex extends _$CharIndex {
  @override
  int build(String textLength) => 0;

  void increment(String textLength) {
    if (state < textLength.length) {
      state++;
    }
  }

  void complete(String textLength) {
    state = textLength.length;
  }

  void reset() {
    state = 0;
  }
}

@riverpod
class TypingTimer extends _$TypingTimer {
  @override
  Timer? build(Duration typingSpeed) {
    return null;
  }

  void start(String textLength) {
    state?.cancel();
    state = Timer.periodic(typingSpeed, (timer) {
      final charIndexNotifier =
          ref.read(charIndexProvider(textLength).notifier);
      if (charIndexNotifier.state < textLength.length) {
        charIndexNotifier.increment(textLength);
      } else {
        timer.cancel();
        ref.read(isTypingCompleteProvider.notifier).setTypingComplete();
      }
    });
    state = state;
  }

  void stop() {
    state?.cancel();
    state = null;
  }
}
