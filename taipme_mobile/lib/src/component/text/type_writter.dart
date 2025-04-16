import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/controller/typing_controller/typing_controller.dart';

class TypeWriter extends ConsumerWidget {
  const TypeWriter({
    super.key,
    required this.fullText,
    this.onTypingComplete,
    this.typingSpeed = const Duration(milliseconds: 90),
    this.textAlign = TextAlign.center,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 14),
  });

  final String fullText;
  final TextAlign textAlign;
  final TextStyle textStyle;
  final Duration typingSpeed;
  final VoidCallback? onTypingComplete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int charIndex = ref.watch(charIndexProvider(fullText));
    final bool isTypingComplete = ref.watch(isTypingCompleteProvider);

    ref.listen<Timer?>(typingTimerProvider(typingSpeed), (_, timer) {
      if (timer == null && isTypingComplete && onTypingComplete != null) {
        onTypingComplete!();
      }
    });

    return GestureDetector(
      onTap: () {
        ref.read(typingTimerProvider(typingSpeed).notifier).stop();
        ref.read(charIndexProvider(fullText).notifier).complete(fullText);
        ref.read(isTypingCompleteProvider.notifier).setTypingComplete();
        if (onTypingComplete != null) {
          onTypingComplete!();
        }
      },
      child: Text(
        fullText.substring(0, charIndex),
        textAlign: textAlign,
        style: textStyle,
      ),
    );
  }
}
